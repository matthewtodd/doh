class Doh
  class Svn
    def initialize(*args)
      @args = args
    end

    def committing?
      @args.include?('ci') or @args.include?('commit')
    end

    def unadded_files
      `svn st`.grep /^\?/
    end

    def proceed
      exec 'svn', *@args
    end
  end
end