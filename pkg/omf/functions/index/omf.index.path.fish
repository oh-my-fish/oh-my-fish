function omf.index.path -d 'Get the path to the local package index'
  set -q XDG_CACHE_HOME
    and echo "$XDG_CACHE_HOME/omf"
    or echo "$HOME/.cache/omf"
end
