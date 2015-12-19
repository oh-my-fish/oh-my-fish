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
