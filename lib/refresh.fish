# SYNOPSIS
#   refresh
#
# OVERVIEW
#   Refresh (reload) the current fish session.

function refresh -d "Refresh fish session by replacing current process"
  if not set -q CI
    history --save
    exec fish < /dev/tty
  end
end
