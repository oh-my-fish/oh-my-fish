function describe_results
  function it_succeeds_when_single_assertion_succeeds
    assert 1 = 1

    assert 0 = $status
  end

  function it_succeeds_when_multiple_assertion_succeeds
    assert 1 = 1
    assert 2 = 2
  end

  function it_fails_when_single_assertion_fails
    set previous_assertion_counter $__fish_spec_failed_assertions_in_file
    assert 1 = 2
    assert_exit_code 1
    echo decrement failed assertion counter so tests pass as expected
    set __fish_spec_failed_assertions_in_file (math $__fish_spec_failed_assertions_in_file - 1)
    assert_equal $previous_assertion_counter $__fish_spec_failed_assertions_in_file
  end

  function it_fails_when_one_of_the_assertions_fails
    set previous_assertion_counter $__fish_spec_failed_assertions_in_file
    assert 1 = 2
    assert_exit_code 1
    assert 2 = 2
    echo decrement failed assertion counter so tests pass as expected
    set __fish_spec_failed_assertions_in_file (math $__fish_spec_failed_assertions_in_file - 1)
    assert_equal $previous_assertion_counter $__fish_spec_failed_assertions_in_file
  end
end
