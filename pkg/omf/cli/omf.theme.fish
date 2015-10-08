function omf.theme -a target_theme
  set -l current_theme (cat $OMF_CONFIG/theme)
  test "$target_theme" = "$current_theme"; and return 0

  set -l prompt_filename "fish_prompt.fish"
  set -l user_functions_path (omf.xdg.config_home)/fish/functions

  mkdir -p "$user_functions_path"

  if not omf.check.fish_prompt
    echo (omf::err)"Conflicting prompt setting."(omf::off)
    echo "Run "(omf::em)"omf doctor"(omf::off)" and fix issues before continuing."
    return 1
  end

  # Replace autoload paths of current theme with the target one
  autoload -e {$OMF_CONFIG,$OMF_PATH}/themes/$current_theme
  autoload {$OMF_CONFIG,$OMF_PATH}/themes/$target_theme

  # Find target theme's fish_prompt and link to user function path
  for path in {$OMF_CONFIG,$OMF_PATH}/themes/$target_theme/$prompt_filename
    if test -e $path
      ln -sf $path $user_functions_path/$prompt_filename; and break
    end
  end

  # Persist the changes
  echo "$target_theme" > "$OMF_CONFIG/theme"

  return 0
end
