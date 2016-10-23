function omf.db.info -a name -d 'Get package properties'
  if test -z "$name"
    return 1
  end

  set -e argv[1]
  set -l properties $argv
  set -l package_file

  # Find the package definition file.
  if test -f $OMF_PATH/db/packages/$name
    set package_file $OMF_PATH/db/packages/$name
  else if test -f $OMF_PATH/db/themes/$name
    set package_file $OMF_PATH/db/themes/$name
  else
    return 1
  end

  # If no properties are specified, output all properties with names.
  if not set -q properties[1]
    cat $package_file
    return
  end

  # Find only the values of the properties requested.
  set -l values

  begin
    set -l IFS '='

    while read -l property value
      if set -l index (contains -i -- $property $properties)
        set values[$index] "$value"
      end
    end < $package_file
  end

  # Output property values in the order requested.
  for value in $values
    echo "$value"
  end
end
