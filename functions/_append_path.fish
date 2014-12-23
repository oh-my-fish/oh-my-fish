# Appends the path to the specified path list. If no list specified,
#  defaults to $PATH
function _append_path
  set_color red
  echo '_append_path function deprecated. Rename to _prepend_path.' >&2
  set_color normal

  set -l path PATH

  if test (echo $argv | wc -w) -eq 2
    set path $argv[2]
  end

  if test -d $argv[1]
    if not contains $argv[1] $$path
      set $path $argv[1] $$path
    end
  end
end
