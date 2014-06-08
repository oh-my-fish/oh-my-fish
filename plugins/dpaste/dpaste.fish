# Just a dpaste (https://github.com/bartTC/dpaste) wrapper for fish-shell
# Roman Inflianskas (rominf) <infroma@gmail.com>
# Based on fish-sprunge plugin:
# Paul Joannon (paulloz) <paul.joannon@gmail.com>
# https://github.com/Paulloz/fish-sprunge
# Based on oh-my-zsh's sprunge plugin

if test -z $dpaste_keyword 
  set dpaste_keyword content
end
if test -z $dpaste_url
  set dpaste_url https://dpaste.de/api/
end

function dpaste_send
  curl -F "$dpaste_keyword=<-" $dpaste_url 2> /dev/null | sed "s/.*\"\(.*\)\".*/\1\n/"
end

function dpaste
  if isatty
    if [ (count $argv) -gt 0 ]
      if [ -f $argv ]
        cat $argv
      else
        echo $argv
      end | dpaste_send
    else
      echo -e "Usage:
    * dpaste < README.md
    * dpaste README.md
    * cat README.md | dpaste
    * dpaste "I \<3 to paste""
    end
  else
    dpaste_send
  end
end
