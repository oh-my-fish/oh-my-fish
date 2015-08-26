# SYNOPSIS
#   available [name]
#
# OVERVIEW
#   Check if a program is available.

function available -a program -d "check if a program is available."
  type "$program" ^/dev/null >&2
end
