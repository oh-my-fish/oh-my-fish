# Add all defined plugins to fish_function_path.
for plugin in $FISH_PLUGINS
  set fish_function_path $fish_function_path $FISH/plugins/$plugin
end

# Add theme to fish_function_path.
set fish_function_path /Users/bpinto/.oh-my-fish/themes/$FISH_THEME $fish_function_path
