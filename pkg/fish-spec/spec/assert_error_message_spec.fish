function describe_assert_error_message
  function before_each
    set -g __fish_spec_output "initial test value"
  end

  function after_each
    set -e __fish_spec_output
  end

  function it_has_no_output_when_the_test_succeeds
    assert 1 = 1

    # Reset test status
    set -e __current_spec_status

    assert 'initial test value' = "$__fish_spec_output"; or echo $__fish_spec_output
  end

  function it_supports_unary_operators
    assert -z "string"

    # Reset test status
    set -e __current_spec_status

    assert 'Expected string to be empty' = "$__fish_spec_output"; or echo $__fish_spec_output
  end

  function it_supports_binary_operators
    assert 1 = 2

    # Reset test status
    set -e __current_spec_status

    assert 'Expected 1 to equals 2' = "$__fish_spec_output"; or echo $__fish_spec_output
  end

  function it_supports_inversion_on_unary_operators
    assert ! -z ""

    # Reset test status
    set -e __current_spec_status

    assert 'Expected  to not be empty' = "$__fish_spec_output"; or echo $__fish_spec_output
  end

  function it_supports_inversion_on_binary_operators
    assert ! 1 = 1

    # Reset test status
    set -e __current_spec_status

    assert 'Expected 1 to not equals 1' = "$__fish_spec_output"; or echo $__fish_spec_output
  end
end
