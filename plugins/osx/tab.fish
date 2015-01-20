# Open the current directory in a new tab
function tab -d "Open the current directory in a new tab"
  osascript 2>/dev/null -e '
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
      end tell'
end
