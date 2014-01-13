# Force tmux to assume the terminal supports 256 colours.

function tmux
  command tmux -2 $argv
end
