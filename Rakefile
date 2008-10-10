require 'rubygems'

spec = Gem::Specification.new do |spec|
  spec.name             = 'doh'
  spec.version          = '0.2.3'
  spec.summary          = "Doh stops your git or svn commit with a warning if you've forgotten to add some files."
  spec.files            = FileList['README', 'CHANGELOG', 'TODO', 'bin/*', 'lib/**/*.rb'].to_a
  spec.executables      = ['doh']
  spec.has_rdoc         = true
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end
