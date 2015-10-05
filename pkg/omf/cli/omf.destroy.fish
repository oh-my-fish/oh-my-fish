function omf.destroy -d "Remove Oh My Fish"
  echo (omf::dim)"Removing Oh My Fish..."(omf::off)

  for pkg in (basename $OMF_PATH/pkg/*)
    emit uninstall_$pkg
  end

  set -l fish_config "$XDG_CONFIG_HOME/fish"
  if test "$fish_config" = "/fish"
    set fish_config $HOME/.config/fish
  end

  set -l find_argument
  if find -version ^/dev/null| grep -q GNU
    set find_argument -regextype posix-basic
  end;
  set -l localbackup (find $fish_config $find_argument -regex '^.*fish/config\.[[:digit:]]\+\.copy$' |\
    sort -r |head -1)
  if test -n $localbackup
    mv $localbackup "$fish_config/config.fish"
  end

  if test "$OMF_PATH" != "$HOME"
    rm -rf "$OMF_PATH"
  end

  set -q CI; or exec fish < /dev/tty
end
