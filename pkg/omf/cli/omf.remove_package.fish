function omf.remove_package

  set -l pkg $argv
  set -l remove_status 1

  if not omf.util_valid_package $pkg
    if test $pkg = "omf" -o $pkg = "default"
      echo (omf::err)"You can't remove `$pkg`"(omf::off) 1^&2
    else
      echo (omf::err)"$pkg is not a valid package/theme name"(omf::off) 1^&2
    end
    return $OMF_INVALID_ARG
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/{pkg}/$pkg
    not test -d $path; and continue

    source $path/uninstall.fish ^/dev/null; and emit uninstall_$pkg
    omf.bundle.remove "package" $pkg

    rm -rf $path
    set remove_status $status
  end

  for path in {$OMF_PATH,$OMF_CONFIG}/{themes}/$pkg
    not test -d $path; and continue

    if test $pkg = (cat $OMF_CONFIG/theme)
      echo default > $OMF_CONFIG/theme
    end

    omf.bundle.remove "theme" $pkg

    rm -rf $path
    set remove_status $status
  end

  if test $remove_status -eq 0
    echo (omf::em)"$pkg successfully removed."(omf::off)
  else
    echo (omf::err)"$pkg could not be found"(omf::off) 1^&2
  end
  return $remove_status
end
