require 'rubygems'
require 'rake/gemreleasetask'

spec = Gem::Specification.new do |spec| 
  spec.name             = 'doh'
  spec.version          = '0.2.1'
  spec.summary          = "Doh stops your git or svn commit with a warning if you've forgotten to add some files."
  spec.files            = FileList['README', 'CHANGELOG', 'TODO', 'bin/*', 'lib/**/*.rb'].to_a
  spec.executables      = ['doh']
  spec.has_rdoc         = true
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
  spec.homepage         = 'http://docs.matthewtodd.org/doh'
end

Rake::GemReleaseTask.new(spec) do |task|
  task.remote_gem_host  = 'woodward'
  task.remote_gem_dir   = '/users/home/matthew/domains/gems.matthewtodd.org/web/public'
  task.remote_docs_host = 'woodward'
  task.remote_docs_dir  = '/users/home/matthew/domains/docs.matthewtodd.org/web/public/doh'
end
