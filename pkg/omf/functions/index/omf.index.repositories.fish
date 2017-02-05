function omf.index.repositories -d 'Manage package repositories'
  # List repositories by default.
  if not set -q argv[1]
    set argv[1] list
  end

  switch $argv[1]
    case help --help -h
      omf help repositories
      return

    case list ls
      for file in {$OMF_PATH,$OMF_CONFIG}/repositories
        if test -f $file
          command cat $file
        end
      end

    case add
      if set -q argv[2]
        set repo_url $argv[2]
      else
        echo "URL not specified" >&2
        return 1
      end

      if set -q argv[3]
        set repo_branch $argv[3]
      else
        set repo_branch master
      end

      set -l repo "$repo_url $repo_branch"

      # Check if we already have the repository.
      if test -f $OMF_CONFIG/repositories
        if command grep -q $repo $OMF_CONFIG/repositories
          echo "The repository is already added." >&2
          return 1
        end
      end

      if command grep -q $repo $OMF_PATH/repositories
        echo "The repository is already added." >&2
        return 1
      end

      # Before we add, do a quick ls-remote to see if the URL is a valid repo.
      if not command git ls-remote --exit-code $repo_url refs/heads/$repo_branch > /dev/null ^&1
        echo "The remote repository could not be found." >&2
        return 1
      end

      echo "$repo" >> $OMF_CONFIG/repositories

    case rm remove
      if set -q argv[2]
        set repo_url $argv[2]
      else
        echo "URL not specified" >&2
        return 1
      end

      if set -q argv[3]
        set repo_branch $argv[3]
      else
        set repo_branch master
      end

      set -l repo "$repo_url $repo_branch"

      # Check to see if user has repositories and if the given URL is listed.
      if test -f $OMF_CONFIG/repositories
        if command grep -q $repo $OMF_CONFIG/repositories
          command grep -v $repo $OMF_CONFIG/repositories > $OMF_CONFIG/repositories.swp
          command mv $OMF_CONFIG/repositories.swp $OMF_CONFIG/repositories

          return
        end
      end

      # The given URL is not listed, check if it is a built-in repository they can't remove.
      if command grep -q $repo $OMF_PATH/repositories
        echo "The repository '$repo' is built-in and cannot be removed." >&2
      else
        echo "Could not find user repository '$repo'" >&2
      end
      return 1

    case '*'
      echo "Unknown command '$argv[1]'" >&2
      return 1
  end
end
