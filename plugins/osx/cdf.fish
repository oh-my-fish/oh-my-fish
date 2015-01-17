# cd to the current Finder directory

function cdf
	if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "cd to the current Finder directory"
        return 0
    end
  end
  cd (pfd)
end