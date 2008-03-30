class Doh::Cli
  def initialize(args)
    @args = args
    @scm  = Doh::Scm.const_get(@args.first.capitalize).new(@args)
  rescue
    $stderr.puts "Doh doesn't yet know how to support #{@args.first}. Perhaps you can help!"
    exit 1
  end

  def run
    exit_with_error if @scm.committing_with_unadded_files?
    exec *@args
  end


  private

  def exit_with_error
    $stderr.puts red(DOH)
    $stderr.puts @scm.unadded_files
    exit 1
  end

  def red(string)
    "\e[31m#{string}\e[0m"
  end

  # Ascii-art from http://www.schnoggo.com/figlet.html
  # Selecting, appropriately, the font named "doh.flf"
  DOH = <<-END.gsub(/^    /, '') #:nodoc:
    DDDDDDDDDDDDD                         hhhhhhh                     
    D::::::::::::DDD                      h:::::h                     
    D:::::::::::::::DD                    h:::::h                     
    DDD:::::DDDDD:::::D                   h:::::h                     
      D:::::D    D:::::D    ooooooooooo    h::::h hhhhh               
      D:::::D     D:::::D oo:::::::::::oo  h::::hh:::::hhh            
      D:::::D     D:::::Do:::::::::::::::o h::::::::::::::hh          
      D:::::D     D:::::Do:::::ooooo:::::o h:::::::hhh::::::h         
      D:::::D     D:::::Do::::o     o::::o h::::::h   h::::::h        
      D:::::D     D:::::Do::::o     o::::o h:::::h     h:::::h        
      D:::::D     D:::::Do::::o     o::::o h:::::h     h:::::h        
      D:::::D    D:::::D o::::o     o::::o h:::::h     h:::::h        
    DDD:::::DDDDD:::::D  o:::::ooooo:::::o h:::::h     h:::::h        
    D:::::::::::::::DD   o:::::::::::::::o h:::::h     h:::::h ...... 
    D::::::::::::DDD      oo:::::::::::oo  h:::::h     h:::::h .::::. 
    DDDDDDDDDDDDD           ooooooooooo    hhhhhhh     hhhhhhh ......
  END
end