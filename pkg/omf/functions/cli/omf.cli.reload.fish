function omf.cli.reload
  if not contains -- --force $argv
    if count (jobs) >/dev/null ^&1
      __omf.cli.reload.job_warning
      return 1
    end
  end
  omf.reload
end

function __omf.cli.reload.job_warning
  echo (set_color -u)"Reload aborted. There are background jobs:"(set_color normal)
  echo
  jobs
  echo
  echo "For your safety, finish all background jobs before reloading Oh My Fish."
  echo "If you are absolutely sure of what you are doing, you can bypass this check using --force."
end
