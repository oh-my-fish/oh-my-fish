# Move a specified file to the Trash

function trash -d "Move a specified file to the Trash"
  if [ (count $argv) -gt 0 ]
    set -l trash_dir "$HOME/.Trash"
    for item in $argv
      if test -e $item
        set -l item_name (basename $item)
        if test -e "$trash_dir/$item_name"
          set -l current_time (date "+%H.%M.%S")
          mv -f "$item" "$trash_dir/$item_name $current_time"
        else
          mv -f "$item" "$trash_dir/"
        end
      end
    end
  else
    echo "No file(s) given to delete"
  end
end