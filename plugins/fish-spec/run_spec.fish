function run_spec -a test
  functions -q before_each; and before_each
  eval $test
  functions -q after_each; and after_each
end

function run_spec._.results.assertion_success -e assertion_success
  printf '.'
end

function run_spec._.results.assertion_failure -e assertion_failure
  echo $argv
end
