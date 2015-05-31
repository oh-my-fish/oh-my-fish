# Set fish_custom to the path where your custom config files
# and plugins exist, or use the default custom instead.
if not set -q fish_custom
  set -g fish_custom $fish_path/custom
end

# Add functions defined in oh-my-fish/functions to the path.
if not contains $fish_path/functions/ $fish_function_path
  set fish_function_path $fish_path/functions/ $fish_function_path
end

if set -q fish_plugins
  set_color red
  echo '$fish_plugins usage has been deprecated. Please see https://asciinema.org/a/20802.'
  set_color normal
end

if set -q fish_theme
  set_color red
  echo '$fish_theme usage has been deprecated. Please see https://asciinema.org/a/20802.'
  set_color normal
end

# Add imported plugins, completions and themes. Customize imported
# commands via the $fish_path/custom directory, for example create
# a directory under $fish_path/custom/themes with the same name as
# the theme and override any functions/variables there. Rinse and
# repeat for plugins.
import plugins/$fish_plugins themes/$fish_theme

# Always load oh-my-fish plugin
import plugins/omf

# Source all files inside custom directory.
for load in $fish_custom/*.load
  . $load
end

# Make sure to exit with $status of 1 when reloading the framework.
or true
