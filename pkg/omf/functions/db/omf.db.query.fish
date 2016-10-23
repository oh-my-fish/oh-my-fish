function omf.db.query -d 'Query packages in the database'
  set -l packages $OMF_PATH/db/packages/*
  set -l themes $OMF_PATH/db/themes/*

  set -l q_type any
  set -l q_name ''

  # Parse search terms.
  for arg in $argv
    switch "$arg"
      case 'type:a*'
        set q_type any
      case 'type:p*'
        set q_type package
      case 'type:t*'
        set q_type theme
      case 'name:?*'
        set -l IFS ':'
        echo "$arg" | read dummy q_name
      case '*'
        echo "Invalid search term: '$arg'" >&2
        return 1
    end
  end

  # Gather search results.
  set -l results (begin
    if test $q_type = package -o $q_type = any
      for package in $packages
        command basename $package
      end
    end

    if test $q_type = theme -o $q_type = any
      for theme in $themes
        command basename $theme
      end
    end
  end | command grep -i "$q_name")

  if not set -q results[1]
    return 1
  end

  # Sort results alphabetically.
  for result in $results
    echo $result
  end | command sort -d
end
