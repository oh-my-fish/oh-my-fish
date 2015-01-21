import plugins/fish-spec

function describe_expect_to_equal
  function it_returns_0_when_compared_values_are_the_same
    expect 'equal' --to-equal 'equal'

    expect $status --to-equal 0
  end

  function it_returns_1_when_compared_values_are_different
    expect 'equal' --to-equal 'different'

    expect $status --to-equal 1
  end

  function it_returns_0_when_list_items_are_in_the_same_order
    expect 1 2 --to-equal 1 2

    expect $status --to-equal 0
  end

  function it_returns_1_when_list_items_are_in_different_order
    expect 1 2 --to-equal 2 1

    expect $status --to-equal 1
  end
end

spec.run $argv
