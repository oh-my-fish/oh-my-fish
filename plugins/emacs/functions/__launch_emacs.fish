function __launch_emacs
  set -l x (emacsclient --alternate-editor '' --eval '(x-display-list)' 2>/dev/null)

  if begin; test -z "$x"; or test $x = nil; end
    emacsclient $argv --alternate-editor '' --create-frame
  else
    or emacsclient $argv --alternate-editor ''
  end
end
