function omf.reload -d "Reload fish process via exec, keeping some context"
  set -q CI; and return 0

  history --save
  set -gx dirprev $dirprev
  set -gx dirnext $dirnext
  set -gx dirstack $dirstack
  set -gx fish_greeting ''

  exec fish
end
