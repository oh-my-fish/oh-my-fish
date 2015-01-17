import plugins/fish-spec

function describe_list.erase
  function before_each
    set -g nums_until_10 1 2 3 4 5 6 7 8 9 10
    set -g odds_until_10 1 3 5 7 9
  end

  function it_erases_one_element
    list.erase 1 nums_until_10
    expect $nums_until_10 --to-not-contain-all 1
  end

  function it_erases_one_element_without_from_option
    list.erase 1 --from nums_until_10
    expect $nums_until_10 --to-not-contain-all 1
  end

  function it_erases_one_element_from_multiple_lists
    list.erase 1 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain-all 1
      and expect $odds_until_10 --to-not-contain-all 1
  end

  function it_erases_one_element_from_multiple_lists_when_only_one_has_the_element
    list.erase 2 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain-all 2
  end

  function it_erases_multiple_elements
    list.erase 1 2 nums_until_10
    expect $nums_until_10 --to-not-contain-all 1
      and expect $nums_until_10 --to-not-contain-all 2
  end

  function it_erases_multiple_elements_with_from_syntax
    list.erase 1 2 --from nums_until_10
    expect $nums_until_10 --to-not-contain-all 1
      and expect $nums_until_10 --to-not-contain-all 2
  end

  function it_erases_multiple_elements_from_multiple_lists
    list.erase 1 2 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain-all 1
      and expect $nums_until_10 --to-not-contain-all 2
        and expect $odds_until_10 --to-not-contain-all 1
  end

  function it_returns_0_if_any_items_are_erased
    list.erase 10 --from nums_until_10
    expect $status --to-equal 0
  end

  function it_returns_1_if_no_items_are_erased
    list.erase 100 200 300 --from nums_until_10
    expect $status --to-equal 1
  end

  function it_returns_1_if_no_items_are_erased_from_any_lists
    list.erase 100 200 300 --from nums_until_10 odds_until_10
    expect $status --to-equal 1
  end

  function it_returns_0_if_items_are_erased_from_some_but_not_all_lists
    list.erase 1 2 3 --from nums_until_10 odds_until_10
    expect $status --to-equal 0
  end

end

spec.run $argv
