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
    source $path/uninstall.fish ^/dev/null;
      and emit uninstall_$pkg

    if rm -rf $path
      omf.bundle.remove "package" $pkg
      return 0
    else
      return 1
    end
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/themes/$pkg
    test -d $path;
      and set found;
      or continue

    test $pkg = (cat $OMF_CONFIG/theme);
      and echo default > $OMF_CONFIG/theme

    if rm -rf $path
      omf.bundle.remove "theme" $pkg
      return 0
    else
      return 1
    end
  end

  set -q found; or return 2
end
