import plugins/fish-spec

function describe_list_erase -d "Testing Oh-My-Fish `list.erase` function..."
  function before_each
    set -g nums_until_10 1 2 3 4 5 6 7 8 9 10
    set -g odds_until_10 1 3 5 7 9
  end

  function it_erases_one_element -d "It should erase an element from a list."
    list.erase 1 nums_until_10
    expect $nums_until_10 --to-not-contain 1
  end

  function it_erases_one_element_without_from_option \
    -d "It should erase an element with --from option."
    list.erase 1 --from nums_until_10
    expect $nums_until_10 --to-not-contain 1
  end

  function it_erases_one_element_from_multiple_lists \
    -d "It should erase an element from multiple lists."
    list.erase 1 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain 1
      and expect $odds_until_10 --to-not-contain 1
  end

  function it_erases_one_element_from_multiple_lists_when_only_one_has_the_element \
    -d "It should erase an element from multiple lists when only one has the element."
    list.erase 2 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain 2
  end

  function it_erases_multiple_elements \
    -d "It should erase multiple elements."
    list.erase 1 2 nums_until_10
    expect $nums_until_10 --to-not-contain 1
      and expect $nums_until_10 --to-not-contain 2
  end

  function it_erases_multiple_elements_with_from_syntax \
    -d "It should erase multiple elements with --from option."
    list.erase 1 2 --from nums_until_10
    expect $nums_until_10 --to-not-contain 1
      and expect $nums_until_10 --to-not-contain 2
  end

  function it_erases_multiple_elements_from_multiple_lists \
    -d "It should erase multiple elements from multiple lists."
    list.erase 1 2 --from nums_until_10 odds_until_10
    expect $nums_until_10 --to-not-contain 1
      and expect $nums_until_10 --to-not-contain 2
        and expect $odds_until_10 --to-not-contain 1
  end
end

spec.run $argv
