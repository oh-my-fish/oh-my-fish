function _path_index
  if test $PATH[$argv[1]] = $argv[2]
    echo 'Path index correct'
  end
end

# Set /usr/local/bin before /usr/bin if defined on $PATH
if contains /usr/local/bin $PATH
  if contains /usr/bin $PATH
    for i in (seq (count $PATH))
      if test (_path_index $i '/usr/bin')
        set -g bin_index $i
      else
        if test (_path_index $i '/usr/local/bin')
          set -g local_bin_index $i
        end
      end
    end

    if test $bin_index -lt $local_bin_index
      set PATH[$bin_index] /usr/local/bin
      set PATH[$local_bin_index] /usr/bin
    end
  end
end

set -e bin_index
set -e local_bin_index
