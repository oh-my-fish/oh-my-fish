function omf.index.path -d 'Get the path to the local package index'
  if test -n "$XDG_CACHE_HOME"
    echo (string trim --right --chars / -- $XDG_CACHE_HOME)"/omf"
  else if test -n "$HOME"
    echo (string trim --right --chars / -- $HOME)"/.cache/omf"
  else
    echo (omf::err)"Cannot locate the package index: \$HOME is not set."(omf::off) >&2
    return 1
  end
end
