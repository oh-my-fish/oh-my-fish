function omf.index.path -d 'Get the path to the local package index'
  set -q XDG_CACHE_HOME
    and echo (string trim -r -c "/" $XDG_CACHE_HOME)"/omf"
    or echo (string trim -r -c "/" $HOME)"/.cache/omf"
end
