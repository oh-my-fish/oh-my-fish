# Return the path of the frontmost Finder window

function pfd
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "Return the path of the frontmost Finder window"
        return 0
    end
  end
  osascript 2>/dev/null -e '
      tell application "Finder"
        return POSIX path of (target of window 1 as alias)
      end tell'
end