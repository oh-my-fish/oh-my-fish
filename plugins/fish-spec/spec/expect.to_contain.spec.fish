import plugins/fish-spec

function describe_expect_to_contain
  function before_each
    set -e result
  end

  function it_returns_0_when_lists_are_the_same
    set -l array 1 2

    echo (expect $array --to-contain $array; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_lists_are_different
    set -l array 1 2

    echo (expect $array --to-contain 8 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_lists_have_the_same_item_but_in_different_order
    set -l array 1 2

    echo (expect $array --to-contain 2 1; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_0_when_expected_list_contains_the_item
    set -l array 1 2

    echo (expect $array --to-contain 1; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_expected_list_does_not_contain_the_item
    set -l array 1 2

    echo (expect $array --to-contain 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_expected_list_contains_all_items
    set -l array 1 2 3

    echo (expect $array --to-contain 1 2; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_expected_list_does_not_contain_all_items
    set -l array 1 2 3

    echo (expect $array --to-contain 1 2 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_1_when_expected_list_contains_less_items
    set -l array 1 2

    echo (expect $array --to-contain 1 2 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end
end

spec.run $argv
