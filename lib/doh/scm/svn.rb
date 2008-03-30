class Doh::Scm::Svn < Doh::Scm::Base
  def committing?
    @args.include?('ci') or @args.include?('commit')
  end

  def unadded_files
    `svn st`.grep /^\?/
  end
end
