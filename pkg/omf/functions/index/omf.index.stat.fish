function omf.index.stat -a name -d 'Get package properties'
  if test -z "$name"
    return 1
  end

  set -e argv[1]
  set -l properties $argv
  set -l package_file

  # Find the package definition file.
  set -l package_files (omf.index.path)/*/packages/$name

  if set -q package_files[1]
    set package_file $package_files[1]
  else
    return 1
  end

  # If no properties are specified, output all properties with names.
  if not set -q properties[1]
    command cat $package_file
    return
  end

  # Find only the values of the properties requested.
  command awk '
    BEGIN {
      FS = "[ \t]*=[ \t]*";

      # Set default values for certain properties.
      defaults["type"] = "plugin";

      # Get the list of properties to display.
      for (i = 2; i < ARGC; i++) {
        properties[i - 1] = ARGV[i];
        delete ARGV[i];
        count++;
      }
    }

    !/^#/ {
      # Store the property value.
      values[$1] = $2;
    }

    END {
      # Print out each requested property.
      for (i = 1; i <= count; i++) {
        property = properties[i];

        if (property in values) {
          # If the property was set, print it out.
          print values[property];
        } else if (property in defaults) {
          # If the property was not set and has a default value, print it out.
          print defaults[property];
        } else {
          # Print a blank line if the property was not found.
          print "";
        }
      }
    }
  ' - $properties < $package_file
end
