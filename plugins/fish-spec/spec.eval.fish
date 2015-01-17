# NAME
#   spec.eval - eval a test function
#
# SYNOPSIS
#   spec.eval <function> [OPTIONS...]
#
# OPTIONS
#   See spec.report
#
# AUTHORS
#   Bruno Pinto <@pfbruno>
#   Jorge Bucaran <@bucaran>
#/
import plugins/msg

function spec.eval
  set -l result $status
  set -l test $argv[1]
  set -e argv[1]

  if functions -q $test
    # Run the test yielding control to the user defined spec.
    set -l output (eval $test)
    set result $status
    # Display test results.
    spec.view $test $result $argv -- $output
  end
  return $result
end
