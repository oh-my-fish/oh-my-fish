#!/usr/bin/env fish

# TODO: This is only a basic draft.

set -l return_code 0

omf list | grep apt 2>&1 >/dev/null
set -l apt_installed_previously $status

if test $apt_installed_previously -eq 0
  omf remove apt
end

set commands "omf help" "omf doctor" "omf install apt"
for cmd in $commands
  echo \$ $cmd
  if not eval $cmd
    set return_code 1
  end
end

if test $apt_installed_previously -ne 0
  omf remove apt
end

exit $return_code
