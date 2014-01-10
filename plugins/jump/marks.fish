function marks
  if test (count $argv) -gt 0
    echo "Usage: marks"
  else
    set -l file_list (command ls $MARKPATH)
    if test (count $file_list) -eq 0
      echo "No marks currently defined."
    else
      set -l mark_list
      for file in $file_list
        if test -d $MARKPATH/$file -a -L $MARKPATH/$file
          set mark_list $mark_list $file
        end
      end
      if test (count $mark_list) -eq 0
        echo "No marks currently defined."
      else
        set -l current_dir (pwd)
        for mark_name in $mark_list
          cd $MARKPATH/$mark_name
          set -l real_path (pwd)
          echo "$mark_name -> $real_path"
        end
        cd $current_dir
      end
    end
  end
end
