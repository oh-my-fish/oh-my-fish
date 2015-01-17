import plugins/fish-spec

function describe_expect_to_not_contain_all
  function before_each
    set -e result
  end

  function it_is_false_when_lists_are_the_same
    echo (expect 1 2 --to-not-contain-all 1 2; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_is_true_when_lists_are_different
    echo (expect 1 2 --to-not-contain-all 8 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_is_false_when_lists_have_the_same_items_but_in_different_order
    echo (expect 1 2 --to-not-contain-all 2 1; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_is_false_when_expected_list_contains_an_item
    echo (expect 1 2 --to-not-contain-all 1; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_is_true_when_expected_list_does_not_contain_an_item
    echo (expect 1 2 --to-not-contain-all 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_is_false_when_expected_list_contains_all_items
    echo (expect 1 2 3 --to-not-contain-all 1 2; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_is_true_when_expected_array_does_not_contain_any_items
    echo (expect 1 2 3 --to-not-contain-all 8 9; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_is_true_when_expected_array_contains_less_items
    echo (expect 1 2 --to-not-contain-all 1 2 9; set result $status)
    expect $result --to-equal 0
  end
end

spec.run $argv
