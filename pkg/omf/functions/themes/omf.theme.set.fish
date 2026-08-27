function omf.theme.set -a target_theme
  if not test -d $OMF_PATH/themes/$target_theme -o -d $OMF_CONFIG/themes/$target_theme
    return $OMF_INVALID_ARG
  end

  if test -f $OMF_CONFIG/theme
    read current_theme < $OMF_CONFIG/theme
    test "$target_theme" = "$current_theme"; and return 0
  end

  # Replace autoload paths of current theme with the target one
  set -q current_theme
    and autoload -e {$OMF_CONFIG,$OMF_PATH}/themes/$current_theme{,/functions}
  set -l theme_path {$OMF_CONFIG,$OMF_PATH}/themes*/$target_theme{,/functions}
  autoload $theme_path

  # Point the user's fish_prompt.fish at the target theme (or remove a stale one).
  omf.theme.link_prompt $target_theme
    or return $OMF_UNKNOWN_ERR

  # Reload fish key bindings if reload is available and needed
  functions -q __fish_reload_key_bindings
    and test -e $OMF_CONFIG/key_bindings.fish -o -e $OMF_PATH/key_bindings.fish
    and __fish_reload_key_bindings

  # Load target theme's conf.d files
  for conf in {$OMF_CONFIG,$OMF_PATH}/themes/$target_theme/conf.d/*.fish
    source $conf
  end

  # Persist the changes
  echo "$target_theme" > "$OMF_CONFIG/theme"

  return 0
end
