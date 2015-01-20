# Quick Look a specified file

function ql -d "Quick Look a specified file"
  if [ (count $argv) -gt 0 ]
    qlmanage >/dev/null ^/dev/null -p Applications/ &
  else
    echo "No file or folder as argument given"
  end
end