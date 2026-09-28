function omf.bundle.remove -a type name
  set -l bundle $OMF_CONFIG/bundle

  if test -L $OMF_CONFIG/bundle
    set bundle (readlink $OMF_CONFIG/bundle)
  end

  test -f $bundle
    or return 0

  set -l bundle_contents (cat $bundle | sort -u)
  set -l tmp "$bundle.tmp"

  # Write the remaining records to a temporary file first, so an interrupted
  # run never leaves the bundle missing or half written.
  true > $tmp
  for record in $bundle_contents
    set -l record_type (echo $record | cut -d' ' -f1)
    set -l record_name_or_url (echo $record | cut -d' ' -f2-)
    set -l record_name (omf.packages.name $record_name_or_url)

    if not test "$type" = "$record_type" -a "$name" = "$record_name"
      echo "$record_type $record_name_or_url" >> $tmp
    end
  end

  command mv "$tmp" "$bundle"
end
