require 'doh/svn'

class Doh
  # Ascii-art from http://www.schnoggo.com/figlet.html
  # Selecting, appropriately, the font named "doh.flf"
  BIG_DOH = <<-END.gsub(/^    /, '')
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
  
  def initialize(*args)
    @scm = Doh::Svn.new(*args)
  end
  
  def run
    if @scm.committing? and @scm.unadded_files.any?
      exit_with_error
    else
      @scm.proceed
    end
  end
  
  private
  
  def exit_with_error
    puts red(BIG_DOH)
    puts @scm.unadded_files
    exit 1
  end
  
  def red(string)
    "\e[31m#{string}\e[0m"
  end
end