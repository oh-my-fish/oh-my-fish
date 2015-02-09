# Open new iTerm and Terminal tabs from the command line
#
# Author: Justin Hileman (http://justinhileman.com)
#
# Usage:
#     tab                   Opens the current directory in a new tab
#     tab [PATH]            Open PATH in a new tab
#     tab [CMD]             Open a new tab and execute CMD
#     tab [PATH] [CMD] ...  You can prolly guess

function tab -d 'Open the current directory (or any other directory) in a new tab'
  set -l cmd ''
  set -l cdto $PWD

  if test (count $argv) -gt 0 -a -d $argv[1]
    pushd . >/dev/null
    cd $argv[1]
    set cdto $PWD
    set -e argv[1]
    popd >/dev/null
  end

  if test (count $argv) -gt 0
    set cmd "; $argv"
  end

  switch $TERM_PROGRAM

  case 'iTerm.app'
    osascript 2>/dev/null -e "
      tell application \"iTerm\"
        tell current terminal
          launch session \"Default Session\"
          tell the last session
            write text \"cd \\\"$cdto\\\"$cmd\"
          end tell
        end tell
      end tell
    "

  case 'Apple_Terminal'
    osascript 2>/dev/null -e "
      tell application \"Terminal\"
        activate
        tell application \"System Events\" to keystroke \"t\" using command down
        repeat while contents of selected tab of window 1 starts with linefeed
          delay 0.01
        end repeat
        do script \"cd \\\"$cdto\\\"$cmd\" in window 1
      end tell
    "

  case '*'
    echo "Unknown terminal: $TERM_PROGRAM" >&2
  end
end
