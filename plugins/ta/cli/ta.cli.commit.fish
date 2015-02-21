function ta.cli.commit -a task
  # We delay the elapsed counter until the first task is committed.
  set -q __ta_elapsed
    or set -g __ta_elapsed (date "+%s")

  set -l now        (date "+%s")
  set __ta_delta    (math $now - $__ta_elapsed)
  set __ta_elapsed  $now

  set -l meta (ta.util.tags.get.meta)
  # Trim extra whitespace and save file.
  echo -se (echo "$task" \
    | tr -s '[:space:]' ' ')\t"$meta" >> $__ta_file_data

  if test $status -eq 0
    ta.cli.search "" | head -n2
    # Unlock undo stack.
    set __ta_undo_lock false
  end
end
