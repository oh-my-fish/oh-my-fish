# NAME
#   expect - assert a list of expected values match an actual value.
#
# SYNOPSIS
#   expect <expected>...
#          <condition>
#            --to-be-false      exit status is falsy
#            --to-be-true       exit status is truthy
#            --to-contain       <actual> values exist in <expected> list
#            --to-no-contain    <actual> values does not exist in <expected> list
#            --to-equal         <actual> value equals <expected> value
#          <actual>
#
# EXAMPLE
#   import plugins/fish-spec
#
#   function describe_my_test
#     function it_does_my_task
#       set -l result (my_task $data)
#       expect $result --to-equal 0
#     end
#   end
#   spec.run
#/
function expect
  # Abort if last call to `expect` finished with $status 1. This allows to
  # stop individual tests from running if at least one expect call fails.
  if [ $status -eq 1 ]
    return 1
  end

  for i in (seq (count $argv))
    if [ (echo $argv[$i] | grep '\-\-') ] # Expectation argument found
      set -g condition $argv[$i]
      set -g expected  $argv[1..(math "$i - 1")]

      # No comparison required e.g. --to-be-true
      if not [ (count $argv) = $i ]
        set -g actual $argv[(math "$i + 1")..-1]
      end

      break
    end
  end

  # Test conditions and save success/fail $status to return later.
  switch $condition
    case --to-be-false
      eval "$expected"
      test $status -ne 0
    case --to-be-true
      eval "$expected"
      test $status -eq 0
    case --to-contain
      set result 0
      for item in $actual
        contains -- "$item" $expected
          or set result $status
      end
      test $result -eq 0
    case --to-not-contain
      set result 0
      for item in $actual
        not contains -- "$item" $expected
          or set result $status
      end
      test $result -eq 0
    case --to-eq\*
      test "$expected" = "$actual"
  end
  set result $status
  if [ $result -eq 0 ]
    spec.log --ok
  else
    spec.log --fail red \n"Expected" yellow "$expected" \
                    red \n(echo $condition | tr "-" " " \
                                           | cut -c 3-) yellow "$actual"
  end
  return $result
end
