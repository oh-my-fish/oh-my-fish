import plugins/fish-spec
import plugins/getopts

function describe_getotps -d "fish getopts"
  function __getopts
    set -l options $argv[1]
    set -e argv[1]
    while set option (getopts $options $argv)
      if [ (count $option) -gt 1 ] # w/ argument
        set result "$result$option[1]($option[2])"
      else
        set result "$result$option"
      end
    end
    printf "$result$option"
  end

  function it_returns_1_if_empty
    getopts
    expect $status --to-equal 1
  end

  function it_handles_a_single_short_option
    expect (__getopts "a" -a) --to-equal a
  end

  function it_handles_a_single_long_option
    expect (__getopts "aa" --aa) --to-equal aa
  end

  function it_handles_short_options
    set -l options "a b c x y z"
    set -l expected abcxyz
    expect (__getopts $options -abc -xyz) --to-equal $expected
      and expect (__getopts $options -a -b -c -x -y -z) --to-equal $expected
  end

  function it_handles_long_options
    expect (__getopts "x-rays ye zombie" --ye --zombie --x-rays) \
      --to-equal yezombiex-rays
  end

  function it_handles_long_options_only
    expect (__getopts "all blink crunch" --all --blink --crunch) \
      --to-equal allblinkcrunch
  end

  function it_handles_all_options
    expect (__getopts "g:get p:put u:update d:delete t:post" -tud --put --get) \
      --to-equal tudpg
  end

  function it_handles_operands
    expect (__getopts "" 1 2 3 4 5) --to-equal "1 2 3 4 5"
  end

  function it_handles_options_and_operands
    expect (__getopts "g:get p:put u:update d:delete t:post" \
    -ud --put --get --post url1 url2 user:password) \
      --to-equal "udpgturl1 url2 user:password"
  end

  function it_handles_end_of_args_separator
    expect (__getopts "a b c d" -abcd -- -x -y -z) --to-equal "abcd-x -y -z"
  end

  function it_detects_end_of_args
    expect (__getopts "a b c" -abc 1 2 3 -x) --to-equal "abc1 2 3 -x"
  end

  function it_returns_unknown_option_error_on_strict_mode
    while set option (getopts ":a b c d e f" -abcXdef 1 2 3)
      set result "$result$option"
    end

    expect $status --to-equal 3
  end

  function it_handles_valid_options_while_on_strict_mode
    while set option (getopts ":a b c d e f" -fed -cba 1 2 3)
      set result "$result$option"
    end

    expect "$result" --to-equal fedcba
      and expect "$option" --to-equal "1 2 3"
  end

  function it_returns_argument_missing_error_if_argument_is_missing
    while set option (getopts "x y z:" -xy -z)
    end

    expect $status --to-equal 2
  end

  function it_handles_options_normally_until_an_error_is_found
    while set option (getopts ":a b c d e f" -abcXdef 1 2 3)
      set result "$result$option"
    end

    expect "$result" --to-equal abc
    expect "$option" --to-equal X
  end

  function it_handles_short_options_separated_by_blanks
    expect (__getopts "a: b: c:" -a '1st arg' -b '2nd arg' -c '3rd arg') \
      --to-equal "a(1st arg)b(2nd arg)c(3rd arg)"
  end

  function it_handles_a_short_option_w_required_argument_without_space_separation
    expect (__getopts "a: b:" -adarwin -blinux) --to-equal "a(darwin)b(linux)"
  end

  function it_handles_a_short_option_w_optional_argument_with_space_separation
    expect (__getopts "a: b:^" -a darwin -b linux) --to-equal "a(darwin)b()linux"
  end

  function it_handles_options_w_argument
    set -l url "http://github.com"
    set -l expected "pg($url)"
    set -l options "g:get: p:put"
    expect (__getopts $options -pg$url) --to-equal $expected
      and expect (__getopts $options -p --get $url) --to-equal $expected
  end

  function it_handles_options_w_optional_argument
    set -l url "http://github.com"
    set -l expected "pg($url)"
    set -l options "g:get:^ p:put"
    expect (__getopts $options -pg$url) --to-equal $expected
      and expect (__getopts $options -p --get=$url) --to-equal $expected
        and expect (__getopts $options -pg) --to-equal "pg()"
  end

  function it_handles_a_contrived_example
    set -l options "A b c: x y z: long long-req: long-opt:^"
    set -l args -xyz777 -Abc100 --long --long-req 32 --long-opt=!!! D O N E
    expect (__getopts $options $args) --to-equal \
      "xyz(777)Abc(100)longlong-req(32)long-opt(!!!)D O N E"
  end
end

spec.run $argv
