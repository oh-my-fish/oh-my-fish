function expect
  set -l expected $argv[1..-3]
  set -l comparison $argv[-2]
  set -l actual $argv[-1]

  switch $comparison
    case 'to_equal'
      if test "$expected" = "$actual"
        emit assertion_success
      else
        emit assertion_failure "Expected: \"$expected\""\n"  Actual: \"$actual\""
      end

    case 'to_include'
      set -l item $actual
      set -l list $expected

      if contains -- "$item" $list
        emit assertion_success
      else
        emit assertion_failure "Expected \"$list\" to include \"$item\""
      end

    case 'to_not_include'
      set -l item $actual
      set -l list $expected

      if not contains -- "$item" $list
        emit assertion_success
      else
        emit assertion_failure "Expected \"$list\" to not include \"$item\""
      end
  end
end
