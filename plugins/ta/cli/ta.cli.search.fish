function ta.cli.search -a keys number
  if not test -e $__ta_file_data
    echo "There are no tasks."
    return $__ta_error_no_tasks
  end

  set -l result
  set -l flags
  set -q argv[3]
    and set flags $argv[3..-1]

  # UI colors.
  set -l tag_color      "1;93"
  set -l grep_color     "0;103;1;90"
  set -l text_color     (set_color 777)
  set -l query_color    (set_color FF1493)
  set -l normal_color   (set_color normal)

  if test -n "$number"
    # Truncate results via tail -n$number
    set number "n$number"
  end

  if contains -- regex $flags
    set result (env GREP_COLOR="$grep_color" \
      grep --color=always -E "$keys" $__ta_file_data)
  else
    set result (cat $__ta_file_data)
    if test -n "$keys"
      for key in (echo "$keys" | tr + \n)
        # grep results consecutively to produce an AND operator.
        # Notice we append a `#' to the $key to filter only tags.
        set result (printf "%s\n" $result | grep "#$key")
      end
    end
  end

  if test -z "$result"
    echo "Nothing to see here."
    return $__ta_error_no_tasks
  end

  # Trim special flags, print results in reverse and color #tags.
  if set result (printf "%s\n" $result  \
    | cut -d\t -f1 | tail -r"$number"   \
    | ta.util.color.tags $tag_color)
    # Append |$ at the end of the tag regex to make sure grep prints all
    # incoming lines from the tail pipe, but colors only tags. $ matches
    # the end of all lines but has nothing to colorize.

    set -l count (count $result)

    set -l s # Plural?
    test $count -gt 1; and set s "s"

    # If both keys and number are empty just print tasks.
    if test -z "$keys" -a -z "$number"
      # set count (ta.util.tasks.count)
      echo $text_color"$count task$s completed."$normal_color

      if test $count -gt 0
        set -l mark_color (set_color blue)
        # Task marker is red if the task was completed within 10 mins.
        if test $__ta_delta -gt 0 -a $__ta_delta -lt 600
          set mark_color (set_color red)
        end
        echo -n $mark_color\* $normal_color
      end
    else
      if test -n "$keys"
        echo /$query_color"$keys"$normal_color/ | begin
          # Only for tag search, colorize `+' characters for love.
          if not contains -- regex $keys
            sed "s/+/$normal_color+$query_color/g"
          end
        end
      end
      echo $text_color"$count result$s."$normal_color
    end
    printf "%s\n" $result
  end
end
