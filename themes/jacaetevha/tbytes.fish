function tbytes -d 'calculates the total size of the files in the current directory'
  set -g tBytes (ls -al | grep "^-" | awk 'BEGIN {i=0} { i += $5 } END { print i }')
  
  if test $tBytes -lt 1048576
    set -g total (echo -e "scale=3 \n$tBytes/1048 \nquit" | bc)
    set -g units " Kb"
  else
    set -g total (echo -e "scale=3 \n$tBytes/1048576 \nquit" | bc)
    set -g units " Mb"
  end
  echo -n "$total$units"
end
