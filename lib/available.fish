# SYNOPSIS
#   available [name]
#
# OVERVIEW
#   Check if a program is available.

function available -a name -d "Check if a program is available."
  type "$name" ^/dev/null >&2
end
