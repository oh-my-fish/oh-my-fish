#!/usr/local/bin/fish
# This script will create a symbolic link between all themes included in oh-my-fish to the sample prompts
# This will allow the user to choose an oh-my-fish theme while using the stock fish_config web application
for themePath in (ls $fish_path/themes/*/fish_prompt.fish)
    set themeName (echo $themePath | sed "s/.*themes\///;s/\/fish_prompt.fish//")
    echo "Adding $themeName to the sample prompts"
    ln -sf $themePath $__fish_datadir/tools/web_config/sample_prompts/$themeName.fish
end
