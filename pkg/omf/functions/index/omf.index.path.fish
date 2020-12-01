function omf.index.path -d 'Get the path to the local package index'
  set -q XDG_CACHE_HOME
    and echo (echo $XDG_CACHE_HOME | sed 's:/*$::')"/omf"
    or echo (echo $HOME | sed 's:/*$::')"/.cache/omf"
end
