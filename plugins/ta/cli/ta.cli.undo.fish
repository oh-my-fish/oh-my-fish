function ta.cli.undo
  if test $__ta_undo_lock = false
    if test (ta.util.tasks.count) -gt 0
      # Display task for the last time.
      ta.util.get.tail | grep -E --color=always ".*"

      if sed -Ei.bak '$ d' $__ta_file_data
        rm $__ta_file_data.bak
      else
        set -l code $status
        cp $__ta_file_data.bak $__ta_file_data
        return $code
      end
      set -g __ta_undo_lock true
    else
      echo "There are no tasks."
      return $__ta_error_no_tasks
    end
  end
  echo "The undo stack is locked until a new task is added."
end
