# SYNOPSIS
#   refresh
#
# OVERVIEW
#   Refresh (reload) the current fish session.

function refresh -d "refresh the fish session"
  set -q CI; or exec fish < /dev/tty
end
