# Open a specified man page in Preview

function manp
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "Open a specified man page in Preview"
        return 0
    end
  end
  man -t $argv | open -f -a Preview
end