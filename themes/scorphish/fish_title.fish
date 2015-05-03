function fish_title
  [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" ]; and printf '%s %s' $_ (pwd); and return
  printf '%s %s' (basename "$VIRTUAL_ENV") (pwd)
end