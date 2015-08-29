function omf.remove_package
  for pkg in $argv
    set -l remove_status 1

    if not omf.util_valid_package $pkg
      if test $pkg = "omf"
        echo (omf::err)"You can't remove `omf`"(omf::off) 1^&2
      else
        echo (omf::err)"$pkg is not a valid package/theme name"(omf::off) 1^&2
      end
      return $OMF_INVALID_ARG
    end

    for path in {$OMF_PATH,$OMF_CONFIG}/{pkg}/$pkg
      not test -d $path; and continue

      emit uninstall_$pkg
      rm -rf $path
      set remove_status $status
    end

    for path in {$OMF_PATH,$OMF_CONFIG}/{themes}/$pkg
      not test -d $path; and continue

      if test $pkg = (cat $OMF_CONFIG/theme)
        echo "" > $OMF_CONFIG/theme
      end

      rm -rf $path
      set remove_status $status
    end

    if test $remove_status -eq 0
      echo (omf::em)"$pkg succesfully removed."(omf::off)
    else
      echo (omf::err)"$pkg could not be found"(omf::off) 1^&2
    end
  end

  refresh
end
