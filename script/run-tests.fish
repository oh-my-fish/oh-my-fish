#!/usr/bin/env fish

# When running on CI, run tests from the correct branch
if set -q TRAVIS_BRANCH
  command git checkout $TRAVIS_BRANCH
end

set -l result 0
for test in (find * -type f -print | grep "spec.fish")
  fish $test $argv
    or set result 1
end
exit $result
