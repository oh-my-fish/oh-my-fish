function __fish-spec.all_specs_init -e all_specs_init -a spec
  set -g __fish_spec_start_time (__fish-spec.current_time)
end

function __fish-spec.all_specs_finished -e all_specs_finished -a spec
  set -l __fish_spec_end_time (__fish-spec.current_time)
  set -l diff (math "scale=3;($__fish_spec_end_time - $__fish_spec_start_time) / 1000")

  echo -en '\n\nFinished in '
  printf '%g' $diff
  echo ' seconds'
end

function __fish-spec.spec_init -e spec_init -a spec
  set -g __current_spec_name (echo $spec | sed 's/^[0-9]*_//;s/_/ /g;s/^it/It/')
  set -e __current_spec_output
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
  echo -e "\n\nFailure: $__current_spec_name"

  if not set -q __current_spec_quiet
    echo (omf::em)  $__current_spec_output(omf::off)
  end

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
  set -g __current_spec_output $error_message
  set -g __current_spec_status error
end
