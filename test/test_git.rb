require 'test/unit'
require 'tmpdir'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'doh'


class TestGit < Test::Unit::TestCase
  def test_none
    dir do
      assert_equal [], git.unadded_files
    end
  end

  def test_untracked_file
    dir do
      `touch foo`
      assert git.unadded_files.include?("#\tfoo\n")
    end
  end
  
  def test_modified_file
    dir do
      `touch foo`
      `git add foo`
      `git commit -m 'Initial commit'`
      File.open('foo', 'w') { |foo| foo.write('modified') }
      assert git.unadded_files.include?("#\tmodified:   foo\n")
    end
  end
  
  def test_deleted_file
    dir do
      `touch foo`
      `git add foo`
      `git commit -m 'Initial commit'`
      `rm foo`
      assert git.unadded_files.include?("#\tdeleted:    foo\n")
    end
  end
  
  def test_modified_file_dash_a
    dir do
      `touch foo`
      `git add foo`
      `git commit -m 'Initial commit'`
      File.open('foo', 'w') { |foo| foo.write('modified') }
      assert_equal [], git('-a').unadded_files
    end
  end
  
  def test_deleted_file_dash_a
    dir do
      `touch foo`
      `git add foo`
      `git commit -m 'Initial commit'`
      `rm foo`
      assert_equal [], git('-a').unadded_files
    end
  end
  
  def test_subdirectory
    dir do
      `mkdir bar`
      assert_equal [], git.unadded_files
    end
  end

  def test_subdirectory_with_untracked_file
    dir do
      `mkdir bar`
      `touch bar/foo`
      assert git.unadded_files.include?("#\tbar/\n")
    end
  end
  

  protected

  def setup
    @dir = File.join(Dir.tmpdir, "test_git.#{Process.pid}")
    `mkdir -p #{@dir}`
    dir { `git init` }
  end

  def teardown
    `rm -rf #{@dir}`
  end


  private

  def assert(boolean, message=`git status`)
    super
  end
  
  def assert_equal(expected, actual, message=`git status`)
    super
  end
  
  # TODO see if I can get Dir.chdir to work with out a block, so I don't have
  # to say dir { ... } in every test.
  def dir
    Dir.chdir(@dir) { yield }
  end
  
  def git(*args)
    @git = Doh::Scm::Git.new(args)
  end
end