#!/usr/bin/env fish

# TODO: This is only a basic draft.

set -l return_code 0

set commands "omf help" "omf doctor" "omf install apt"
for cmd in $commands
  echo \$ $cmd
  if not eval $cmd
    set return_code 1
  end;
end;


exit $return_code
