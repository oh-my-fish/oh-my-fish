import plugins/fish-spec

function describe_expect_to_not_contain_all
  function it_is_false_when_lists_are_the_same
    expect 1 2 --to-not-contain-all 1 2

    expect $status --to-equal 1
  end

  function it_is_true_when_lists_are_different
    expect 1 2 --to-not-contain-all 8 9

    expect $status --to-equal 0
  end

  function it_is_false_when_lists_have_the_same_items_but_in_different_order
    expect 1 2 --to-not-contain-all 2 1

    expect $status --to-equal 1
  end

  function it_is_false_when_expected_list_contains_an_item
    expect 1 2 --to-not-contain-all 1

    expect $status --to-equal 1
  end

  function it_is_true_when_expected_list_does_not_contain_an_item
    expect 1 2 --to-not-contain-all 9

    expect $status --to-equal 0
  end

  function it_is_false_when_expected_list_contains_all_items
    expect 1 2 3 --to-not-contain-all 1 2

    expect $status --to-equal 1
  end

  function it_is_true_when_expected_array_does_not_contain_any_items
    expect 1 2 3 --to-not-contain-all 8 9

    expect $status --to-equal 0
  end

  function it_is_true_when_expected_array_contains_less_items
    expect 1 2 --to-not-contain-all 1 2 9

    expect $status --to-equal 0
  end
end

spec.run $argv
