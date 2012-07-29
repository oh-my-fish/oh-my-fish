###
# Helper functions
###

function _fish_add_plugin
  set -l plugin $argv[1]
  set -l plugin_path "plugins/$plugin"

  if test -d $FISH/$plugin_path
    set fish_function_path $FISH/$plugin_path $fish_function_path
  end

  if test -d $FISH_CUSTOM/$plugin_path
    set fish_function_path $FISH_CUSTOM/$plugin_path $fish_function_path
  end
end

function _fish_add_completion
  set -l plugin $argv[1]
  set -l completion_path "plugins/$plugin/completions"

  if test -d $FISH/$completion_path
    set fish_complete_path $FISH/$completion_path $fish_complete_path
  end

  if test -d $FISH_CUSTOM/$completion_path
    set fish_complete_path $FISH_CUSTOM/$completion_path $fish_complete_path
  end
end

###
# Configuration
###

# Set FISH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom.
if not set -q FISH_CUSTOM
  set -g FISH_CUSTOM  $FISH/custom
end

# Extracting user's functions – will be added later.
set user_function_path $fish_function_path[1]
set -e fish_function_path[1]

# Add all functions
set fish_function_path $FISH/functions/ $fish_function_path

# Add all defined plugins
for plugin in $FISH_PLUGINS
  _fish_add_plugin $plugin
  _fish_add_completion $plugin
end

# Add user defined theme
set fish_function_path $FISH/themes/$FISH_THEME $fish_function_path

# Source all files inside custom folder
for config_file in $FISH_CUSTOM/*.fish
  . $config_file
end

# Re-adding user's functions so they have the highest priority
set fish_function_path $user_function_path $fish_function_path
