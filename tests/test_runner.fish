#!/usr/bin/env fish

set -l return_code 0

set commands "omf help" "omf query PATH" "omf query fish_function_path" "omf install apt"
for cmd in $commands
  echo \$ $cmd
  if not eval $cmd
    set return_code 1
  end;
end;


exit $return_code
