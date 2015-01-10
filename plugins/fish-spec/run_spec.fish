function run_spec -a test
  eval $test
end

function run_spec._.results.assertion_success -e assertion_success
  printf '.'
end

function run_spec._.results.assertion_failure -e assertion_failure
  echo $argv
end
