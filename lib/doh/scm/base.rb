class Doh::Scm::Base
  def initialize(args)
    @args = args
  end

  def committing_with_unadded_files?
    committing? and unadded_files.any?
  end
end
