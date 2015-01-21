import plugins/fish-spec

function describe_expect_to_be_false
  function it_returns_1_when_evaluated_value_is_0
    expect true --to-be-false

    expect $status --to-equal 1
  end

  function it_returns_0_when_evaluated_value_is_1
    expect false --to-be-false

    expect $status --to-equal 0
  end

  function it_returns_1_when_evaluated_function_returns_0
    expect "eval true" --to-be-false

    expect $status --to-equal 1
  end

  function it_returns_0_when_evaluated_function_returns_1
    expect "eval false" --to-be-false

    expect $status --to-equal 0
  end
end

spec.run $argv
