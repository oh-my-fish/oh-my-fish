# pushd to the current Finder directory

function pushdf
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "pushd to the current Finder directory"
        return 0
    end
  end
  pushd (pfd)
end