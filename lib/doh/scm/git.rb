class Doh::Scm::Git < Doh::Scm::Base
  def committing?
    @args.include?('commit')
  end

  def unadded_files
    untracked_files = false
    `git status`.grep(/^#/).select do |line|
      untracked_files = true if line =~ /(Changed but not updated:)|(Untracked files:)/
      untracked_files
    end
  end
end
