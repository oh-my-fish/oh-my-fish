###
# Helper functions
###

function _fish_add_plugin
  set -l plugin $argv[1]
  set -l plugin_path "plugins/$plugin"

  _append_path $fish_path/$plugin_path fish_function_path
  _append_path $fish_custom/$plugin_path fish_function_path
end

function _fish_add_completion
  set -l plugin $argv[1]
  set -l completion_path "plugins/$plugin/completions"

  _append_path $fish_path/$completion_path fish_complete_path
  _append_path $fish_custom/$completion_path fish_complete_path
end

function _fish_source_plugin_load_file
  set -l plugin $argv[1]
  set -l load_file_path "plugins/$plugin/$plugin.load"

  if test -e $fish_path/$load_file_path
    . $fish_path/$load_file_path
  end

  if test -e $fish_custom/$load_file_path
    . $fish_custom/$load_file_path
  end
end

function _fish_load_theme
  _append_path $fish_path/themes/$fish_theme fish_function_path
  _append_path $fish_custom/themes/$fish_theme fish_function_path
end

###
# Configuration
###

# Set fish_custom to the path where your custom config files
# and plugins exists, or else we will use the default custom.
if not set -q fish_custom
  set -g fish_custom  $fish_path/custom
end

# Extracting user's functions – will be added later.
set user_function_path $fish_function_path[1]
set -e fish_function_path[1]

# Add all functions
if not contains $fish_path/functions/ $fish_function_path
  set fish_function_path $fish_path/functions/ $fish_function_path
end

# Add all defined plugins
for plugin in $fish_plugins
  _fish_add_plugin $plugin
  _fish_add_completion $plugin
  _fish_source_plugin_load_file $plugin
end

# Load user defined theme
_fish_load_theme $fish_theme

# Source all files inside custom folder
for config_file in $fish_custom/*.load
  . $config_file
end

# Re-adding user's functions so they have the highest priority
set fish_function_path $user_function_path $fish_function_path
