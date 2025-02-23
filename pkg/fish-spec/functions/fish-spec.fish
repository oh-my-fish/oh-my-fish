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
  echo::autocolor $__fish_spec_total_assertions $__fish_spec_failed_assertions "Test complete: $__fish_spec_total_assertions assertions run, $__fish_spec_failed_assertions failed."
  if test $__fish_spec_failed_assertions -gt 0
    return 1
  end
end

function __fish_spec_run_tests_in_file -a test_file
  # reset per file assertion counters
  set -g __fish_spec_failed_assertions_in_file 0
  set -g __fish_spec_total_assertions_in_file 0
  set -g __fish_spec_last_assertion_failed no

  echo::info "Running tests in $test_file..."
  source $test_file

  for suite in (functions | string match -r '^describe_.*')
    __fish_spec_run_tests_in_suite $suite
  end

  functions -e (functions | string match -r '^(describe_.*)$')

  # File-level summary
  echo
  echo::autocolor $__fish_spec_total_assertions_in_file $__fish_spec_failed_assertions_in_file "Summary for $test_file: $__fish_spec_total_assertions_in_file assertions, $__fish_spec_failed_assertions_in_file failed."
  echo
end

function __fish_spec_run_tests_in_suite -a suite
  echo::info (string replace 'describe_' 'DESCRIBE ' $suite | string replace '_' ' ')
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
  echo::info $test_func_human_readable

  if functions --query before_each
    before_each
  end

  $test_func
  set result $status

  if functions --query after_each
    after_each
  end

  if test $__fish_spec_last_assertion_failed = no
    echo::success "✔ $test_func_human_readable passed!"
  else
    echo::failure "✘ $test_func_human_readable failed."
    set __fish_spec_last_assertion_failed no
  end
end
