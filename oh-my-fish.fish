# Set fish_custom to the path where your custom config files
# and plugins exist, or use the default custom instead.
if not set -q fish_custom
  set -g fish_custom $fish_path/custom
end

# Extract user defined functions from path and prepend later to
# avoid collisions with oh-my-fish internal functions and allow
# users to override/customize plugins, themes, etc.
set user_function_path $fish_function_path[1]
set -e fish_function_path[1]

# Add functions defined in oh-my-fish/functions to the path.
if not contains $fish_path/functions/ $fish_function_path
  set fish_function_path $fish_path/functions/ $fish_function_path
end


# Add imported plugins, completions and themes. Customize imported
# commands via the $fish_path/custom directory, for example create
# a directory under $fish_path/custom/themes with the same name as
# the theme and override any functions/variables there. Rinse and
# repeat for plugins.
import plugins/$fish_plugins themes/$fish_theme

# Source all files inside custom directory.
for load in $fish_custom/*.load
  . $load
end

# Prepend extracted user functions so they have the highest priority.
set fish_function_path $user_function_path $fish_function_path

# Make sure to exit with $status of 1 when reloading the framework.
or true
