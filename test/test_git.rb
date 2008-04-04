require 'test/unit'
require 'tmpdir'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'doh'


class TestGit < Test::Unit::TestCase
  def test_none
    assert_equal [], git.unadded_files
  end

  def test_untracked_file
    `touch foo`
    assert git.unadded_files.include?("#\tfoo\n")
  end

  def test_modified_file
    `touch foo`
    `git add foo`
    `git commit -m 'Initial commit'`
    File.open('foo', 'w') { |foo| foo.write('modified') }
    assert git.unadded_files.include?("#\tmodified:   foo\n")
  end

  def test_deleted_file
    `touch foo`
    `git add foo`
    `git commit -m 'Initial commit'`
    `rm foo`
    assert git.unadded_files.include?("#\tdeleted:    foo\n")
  end

  def test_modified_file_dash_a
    `touch foo`
    `git add foo`
    `git commit -m 'Initial commit'`
    File.open('foo', 'w') { |foo| foo.write('modified') }
    assert_equal [], git('-a').unadded_files
  end

  def test_deleted_file_dash_a
    `touch foo`
    `git add foo`
    `git commit -m 'Initial commit'`
    `rm foo`
    assert_equal [], git('-a').unadded_files
  end

  def test_subdirectory
    `mkdir bar`
    assert_equal [], git.unadded_files
  end

  def test_subdirectory_with_untracked_file
    `mkdir bar`
    `touch bar/foo`
    assert git.unadded_files.include?("#\tbar/\n")
  end


  protected

  def setup
    @old_dir = Dir.pwd

    @dir = File.join(Dir.tmpdir, "test_git.#{Process.pid}")
    `mkdir -p #{@dir}`
    Dir.chdir(@dir)

    `git init`
  end

  def teardown
    Dir.chdir(@old_dir)
    `rm -rf #{@dir}`
  end


  private

  def git(*args)
    Doh::Scm::Git.new(args)
  end

  def assert(boolean, message=`git status`)
    super
  end

  def assert_equal(expected, actual, message=`git status`)
    super
  end
end