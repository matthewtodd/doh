Gem::Specification.new do |s|
  s.name = %q{doh}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2008-10-10}
  s.default_executable = %q{doh}
  s.email = %q{matthew.todd@gmail.com}
  s.executables = ["doh"]
  s.extra_rdoc_files = ["README", "CHANGELOG", "TODO"]
  s.files = ["README", "CHANGELOG", "TODO", "bin/doh", "lib/doh/cli.rb", "lib/doh/scm/base.rb", "lib/doh/scm/git.rb", "lib/doh/scm/svn.rb", "lib/doh/scm.rb", "lib/doh.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README", "--title", "doh-0.2.4", "--inline-source", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Doh stops your git or svn commit with a warning if you've forgotten to add some files.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
