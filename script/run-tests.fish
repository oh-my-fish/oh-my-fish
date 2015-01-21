#!/usr/bin/env fish

set -l result 0
for test in (find $fish_path -type f -print | grep "spec.fish")
  fish $test $argv
    or set result 1
end
exit $result
