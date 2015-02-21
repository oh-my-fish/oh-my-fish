function ta.util.tags.get -a task
  echo "$task" | tr -s "[:space:]" \n | grep -Eo "$__ta_regex" | cut -c2-
end
