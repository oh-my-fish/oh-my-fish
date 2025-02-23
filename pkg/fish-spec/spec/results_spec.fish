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
    assert 1 = 2
  end

  function it_fails_when_one_of_the_assertions_fails
    assert 1 = 2
    assert 2 = 2
  end
end
