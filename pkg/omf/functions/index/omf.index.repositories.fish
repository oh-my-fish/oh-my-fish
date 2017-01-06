function omf.index.repositories -d 'Manage package repositories'
  # List repositories by default.
  if not set -q argv[1]
    set argv[1] list
  end

  switch $argv[1]
    case help --help -h
      omf help repositories
      return

    case list
      for file in {$OMF_PATH,$OMF_CONFIG}/repositories
        if test -f $file
          read -z -l contents < $file
          printf "$contents"
        end
      end

    case add
      if not set -q argv[2]
        echo "Error: url not specified" >&2
        return 1
      end

      if not set -q argv[3]
        set argv[3] master
      end

      echo "$argv[2] $argv[3]" >> $OMF_CONFIG/repositories

    case rm remove
      if not set -q argv[2]
        echo "Error: url not specified" >&2
        return 1
      end

      if not set -q argv[3]
        set argv[3] master
      end

      set -l repo "$argv[2] $argv[3]"

      if test -f $OMF_CONFIG/repositories
        if command grep -q $repo $OMF_CONFIG/repositories
          command grep -v $repo $OMF_CONFIG/repositories > $OMF_CONFIG/repositories.swp
          command mv $OMF_CONFIG/repositories.swp $OMF_CONFIG/repositories

          return
        end
      end

      echo "Error: could not find user repository '$repo'" >&2
      return 1

    case '*'
      echo "Error: unknown command '$argv[1]'" >&2
      return 1
  end
end
