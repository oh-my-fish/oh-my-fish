# Function to copy files and directories (a.txt copy to a.txt.20140608_195859.bak)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function cpbak
  __bak 'cp -a' $argv
end
