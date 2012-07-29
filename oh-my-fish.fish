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
  set fish_function_path $FISH/plugins/$plugin $fish_function_path

  # Add plugin completion
  if test -e $FISH/plugins/$plugin/completions
    set fish_complete_path $FISH/plugins/$plugin/completions $fish_complete_path
  end
end

# Add user defined theme
set fish_function_path $FISH/themes/$FISH_THEME $fish_function_path

# Add all custom plugins
for plugin in $FISH_CUSTOM/plugins/*
  set fish_function_path $plugin $fish_function_path

  # Add plugin completion
  if test -e $plugin/completions
    set fish_complete_path $plugin/completions $fish_complete_path
  end
end

# Source all files inside custom folder
for config_file in $FISH_CUSTOM/*.fish
  . $config_file
end

# Re-adding user's functions so they have the highest priority
set fish_function_path $user_function_path $fish_function_path
