import plugins/fish-spec

function describe_to_equal -d 'expect --to-equal'
  function before_each
    set -e result
  end

  function it_returns_0_when_compared_values_are_the_same
    set -l equal "equal"

    echo (expect $equal --to-equal $equal; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_compared_values_are_different
    set -l equal "equal"

    echo (expect $equal --to-equal 'different'; set result $status) >/dev/null
    expect $result --to-equal 1
  end

  function it_returns_0_when_array_elements_are_in_the_same_order
    set -l array 1 2

    echo (expect $array --to-equal 1 2; set result $status) >/dev/null
    expect $result --to-equal 0
  end

  function it_returns_1_when_array_elements_are_in_different_order
    set -l array 1 2

    echo (expect $array --to-equal 2 1; set result $status) >/dev/null
    expect $result --to-equal 1
  end
end

spec.run $argv
