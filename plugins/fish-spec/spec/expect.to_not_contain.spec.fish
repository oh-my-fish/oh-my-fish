import plugins/fish-spec

function describe_expect_to_not_contain
  function before_each
    set -e result
  end

  function it_returns_1_when_lists_are_the_same
    set -l list 1 2

    echo (expect $list --to-not-contain $list; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_lists_are_different
    set -l list 1 2

    echo (expect $list --to-not-contain 8 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_lists_have_the_same_items_but_in_different_order
    set -l list 1 2

    echo (expect $list --to-not-contain 2 1; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_1_when_expected_list_contains_an_item
    set -l list 1 2

    echo (expect $list --to-not-contain 1; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_expected_list_does_not_contain_an_item
    set -l list 1 2

    echo (expect $list --to-not-contain 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_expected_list_contains_all_items
    set -l list 1 2 3

    echo (expect $list --to-not-contain 1 2; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_expected_array_does_not_contain_any_items
    set -l list 1 2 3

    echo (expect $list --to-not-contain 1 2 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_0_when_expected_array_contains_less_items
    set -l list 1 2

    echo (expect $list --to-not-contain 1 2 9; set result $status)
    expect $result --to-equal 0
  end
end

spec.run $argv
