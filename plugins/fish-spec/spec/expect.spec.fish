import plugins/fish-spec

function describe_expect
  function before_each
    set -e result
  end

  function it_is_false_when_comparison_does_not_exist
    echo (expect true --invalid-comparison; set result $status) >/dev/null
    expect $result --to-equal 1
  end
end

spec.run $argv
