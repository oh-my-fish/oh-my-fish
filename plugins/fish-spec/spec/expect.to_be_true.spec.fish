import plugins/fish-spec

function describe_expect_to_be_true
  function before_each
    set -e result
  end

  function it_returns_0_when_evaluated_value_returns_0
    echo (expect true --to-be-true; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_evaluated_value_returns_1
    echo (expect false --to-be-true; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_evaluated_function_returns_0
    echo (expect "eval true" --to-be-true; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_evaluated_function_returns_1
    echo (expect "eval false" --to-be-true; set result $status) >/dev/null
    expect $result --to-equal 1
  end
end

spec.run $argv
