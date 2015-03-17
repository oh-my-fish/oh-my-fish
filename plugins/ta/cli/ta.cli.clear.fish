function ta.cli.clear
  set -l bright_color  (set_color FF1493)
  set -l normal_color  (set_color normal)

  set -l question "[$bright_color"Y"$normal_color/n]"

  if not test -e $__ta_file_data
    echo "Nothing to clear."
    return $__ta_error_no_tasks
  end

  echo -n "Delete all data? $question: "

  head -n 1 | read answer
  switch $answer
    case Y yes
      rm $__ta_file_data
      echo "Done"
  end
end
