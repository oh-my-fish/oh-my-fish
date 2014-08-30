# Function to copy files and directories (a.txt copy to a.txt.20140608_195859.bak)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function cpbak --description 'Copy files to make a backup copies'
  __bak cpbak 'cp -a' $argv
end
