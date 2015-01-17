# Quick Look a specified file

function ql
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "Quick Look a specified file"
        return 0
    end
  end
  if count $argv > 0
    qlmanage >/dev/null ^/dev/null -p Applications/ &
  end
end