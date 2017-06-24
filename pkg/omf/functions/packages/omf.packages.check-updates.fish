function omf.packages.check-updates
  set -l max_workers 8
  set -l fetch_cmd "omf.repo.fetch"
  set -l progress_indicator \u25cf
  set -l error_log (mktemp -t omf_check-updates.XXXX.log)

  # Supress Git's attempt to find missing repositories with different credentials.
  # Git > 2.3
  set -lx GIT_TERMINAL_PROMPT 0
  # hack for older Git versions
  set -lx SSH_ASKPASS echo

  function __omf.packages.active_fetches -V fetch_cmd
    count (jobs | grep '$fetch_cmd')
  end

  printf "Getting package updates... "
  while test (count $argv) -gt 0
    if test (__omf.packages.active_fetches) -lt $max_workers
      if set -l package_path (omf.packages.path $argv[1])
        # Skip packages outside version control
        not command git -C $package_path rev-parse --git-dir >/dev/null ^&1
          and continue

        # Error reporting here would be ugly because it clutters the display.
        # Save to log file instead.
        fish -c "$fetch_cmd $package_path" ^^$error_log &

        printf "$progress_indicator"
      else
        echo (omf::err)"Could not find $argv[1]"(omf::off) >&2
      end
      set -e argv[1]
    end
    sleep 0.01s
  end

  # Wait for the last jobs
  while test (__omf.packages.active_fetches) -gt 0
    sleep 0.01s
  end
  echo " done!"

  test (wc -l < $error_log) -gt 0
    and echo (omf::err)"Please see "(omf::off)"$error_log"(omf::err)" for errors encountered while getting updates."(omf::off)
end
