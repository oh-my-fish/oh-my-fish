# Open a specified man page in Preview

function manp -d "Open a specified man page in Preview"
  man -t $argv | open -f -a Preview
end