function __launch_emacs
  set -l x (emacsclient --alternate-editor '' --eval '(x-display-list)' 2>/dev/null)

  if test -z "$x" -o "$x" = nil
    emacsclient $argv --alternate-editor '' --create-frame
  else
    emacsclient $argv --alternate-editor ''
  end
end
