function omf.destroy -d "Remove Oh My Fish"
  echo (omf::dim)"Removing Oh My Fish..."(omf::off)

  for pkg in (basename $OMF_PATH/pkg/*)
    omf.remove_package $pkg >/dev/null ^&1
  end

  set -l fish_config $XDG_CONFIG_HOME/fish
  if test "$fish_config" = "/fish"
    set fish_config $HOME/.config/fish
  end

  set -l localbackup (find $fish_config -regextype posix-extended -regex '^.*fish/config\.[[:digit:]]+\.copy$' |\
    sort -r |head -1)
  if test -n $localbackup
    mv $localbackup "$fish_config/config.fish"
  end

  if test "$OMF_PATH" != "$HOME"
    rm -rf "$OMF_PATH"
  end

  exec fish < /dev/tty
end
