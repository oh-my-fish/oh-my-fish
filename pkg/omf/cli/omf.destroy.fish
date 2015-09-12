function omf.destroy -d "Remove Oh My Fish"
  echo (omf::dim)"Removing Oh My Fish..."(omf::off)

  for pkg in (basename $OMF_PATH/pkg/*)
    omf.remove_package $pkg >/dev/null ^&1
  end

  if test -e "$HOME/.config/fish/config.copy"
    mv "$HOME/.config/fish/config".{copy,fish}
  end

  if test "$OMF_PATH" != "$HOME"
    rm -rf "$OMF_PATH"
  end

  exec fish < /dev/tty
end
