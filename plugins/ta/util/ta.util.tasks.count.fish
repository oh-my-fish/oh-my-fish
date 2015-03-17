function ta.util.tasks.count
  wc -l < $__ta_file_data | awk '{print $1}'
end
