require 'test/unit'
require 'fileutils'
require 'tmpdir'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'doh'


class TestGit < Test::Unit::TestCase
  def test_unadded_files_when_none
    dir do
      assert_equal [], @git.unadded_files, `git status`
    end
  end

  def test_unadded_files_with_one_top_level_untracked_file
    dir do
      FileUtils.touch('foo')
      assert @git.unadded_files.include?("#\tfoo\n"), `git status`
    end
  end
  
  def test_unadded_files_with_one_top_level_modified_file
    dir do
      FileUtils.touch('foo')
      `git add foo`
      `git commit -m 'Initial commit'`
      File.open('foo', 'w') { |foo| foo.write('modified') }
      assert @git.unadded_files.include?("#\tmodified:   foo\n"), `git status`
    end
  end
  
  def test_unadded_files_with_one_subdirectory
    dir do
      FileUtils.mkdir('bar')
      assert_equal [], @git.unadded_files, `git status`
    end
  end

  def test_unadded_files_with_one_subdirectory_untracked_file
    dir do
      FileUtils.mkdir('bar')
      FileUtils.touch('bar/foo')
      assert @git.unadded_files.include?("#\tbar/\n"), `git status`
    end
  end


  protected

  def setup
    @dir = File.join(Dir.tmpdir, "test_git.#{Process.pid}")
    FileUtils.mkdir_p(@dir)    
    dir { `git init` }
    @git = Doh::Scm::Git.new([])
  end

  def teardown
    FileUtils.rm_rf(@dir)
  end


  private

  def dir
    Dir.chdir(@dir) { yield }
  end
end