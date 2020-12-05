function omf.repo.pull
  if test (count $argv) -eq 0
    echo (omf::err)"omf.repo.pull takes a repository path as an argument."(omf::off) >&2
    return $OMF_MISSING_ARG
  end

  omf.repo.fetch $argv
  set -l fetch_status $status
  if not test $fetch_status -eq 0
    return $fetch_status
  end

  omf.repo.merge $argv
  return $status
end
