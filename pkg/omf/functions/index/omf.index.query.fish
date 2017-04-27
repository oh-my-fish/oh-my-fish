function omf.index.query -d 'Query packages in the index'
  set -l q_type any
  set -l q_name ''
  set -l q_text ''

  # Parse search terms.
  for arg in $argv
    switch "$arg"
      case '--type=any'
        set q_type any
      case '--type=plugin'
        set q_type plugin
      case '--type=theme'
        set q_type theme
      case '--name=?*'
        set -l IFS '='
        echo "$arg" | read dummy q_name
      case '--text=?*'
        set -l IFS '='
        echo "$arg" | read dummy q_text
      case '*'
        echo "Invalid search term: '$arg'" >&2
        return 1
    end
  end

  # Put all packages into a list.
  set -l packages (omf.index.path)/*/packages/*

  # If there are no packages, there is nothing to search.
  if not set -q packages[1]
    return 1
  end

  # Perform a text search if any filters were given.
  if set -q argv[1]
    set results (command awk -v "q_type=$q_type" -v "q_name=$q_name" -v "q_text=$q_text" '
      function flush() {
        if (package && type_matches && name_matches && text_matches) {
          print package;
        }
      }

      BEGIN {
        FS = "[ \t]*=[ \t]*";
        q_name = tolower(q_name);
        q_text = tolower(q_text);
      }

      FNR == 1 {
        flush();

        if (q_type == "any") {
          type_matches = 1;
        } else {
          type_matches = 0;
        }
        name_matches = 0;
        text_matches = 0;

        package = parts[split(FILENAME, parts, "/")];

        if (match(package, q_name)) {
          name_matches = 1;
        }

        if (match(package, q_text)) {
          text_matches = 1;
        }
      }

      !type_matches && !/^#/ && $1 == "type" && $2 == q_type {
        type_matches = 1;
      }

      !text_matches && !/^#/ && $1 == "description" {
        if (match(tolower($2), q_text)) {
          text_matches = 1;
        }
      }

      END {
        flush();
      }
    ' $packages)
  else
    # No filters, just list all package names.
    set results (for package in $packages
      command basename $package
    end)
  end

  if not set -q results[1]
    return 1
  end

  # Sort results alphabetically.
  for result in $results
    echo $result
  end | command sort -d
end
