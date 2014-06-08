# Function to rename files and directories (a.txt -> a.txt.20140608_195859.bak)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function bak
  for arg in $argv
    # trim / for directories
    set arg (echo $arg | sed "s/\///")
    mv $arg $arg.(date +"%Y%m%d_%H%M%S").bak
  end
end
