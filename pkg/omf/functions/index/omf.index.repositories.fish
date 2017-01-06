function omf.index.repositories -d 'Manage package repositories'
  # List repositories by default.
  if not set -q argv[1]
    set argv[1] list
  end

  switch $argv[1]
    case list
      for file in {$OMF_PATH,$OMF_CONFIG}/repositories
        if test -f $file
          read -z -l contents < $file
          printf $contents
        end
      end

    case add
      if not set -q argv[2]
        echo "url not specified" >&2
        return 1
      end

      if not set -q argv[3]
        set argv[3] master
      end

      echo "$argv[2] $argv[3]" >> $OMF_CONFIG/repositories

    case '*'
      echo "Unknown command: $argv[1]" >&2
      return 1
  end
end
