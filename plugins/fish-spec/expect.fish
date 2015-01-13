# NAME
#   expect - assert a list of expected values match an actual value.
#
# SYNOPSIS
#   expect <expected>...
#          <condition>
#            --to-be-false      exit status is falsy
#            --to-be-true       exit status is truthy
#            --to-contain       <actual> value exists in <expected> list
#            --to-no-contain    <actual> value does not exist in <expected> list
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

  set -l expected  $argv[1..-3]
  set -l condition $argv[-2]
  set -l actual    $argv[-1]
  set -l result    0

  if [ (echo "$actual" | grep '\-\-') ]
    set expected $argv[1..-2]
    set condition $actual
    set actual ""
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
      contains -- "$actual" $expected
    case --to-not-contain
      not contains -- "$actual" $expected
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
