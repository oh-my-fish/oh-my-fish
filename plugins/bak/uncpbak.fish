# Function to copy files and directories (a.txt.20140608_195859.bak copy to a.txt)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function uncpbak --description 'Copy files to revert a backup copies to a normal files'
  __unbak uncpbak 'cp -a' $argv
end
