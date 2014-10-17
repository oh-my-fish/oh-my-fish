# Function to rename files and directories (a.txt rename to a.txt.20140608_195859.bak)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function mvbak --description 'Rename files to make a backup copies'
  __bak mvbak mv $argv
end
