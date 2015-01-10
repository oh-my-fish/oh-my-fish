# Remove item from list. List must be the name of a global variable.
# @params <item> <list>
function array.delete
  set -l item $argv[1]
  if set -l index (contains -i -- $item $$argv[2])
    set -e $argv[2][$index]
  end
end
