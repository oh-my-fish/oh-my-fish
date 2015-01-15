import plugins/fish-spec

function describe_to_contain -d 'expect --to-contain'
  function before_each
    set -e result
  end

  function it_returns_0_when_arrays_are_the_same
    set -l array 1 2

    echo (expect $array --to-contain $array; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_arrays_are_different
    set -l array 1 2

    echo (expect $array --to-contain 8 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_arrays_have_the_same_elements_but_in_different_order
    set -l array 1 2

    echo (expect $array --to-contain 2 1; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_0_when_expected_array_contains_the_element
    set -l array 1 2

    echo (expect $array --to-contain 1; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_expected_array_does_not_contain_the_element
    set -l array 1 2

    echo (expect $array --to-contain 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_expected_array_contains_all_elements
    set -l array 1 2 3

    echo (expect $array --to-contain 1 2; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_expected_array_does_not_contain_all_elements
    set -l array 1 2 3

    echo (expect $array --to-contain 1 2 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_1_when_expected_array_contains_less_elements
    set -l array 1 2

    echo (expect $array --to-contain 1 2 9; set result $status) >/dev/null
    expect $result --to-equal 1
  end
end

spec.run $argv
