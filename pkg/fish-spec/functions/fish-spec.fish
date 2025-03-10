function fish-spec
  # set up fish-spec
  set -g __fish_spec_dir (dirname (dirname (status -f)))
  for file in $__fish_spec_dir/framework/*.fish
  source $file
  end

  # reset global assertion counters
  set -g __fish_spec_failed_assertions 0
  set -g __fish_spec_total_assertions 0

  if test "$argv" = ""
    set test_files spec/*_spec.fish
  else
    set test_files $argv
  end

  for test_file in $test_files
    __fish_spec_run_tests_in_file $test_file
  end

  # Global summary
  echo
  __fish_spec.color.echo.autocolor $__fish_spec_total_assertions $__fish_spec_failed_assertions "Test complete: $__fish_spec_total_assertions assertions run, $__fish_spec_failed_assertions failed."
  if test $__fish_spec_failed_assertions -gt 0
    return 1
  end
end

function __fish_spec_run_tests_in_file -a test_file
  # reset per file assertion counters
  set -g __fish_spec_failed_assertions_in_file 0
  set -g __fish_spec_total_assertions_in_file 0
  set -g __fish_spec_last_assertion_failed no

  __fish_spec.color.echo.info "Running tests in $test_file..."
  source $test_file

  for suite in (functions | string match -r '^describe_.*')
    __fish_spec_run_tests_in_suite $suite
  end

  functions -e (functions | string match -r '^(describe_.*)$')

  # File-level summary
  echo
  __fish_spec.color.echo.autocolor $__fish_spec_total_assertions_in_file $__fish_spec_failed_assertions_in_file "Summary for $test_file: $__fish_spec_total_assertions_in_file assertions, $__fish_spec_failed_assertions_in_file failed."
  echo
end

function __fish_spec_run_tests_in_suite -a suite
  __fish_spec.color.echo.info (string replace 'describe_' 'DESCRIBE ' $suite | string replace '_' ' ')
  $suite

  if functions --query before_all
    before_all
  end

  for test_func in (functions | string match -r '^it_.*' | sort)
    __fish_spec_run_test_function $test_func
  end

  set __fish_spec_failed_assertions (math $__fish_spec_failed_assertions + $__fish_spec_failed_assertions_in_file)
  set __fish_spec_total_assertions (math $__fish_spec_total_assertions + $__fish_spec_total_assertions_in_file)

  if functions --query after_all
    after_all
  end

  # Cleanup describe-scoped functions
  functions -e (functions | string match -r '^(before_all|after_all|before_each|after_each|it_.*)$')
end

function __fish_spec_run_test_function -a test_func
  set test_func_human_readable (string replace 'it_' 'IT ' $test_func | string replace -a '_' ' ')
  __fish_spec.color.echo-n.info "⏳ $test_func_human_readable"

  set -l before_each_output ""
  if functions --query before_each
    before_each 2>1 | while read -l line; test -z "$before_each_output" && set before_each_output $line || set before_each_output $before_each_output\n$line; end
  end

  set -l test_func_output ""
  $test_func 2>&1 | while read -l line; test -z "$test_func_output" && set test_func_output $line || set test_func_output $test_func_output\n$line; end
  set result $status

  set -l after_each_output ""
  if functions --query after_each
    after_each 2>&1 | while read -l line; test -z "$after_each_output" && set after_each_output $line || set after_each_output $after_each_output\n$line; end
  end

  if test $__fish_spec_last_assertion_failed = no
    __fish_spec.color.echo.success \r"✅ $test_func_human_readable passed!"
    if test "$FISH_SPEC_VERBOSE" = 1
      test -n "$before_each_output" && echo "$before_each_output"
      test -n "$test_func_output" && echo "$test_func_output"
      test -n "$after_each_output" && echo "$after_each_output"
    end
  else
    __fish_spec.color.echo.failure \r"❌ $test_func_human_readable failed."
    test -n "$before_each_output" && echo "$before_each_output"
    test -n "$test_func_output" && echo "$test_func_output"
    test -n "$after_each_output" && echo "$after_each_output"
    set __fish_spec_last_assertion_failed no
  end
end
