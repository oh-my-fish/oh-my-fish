function omf.packages.check-updates
  set -l max_workers 8
  set -l fetch_cmd "omf.repo.fetch"
  set -l progress_done \u25a3
  set -l progress_left \u25a2
  set -l progress_boxes 40
  set -l error_log (mktemp -t omf_check-updates.XXXX.log)

  # Supress Git's attempt to find missing repositories with different credentials.
  # Git > 2.3
  set -lx GIT_TERMINAL_PROMPT 0
  # hack for older Git versions
  set -lx SSH_ASKPASS echo

  function __omf.packages.active_fetches -V fetch_cmd
    count (jobs | grep '$fetch_cmd')
  end

  function __omf.packages.string_repeat -a count str
    # `string repeat` is new in fish v2.6
    # for older versions, use a `printf` hack
    string repeat -Nq -n $count $str ^/dev/null
      or printf "$str%.0s" (seq $count)
  end

  function __omf.packages.count_boxes -a left total boxes
    set -l done (math "$total - $left")
    set -l done_boxes (math "$done * $boxes / $total")
    set -l left_boxes (math "$left * $boxes / $total")

    # Account for rounding issues
    if test (math "$left_boxes + $done_boxes") -lt $boxes
      test $done_boxes -gt $left_boxes
        and set done_boxes (math "$done_boxes + 1")
        or set left_boxes (math "$left_boxes + 1")
    end

    echo $done_boxes
    echo $left_boxes
  end

  function __omf.packages.display_progress -S -a left total
    # Carriage Return to move the cursor back to the beginning of the line.
    echo -ne "\r"
    # Place progress boxes
    set -l boxes (__omf.packages.count_boxes $left $total $progress_boxes)
    if test $boxes[1] -gt 0
      __omf.packages.string_repeat $boxes[1] $progress_done
    end
    if test $boxes[2] -gt 0
      __omf.packages.string_repeat $boxes[2] $progress_left
    end
  end

  set -l package_count (count $argv)

  echo "Getting package updates... "
  while test (count $argv) -gt 0
    if test (__omf.packages.active_fetches) -lt $max_workers
      if set -l package_path (omf.packages.path $argv[1])
        # Skip packages outside version control
        not command git -C $package_path rev-parse --git-dir >/dev/null ^&1
          and continue

        # Error reporting here would be ugly because it clutters the display.
        # Save to log file instead.
        fish -c "$fetch_cmd $package_path" ^^$error_log &

      else
        echo (omf::err)"Could not find $argv[1]"(omf::off) >&2
      end
      set -e argv[1]
      __omf.packages.display_progress (count $argv) $package_count
    end
    sleep 0.01s
  end

  # Wait for the last jobs
  while test (__omf.packages.active_fetches) -gt 0
    sleep 0.01s
  end
  echo -ne "\r done!"
  __omf.packages.string_repeat $progress_boxes " "  # Clear the previous boxes
  echo

  test (wc -l < $error_log) -gt 0
    and echo (omf::err)"Please see "(omf::off)"$error_log"(omf::err)" for errors encountered while getting updates."(omf::off)
end
