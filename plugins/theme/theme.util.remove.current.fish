function theme.util.remove.current
  # Find previously loaded theme index in function path.
  set -l index (contains -i -- \
    $fish_custom/themes/$fish_theme $fish_function_path)

  if test $status -gt 0
  # Not a custom theme, try a default theme.
    set index (contains -i -- \
      $fish_path/themes/$fish_theme $fish_function_path)
  end

  if test -n "$index"
    # So Long, and Thanks for All the Fish.
    set -e fish_function_path[$index]
  end
end
