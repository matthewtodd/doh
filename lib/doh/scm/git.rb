class Doh::Scm::Git < Doh::Scm::Base
  def committing?
    @args.include?('commit')
  end

  def unadded_files
    pattern = if @args.include?('-a')
      /(Untracked files:)/
    else
      /(Untracked files:)|(Changed but not updated:)/
    end
    
    warn = false
    `git status`.grep(/^#/).select do |line|
      warn = true if line =~ pattern
      warn
    end
  end
end
