#!/usr/bin/env fish

for test in (find * -type f -print | grep 'spec.fish')
  fish $test
end
