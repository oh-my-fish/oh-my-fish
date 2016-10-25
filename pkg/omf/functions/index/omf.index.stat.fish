function omf.index.stat -a name -d 'Get package properties'
  set -q XDG_CACHE_HOME
    and set -l index_path "$XDG_CACHE_HOME/omf"
    or set -l index_path "$HOME/.cache/omf"

  if test -z "$name"
    return 1
  end

  set -e argv[1]
  set -l properties $argv
  set -l package_file

  # Find the package definition file.
  set -l package_files $index_path/*/{packages,themes}/$name

  if set -q package_files[1]
    set package_file $package_files[1]
  else
    return 1
  end

  # If no properties are specified, output all properties with names.
  if not set -q properties[1]
    cat $package_file
    return
  end

  # Find only the values of the properties requested.
  command awk '
    BEGIN {
      FS = "[ \t]*=[ \t]*";
      for (i = 2; i < ARGC; i++) {
        properties[i - 1] = ARGV[i];
        delete ARGV[i];
        count++;
      }
    }
    !/^#/ {
      for (i = 1; i <= count; i++) {
        if ($1 == properties[i]) {
          values[i] = $2;
        }
      }
    }
    END {
      for (i = 1; i <= count; i++) {
        print values[i];
      }
    }
  ' - $properties < $package_file
end
