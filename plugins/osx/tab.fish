# Open the current directory in a new tab
function tab
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "Open the current directory in a new tab"
        return 0
    end
  end
  osascript 2>/dev/null -e '
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
      end tell'
end
