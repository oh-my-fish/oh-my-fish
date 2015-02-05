function pbcopy --description "Copy data from STDIN to the clipboard"
  xsel --clipboard --input
end

function pbpaste  --description "Paste data from the Clipboard"
  xsel --clipboard --output
end
