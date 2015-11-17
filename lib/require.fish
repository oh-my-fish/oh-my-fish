# SYNOPSIS
#   require [name]
#
# OVERVIEW
#   Require a plugin:
#     - Autoload its functions and completions.
#     - Require bundle dependencies.
#     - Source its initialization file.
#     - Emit its initialization event.
#
#   If the required plugin has already been loaded, does nothing.

function require -a name
  # Skip if plugin has already been loaded.
  contains -- $OMF_PATH/pkg/$name $fish_function_path;
    or contains -- $OMF_CONFIG/pkg/$name $fish_function_path;
    and return 0

  for path in {$OMF_PATH,$OMF_CONFIG}/pkg/$name
    test -d $path; or continue

    if autoload $path $path/functions $path/completions

      if test -f $path/bundle
        for line in (cat $path/bundle)
          test (echo $line | cut -d' ' -f1) = package;
            and set dependency (basename (echo $line | cut -d' ' -f2));
              and require $dependency
        end
      end

      source $path/init.fish ^/dev/null;
        or source $path/$name.fish ^/dev/null;
        and emit init_$name $path
    end
  end

  functions -e init  # Cleanup previously sourced function

  return 0
end
