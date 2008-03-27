require 'rake/gempackagetask'

spec = Gem::Specification.new do |spec|
  spec.name        = 'doh'
  spec.version     = '0.1.0'
  spec.summary     = "Doh is a wrapper for svn that stops your commit with a warning if you've forgotten to add some files."
  spec.files       = FileList['TODO', 'bin/*', 'lib/**/*.rb'].to_a
  spec.executables = ['doh']
  spec.author      = 'Matthew Todd'
  spec.email       = 'matthew.todd@gmail.com'
  spec.homepage    = 'http://www.matthewtodd.org'
end

Rake::GemPackageTask.new(spec) do |task|
  task.need_tar = false
  task.need_zip = false
end

desc 'Publish gem to gems.matthewtodd.org'
task :publish => :gem do
  Rake::SshFilePublisher.new('gems.matthewtodd.org', '/users/home/matthew/domains/gems.matthewtodd.org/web/public/gems', 'pkg', spec.file_name).upload
end