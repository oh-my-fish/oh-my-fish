function __kill_emacs
  emacsclient --alternate-editor '' --eval '(kill-emacs)' 2>/dev/null
end
