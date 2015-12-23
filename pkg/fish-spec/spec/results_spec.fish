function describe_results
  function it_succeeds_when_single_assertion_succeeds
    assert 1 = 1

    assert success = "$__current_spec_status"
  end

  function it_succeeds_when_multiple_assertion_succeeds
    assert 1 = 1
    assert 2 = 2

    assert success = "$__current_spec_status"
  end

  function it_fails_when_single_assertion_fails
    set -g __fish_spec_output "quiet"

    assert 1 = 2
    set -l spec_status $__current_spec_status

    # Reset internals
    set -e __current_spec_status

    assert error = "$spec_status"
  end

  function it_fails_when_one_of_the_assertions_fails
    set -g __fish_spec_output "quiet"

    assert 1 = 2
    assert 2 = 2
    set -l spec_status $__current_spec_status

    # Reset internals
    set -e __current_spec_status

    assert error = "$spec_status"
  end
end
