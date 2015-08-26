# SYNOPSIS
#   refresh
#
# OVERVIEW
#   Refresh (reload) the current fish session.

function refresh -d "refresh the fish session"
  exec fish < /dev/tty
end
