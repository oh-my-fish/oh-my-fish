# SYNOPSIS
#   require [name]
#
# OVERVIEW
#   Require a plugin:
#     - Autoload its functions and completions.
#     - Source its initialization file.
#     - Emit its initialization event.
#
#   If the required plugin has already been loaded, does nothing.
#   If the required plugin does not exist, return an error code and send a message to stderr.

function require -a name
  # Skip if plugin has already been loaded.
  echo $fish_function_path | grep -q /pkg/$name; and return 0

  set -l plugin_exist "false"

  for path in {$OMF_PATH,$OMF_CONFIG}/pkg/$name
    if autoload $path $path/completions
      set plugin_exist "true"

      source $path/$name.fish ^/dev/null
      emit init_$name $path
    end
  end

  if test $plugin_exist = "true"
    return 0
  else
    echo "$name plugin is not installed." 1^&2; return 1
  end
end
