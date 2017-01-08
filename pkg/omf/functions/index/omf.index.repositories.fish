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
          command cat $file
        end
      end

    case add
      if set -q argv[2]
        set repo_url $argv[2]
      else
        echo "Url not specified" >&2
        return 1
      end

      if set -q argv[3]
        set repo_branch $argv[3]
      else
        set repo_branch master
      end

      echo "$repo_url $repo_branch" >> $OMF_CONFIG/repositories

    case rm remove
      if set -q argv[2]
        set repo_url $argv[2]
      else
        echo "Url not specified" >&2
        return 1
      end

      if set -q argv[3]
        set repo_branch $argv[3]
      else
        set repo_branch master
      end

      set -l repo "$repo_url $repo_branch"

      if test -f $OMF_CONFIG/repositories
        if command grep -q $repo $OMF_CONFIG/repositories
          command grep -v $repo $OMF_CONFIG/repositories > $OMF_CONFIG/repositories.swp
          command mv $OMF_CONFIG/repositories.swp $OMF_CONFIG/repositories

          return
        end
      end

      echo "Could not find user repository '$repo'" >&2
      return 1

    case '*'
      echo "Unknown command '$argv[1]'" >&2
      return 1
  end
end
