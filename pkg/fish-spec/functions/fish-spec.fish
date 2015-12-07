function fish-spec
  # Reset internal variables
  set -e __any_spec_failed

  # Load each spec file
  for spec_file in spec/*_spec.fish
    source $spec_file
  end

  # Load helper file
  source spec/helper.fish ^/dev/null

  # Run all specs
  __fish-spec.run_all_specs

  not set -q __any_spec_failed
end

function __fish-spec.run_all_specs
  for suite in (functions -n | grep describe_)
    __fish-spec.run_suite $suite
    functions -e $suite
  end
end

function __fish-spec.run_suite -a suite_name
  # This gets the list of specs that were defined on the test suite by
  # comparing the functions names before and after the evaluation of the test suite.
  set -l specs (begin
    functions -n | grep it_
    eval $suite_name >/dev/null
    functions -n | grep it_
  end | sort | uniq -u)

  functions -q before_all; and before_all

  for spec in $specs
    emit spec_init $spec
    functions -q before_each; and before_each
    eval $spec
    functions -q after_each; and after_each
    emit spec_finished $spec
  end

  functions -q after_all; and after_all

  functions -e before_all before_each after_each after_all
end

function __fish-spec.spec_init -e spec_init -a spec
  set -e __current_spec_status
end

function __fish-spec.spec_finished -e spec_finished -a spec
  functions -e $spec

  switch "$__current_spec_status"
    case success
      emit spec_success
    case error
      emit spec_error
    case '*'
      emit spec_no_assertions
  end
end

function __fish-spec.spec_success -e spec_success
  echo -n '.'
end

function __fish-spec.spec_error -e spec_error
  echo -n 'F'
  set -g __any_spec_failed true
end

function __fish-spec.spec_no_assertions -e spec_no_assertions
  echo -n 'N/A'
end

function __fish-spec_assertion_success -e assertion_success
  set -q __current_spec_status; or set -g __current_spec_status success
end

function __fish-spec_assertion_error -e assertion_error -a error_message
  # Mimics output redirect inside an event handler
  if set -q __fish_spec_output
    set __fish_spec_output $error_message
  else
    echo $error_message
  end

  set -g __current_spec_status error
end
