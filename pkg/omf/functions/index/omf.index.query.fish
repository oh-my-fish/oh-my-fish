function omf.index.query -d 'Query packages in the index'
  set -q XDG_CACHE_HOME
    and set -l index_path "$XDG_CACHE_HOME/omf"
    or set -l index_path "$HOME/.cache/omf"

  set -lx q_type any
  set -lx q_name ''
  set -lx q_text ''

  # Parse search terms.
  for arg in $argv
    switch "$arg"
      case 'type=a*'
        set q_type any
      case 'type=p*'
        set q_type package
      case 'type=t*'
        set q_type theme
      case 'name=?*'
        set -l IFS '='
        echo "$arg" | read dummy q_name
      case 'text=?*'
        set -l IFS '='
        echo "$arg" | read dummy q_text
      case '*'
        echo "Invalid search term: '$arg'" >&2
        return 1
    end
  end

  # Determine what files to search against based on type.
  switch $q_type
    case package
      set packages $index_path/*/packages/*
    case theme
      set packages $index_path/*/themes/*
    case '*'
      set packages $index_path/*/{packages,themes}/*
  end

  # If there are no packages, there is nothing to search.
  if not set -q packages[1]
    return 1
  end

  # Perform a text search if any textual terms were given.
  if test -n "$q_name" -o -n "$q_text"
    set results (command awk '
      function flush() {
        if (package && name_matches && text_matches) {
          print package;
        }
      }
      BEGIN {
        FS = "[ \t]*=[ \t]*";
        q_name = tolower(ENVIRON["q_name"]);
        q_text = tolower(ENVIRON["q_text"]);
      }
      FNR == 1 {
        flush();
        name_matches = text_matches = 0;
        package = parts[split(FILENAME, parts, "/")];

        if (match(package, q_name)) {
          name_matches = 1;
        }
        if (match(package, q_text)) {
          text_matches = 1;
        }
      }
      !text_matches {
        if (match(tolower($2), q_text)) {
          text_matches = 1;
        }
      }
      END { flush(); }
    ' $packages)
  else
    # No text terms, just list all package names of the given type.
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
