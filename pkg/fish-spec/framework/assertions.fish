function __fish_spec_assert_generic -a first second success_template failure_template test_command
  set __fish_spec_total_assertions_in_file (math $__fish_spec_total_assertions_in_file + 1)

  if eval not "$test_command"
    set __fish_spec_failed_assertions_in_file (math $__fish_spec_failed_assertions_in_file + 1)
    set __fish_spec_last_assertion_failed yes
    eval __fish_spec.color.echo.failure "$failure_template"
    return 1
  end
  if test "$FISH_SPEC_VERBOSE" = 1
    eval __fish_spec.color.echo.success "$success_template"
  end
end

function assert
  set -l first "$argv"
  __fish_spec_assert_generic \
    $first unused \
    'Assertion \"test $first\" passed!' \
    'Assertion failed: \"test $first\" evaluated to false.' \
    "test '$argv'"
    return $status
end

function assert_equal -a first second
  __fish_spec_assert_generic \
    $first $second \
    'Assertion \"$first\" == \"$second\" passed!' \
    'Assertion failed: Expected \"$first\", but got \"$second\".' \
    'test "$first" = "$second"'
end

function assert_not_equal -a first second
  __fish_spec_assert_generic \
    $first $second \
    'Assertion \"$first\" != \"$second\" passed!' \
    'Assertion failed: Expected \"$second\" to be different from \"$expecte\".' \
    'test "$first" != "$second"'
end

function assert_exit_code -a expected_status
  __fish_spec_assert_generic \
    $expected_status $status \
    'Assertion exit code $second == $first passed!' \
    'Assertion failed: Expected exit code $first, but got $second.' \
    'test "$first" -eq "$second"'
end

function assert_ok
  assert_exit_code 0
end

function assert_true -a condition
  __fish_spec_assert_generic \
    $condition 0 \
    'Assertion \"$first\" is true passed!' \
    'Assertion failed: Expected true, but got \"$first\".' \
    'test $first'
end

function assert_false -a condition
  __fish_spec_assert_generic \
    $condition 0 \
    'Assertion \"$first\" is false passed!' \
    'Assertion failed: Expected false, but got \"$first\".' \
    'test ! $first'
end

function assert_match -a pattern string
  __fish_spec_assert_generic \
    $pattern $string \
    'Assertion string \"$string\" matches pattern \"$pattern\" passed!' \
    'Assertion failed: string \"$second\" does not match pattern \"$first\".' \
    'string match -qr $first $second'
end


function assert_match -a pattern string
  __fish_spec_assert_generic \
    $pattern $string \
    'Assertion string \"$string\" does not match pattern \"$pattern\" passed!' \
    'Assertion failed: string \"$second\" does not match pattern \"$first\".' \
    'not string match -qr $first $second'
end

function assert_file_exists -a file
  __fish_spec_assert_generic \
    $file unused \
    'Assertion file \"$first\" exists passed!' \
    'Assertion failed: File \"$first\" does not exist.' \
    'test -f $first'
end

function assert_file_does_not_exist -a file
  __fish_spec_assert_generic \
    $file unused \
    'Assertion file \"$first\" does not exist passed!' \
    'Assertion failed: File \"$first\" exists.' \
    'not test -f $first'
end

function assert_directory_exists -a dir
  __fish_spec_assert_generic \
    $dir unused \
    'Assertion directory \"$first\" exists passed!' \
    'Assertion failed: Directory \"$first\" does not exist.' \
    'test -d $dir'
end

function assert_directory_does_not_exist -a file
  __fish_spec_assert_generic \
    $file unused \
    'Assertion directory \"$first\" does not exist passed!' \
    'Assertion failed: Directory \"$first\" exists.' \
    'not test -d $first'
end

function assert_file_empty -a file
  __fish_spec_assert_generic \
    $file unused \
    'Assertion file $first is empty passed!' \
    'Assertion failed: File \"$first\" is not empty.' \
    'not test -s $file'
end

function assert_file_contains -a file content
  __fish_spec_assert_generic \
    $file $content \
    'Assertion $first contains \"$second\" passed!' \
    'Assertion failed: File \"$first\" does not contain \"$second\".' \
    'grep -q "$second" $first'
end

function assert_file_contains_regex -a file pattern
  __fish_spec_assert_generic \
    $file $pattern \
    'Assertion $first content matches regex \"$second\" passed!' \
    'Assertion failed: File \"$first\" does not contain a string matching the pattern \"$second\".' \
    'grep -qE "$second" $first'
end

function assert_not_file_contains -a file content
  __fish_spec_assert_generic \
    $file $content \
    'Assertion $first does not contain \"$content\" passed!' \
    'Assertion failed: File \"$first\" contains \"$second\".' \
    'not grep -q "$second" $first'
end

function assert_not_file_contains_regex -a file pattern
  __fish_spec_assert_generic \
    $file $pattern \
    'Assertion $first content does not match regex \"$second\" passed!' \
    'Assertion failed: File \"$first\" contains a string matching the pattern \"$second\".' \
    'not grep -qE "$second" $first'
end

function assert_in_array -a value
  set -g __fish_spec_assertion_array $argv[2..-1]
  __fish_spec_assert_generic \
    $value "$__fish_spec_assertion_array" \
    'Assertion \"$first\" in [$second] passed!' \
    'Assertion failed: Value \"$first\" is not in the array [$second].' \
    'contains -- $first $__fish_spec_assertion_array'
  set result $status
  set -e __fish_spec_assertion_array
  return $result
end

function assert_not_in_array -a value
  set -g __fish_spec_assertion_array $argv[2..-1]
  __fish_spec_assert_generic \
    $value "$__fish_spec_assertion_array" \
    'Assertion \"$first\" not in [$second] passed!' \
    'Assertion failed: Value \"$first\" is in the array [$second].' \
    'not contains -- $first $__fish_spec_assertion_array'
  set result $status
  set -e __fish_spec_assertion_array
  return $result
end
