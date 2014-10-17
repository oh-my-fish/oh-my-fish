# Function to move files and directories (a.txt.20140608_195859.bak move to a.txt)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function unmvbak --description 'Move files to revert a backup copies to a normal files'
  __unbak unmvbak mv $argv
end
