function omf.bundle.add -a type name_or_url
  set -l bundle $OMF_CONFIG/bundle
  set -l record "$type $name_or_url"

  if test -f $bundle
    if not grep $record $bundle > /dev/null 2>&1
      echo $record >> $bundle
    end
  else
    echo $record > $bundle
  end

  sort -u $bundle -o $bundle
end
