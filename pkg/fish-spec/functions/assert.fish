function assert --wraps test
  if builtin test $argv
    emit assertion_success
  else
    set -l assertion_status $status
    emit assertion_error (assert.error_message $argv)
    return $assertion_status
  end
end
