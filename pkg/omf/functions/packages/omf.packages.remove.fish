function omf.packages.remove -a pkg

  if not omf.packages.valid_name $pkg
    echo (omf::err)"$pkg is not a valid package/theme name"(omf::off) >&2
    return $OMF_INVALID_ARG
  end

  if test $pkg = "omf" -o $pkg = "default"
    echo (omf::err)"You can't remove `$pkg`"(omf::off) >&2
    return $OMF_INVALID_ARG
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/pkg/$pkg
    test -d $path;
      and set found;
      or continue

    # Run uninstall hook first.
    omf.packages.run_hook $path uninstall
    if test -f $path/uninstall.fish
      source $path/uninstall.fish 2> /dev/null
    end
    emit uninstall_$pkg
    emit {$pkg}_uninstall

    command rm -rf $path
      or return 1
  end

  if set -q found
    omf.bundle.remove "package" $pkg
    return 0
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/themes/$pkg
    test -d $path;
      and set found;
      or continue

    set -l current_theme (cat $OMF_CONFIG/theme 2> /dev/null)
    test "$pkg" = "$current_theme";
      and echo default > $OMF_CONFIG/theme

    command rm -rf $path
      or return 1
  end

  if set -q found
    omf.bundle.remove "theme" $pkg
    return 0
  end

  set -q found; or return 2
end
