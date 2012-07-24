# Add all functions to fish_funtion_path.
set fish_function_path $FISH/functions/ $fish_function_path

# Add all defined plugins to fish_function_path.
for plugin in $FISH_PLUGINS
  set fish_function_path $FISH/plugins/$plugin $fish_function_path
end

# Add theme to fish_function_path.
set fish_function_path /Users/bpinto/.oh-my-fish/themes/$FISH_THEME $fish_function_path
