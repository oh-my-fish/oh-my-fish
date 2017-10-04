function omf.theme.set -a target_theme
  if not contains "$target_theme" (omf.packages.list --theme)
    echo (omf::err)"Theme not installed!"(omf::off)
    echo Install it using (omf::em)omf install $target_theme(omf::off)
    return $OMF_INVALID_ARG
  end

  if test -f $OMF_CONFIG/theme
    read current_theme < $OMF_CONFIG/theme
    test "$target_theme" = "$current_theme"; and return 0
  end

  set -l prompt_filename "fish_prompt.fish"
  set -l user_functions_path (omf.xdg.config_home)/fish/functions

  mkdir -p "$user_functions_path"

  if not omf.check.fish_prompt
    echo (omf::err)"Conflicting prompt setting."(omf::off)
    echo "Run "(omf::em)"omf doctor"(omf::off)" and fix issues before continuing."
    return $OMF_INVALID_ARG
  end

  # Replace autoload paths of current theme with the target one
  set -q current_theme
    and autoload -e {$OMF_CONFIG,$OMF_PATH}/themes/$current_theme{,/functions}
  set -l theme_path {$OMF_CONFIG,$OMF_PATH}/themes*/$target_theme{,/functions}
  autoload $theme_path

  # Reload fish key bindings if reload is available and needed
  functions -q __fish_reload_key_bindings
    and test (count {$OMF_CONFIG,$OMF_PATH}/key_binding?.fish) -gt 0
    and __fish_reload_key_bindings

  # Persist the changes
  echo "$target_theme" > "$OMF_CONFIG/theme"

  return 0
end
