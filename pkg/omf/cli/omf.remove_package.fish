function omf.remove_package

  function _remove_from_bundle
    set bundle $OMF_CONFIG/bundle

    if test -f $bundle
      set type $argv[1]
      set name $argv[2]
      set bundle_contents (cat $bundle)

      rm -f $bundle

      for record in $bundle_contents
        set record_type (echo $record | cut -d' ' -f1)
        set record_name (echo $record | cut -d' ' -f2-)
        set record_basename (basename (echo $record_name | sed -e 's/\.git$//'))

        if not test "$type" = "$record_type" -a "$name" = "$record_basename"
          echo "$record_type $record_name" >> $bundle
        end

      end
    end
  end

  for pkg in $argv
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

      emit uninstall_$pkg
      _remove_from_bundle "package" $pkg

      rm -rf $path
      set remove_status $status
    end

    for path in {$OMF_PATH,$OMF_CONFIG}/{themes}/$pkg
      not test -d $path; and continue

      if test $pkg = (cat $OMF_CONFIG/theme)
        echo default > $OMF_CONFIG/theme
      end

      _remove_from_bundle "theme" $pkg

      rm -rf $path
      set remove_status $status
    end

    if test $remove_status -eq 0
      echo (omf::em)"$pkg succesfully removed."(omf::off)
      refresh
    else
      echo (omf::err)"$pkg could not be found"(omf::off) 1^&2
    end
  end
end
