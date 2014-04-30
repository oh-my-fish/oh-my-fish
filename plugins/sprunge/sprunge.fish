# Just a sprunge wrapper for fish-shell
# Paul Joannon (paulloz) <paul.joannon@gmail.com>
# https://github.com/Paulloz/fish-sprunge
# Based on oh-my-zsh's sprunge plugin

function sprunge
  if isatty
    if [ (count $argv) -gt 0 ]
      if [ -f $argv ]
        cat $argv
      else
        echo $argv
      end | curl -F 'sprunge=<-' http://sprunge.us
    else
      echo -e "Usage:
    * sprunge < README.md
    * sprunge README.md
    * cat README.md | sprunge
    * sprunge "I \<3 paulloz""
    end
  else
    curl -F 'sprunge=<-' http://sprunge.us
  end
end
