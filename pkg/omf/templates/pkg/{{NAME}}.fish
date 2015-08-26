# SYNOPSIS
#   {{NAME}} [options]
#
# USAGE
#   Options
#

function init -a path --on-event init_{{NAME}}

end

function {{NAME}} -d "My package"

end

function uninstall --on-event uninstall_{{NAME}}

end
