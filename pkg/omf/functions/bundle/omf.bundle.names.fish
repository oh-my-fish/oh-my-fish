# omf.bundle.names <package|theme>
# Prints the names of the bundle records of the given type.
function omf.bundle.names -a type
  for record in (cat $OMF_CONFIG/bundle 2> /dev/null)
    set -l fields (string split -m1 ' ' -- $record)
    test "$fields[1]" = "$type" -a (count $fields) -eq 2; or continue
    omf.packages.name $fields[2]
  end
end
