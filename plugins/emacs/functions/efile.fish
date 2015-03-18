function efile
  set -l cmd '(buffer-file-name (window-buffer))'

  __launch_emacs --eval $cmd | tr -d '\"'
end
