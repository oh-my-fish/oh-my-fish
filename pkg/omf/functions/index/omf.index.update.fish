function omf.index.update -d 'Update package indexes'
  # Only update if the index is missing.
  if contains -- --if-missing $argv
    set -l paths (omf.index.path)/*

    if set -q paths[1]
      return 0
    end
  end

  # Find repository lists.
  for list in {$OMF_PATH,$OMF_CONFIG}/repositories
    test -f $list
      and set lists $lists $list
  end

  # Read the configured repositories from the lists.
  if set -q lists[1]
    set repositories (command awk '
      {
        dir = $1 "_" $2;
        gsub(/[ \/:@]/, "_", dir);
        if (!visited[dir]++) {
          print $1 "\n" $2 "\n" dir;
        }
      }
    ' $lists)
  end

  # Update repositories.
  while set -q repositories[1]
    set -l url $repositories[1]
    set -l branch $repositories[2]
    set -l path (omf.index.path)/$repositories[3]
    set valid_paths $valid_paths $path

    echo -n "Updating $url $branch... "
    if begin
        if not test -d $path
          command git clone --quiet --depth 1 --branch $branch $url $path
        else
          command git -C $path pull --quiet
        end
      end
      echo "Done!"
    else
      echo "Error"
      return 1
    end

    set -e repositories[1..3]
  end

  # Remove repositories not in the lists.
  for path in (omf.index.path)/*
    if not contains -- $path $valid_paths
      command rm -rf $path
    end
  end

  return 0
end
