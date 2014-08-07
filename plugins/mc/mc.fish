function mc --description "Visual shell for Unix-like systems."
  set -lx SHELL sh
  if which bash > /dev/null
    set SHELL (which bash)
  end
  command mc $argv
end

