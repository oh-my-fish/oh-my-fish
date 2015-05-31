# NAME
#   omf.log - simple log with color
#
# SYNOPSIS
#   <string> [<string>...]
#
# DESCRIPTION
#   Simply log a message with a specified color.
#
function omf.log -d "Simple log with color"
  switch $argv[1]
    case '-*'
      echo $argv[1] (set_color $argv[2])$argv[3..-1](set_color normal)
    case '*'
      echo -e (set_color $argv[1])$argv[2..-1](set_color normal)
  end
end
