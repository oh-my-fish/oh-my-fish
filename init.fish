# Set OMF_CONFIG if not set.
if not set -q OMF_CONFIG
  set -q XDG_CONFIG_HOME; or set -l XDG_CONFIG_HOME "$HOME/.config"
  set -gx OMF_CONFIG "$XDG_CONFIG_HOME/omf"
end
# Source custom before.init.fish file
test -f $OMF_CONFIG/before.init.fish
  and source $OMF_CONFIG/before.init.fish ^/dev/null
emit perf:timer:start "Oh My Fish initialisation"
# Read current theme
read -l theme < $OMF_CONFIG/theme
# Prepare Oh My Fish paths
set -l core_function_path $OMF_PATH/lib{,/git}
set -l theme_function_path {$OMF_CONFIG,$OMF_PATH}/themes*/$theme{,/functions}
# Autoload core library
set fish_function_path $fish_function_path[1] \
                       $core_function_path \
                       $theme_function_path \
                       $fish_function_path[2..-1]
# Require all packages
emit perf:timer:start "Oh My Fish init installed packages"
require --path {$OMF_PATH,$OMF_CONFIG}/pkg/*
emit perf:timer:finish "Oh My Fish init installed packages"
# Backup key bindings
functions -q fish_user_key_bindings
  and functions -c fish_user_key_bindings __original_fish_user_key_bindings
# Override key bindings, calling original if existent
function fish_user_key_bindings
  # Read packages key bindings
  for file in {$OMF_CONFIG,$OMF_PATH}/{,pkg,theme}/*/key_bindings.fish
    source $file
  end
  # Read custom key bindings file
  source $OMF_CONFIG/key_bindings.fish ^/dev/null
  # Call original key bindings if existent
  functions -q __original_fish_user_key_bindings
    and __original_fish_user_key_bindings
end
emit perf:timer:start "Oh My Fish init user config path"
require --no-bundle --path $OMF_CONFIG
emit perf:timer:finish "Oh My Fish init user config path"
set -g OMF_VERSION "2"
emit perf:timer:finish "Oh My Fish initialisation"
