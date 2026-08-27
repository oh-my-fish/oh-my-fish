# omf.bundle.names <package|theme>
# Prints the names of the bundle records of the given type.
function omf.bundle.names -a type
  for record in (cat $OMF_CONFIG/bundle 2> /dev/null)
    set -l record_type (echo $record | cut -s -d' ' -f1)
    test "$record_type" = "$type"; or continue
    omf.packages.name (echo $record | cut -s -d' ' -f2-)
  end
end
