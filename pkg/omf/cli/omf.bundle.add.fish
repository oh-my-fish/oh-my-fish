function omf.bundle.add -a type name_or_url
  function __omf.write_bundle
    set -l bundle $OMF_CONFIG/bundle
    set -l record $argv

    if test -f $bundle
      if not grep $record $bundle > /dev/null 2>&1
        echo $record >> $bundle
      end
    else
      echo $record > $bundle
    end
  end

  function __omf.write_theme
    echo $argv > $OMF_CONFIG/theme
  end

  __omf.write_bundle "$type" "$name_or_url"
  if test "$type" = theme
    __omf.write_theme "$name_or_url"
  end
end
