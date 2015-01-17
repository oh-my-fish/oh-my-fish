import plugins/fish-spec

function describe_fish-spec -d "Fish-Spec"
  function it_has_an_output_if_suite_is_blank
    set -l suite "
        import plugins/fish-spec
        spec.run
      "
    expect (run_nested_suite $suite) --to-equal "No tests found."
  end

  function it_has_an_output_if_there_are_no_tests
    set -l suite "
        import plugins/fish-spec
        function describe_blank_suite
        end
        spec.run
      "
    expect (run_nested_suite $suite) --to-equal "No tests found."
  end

  function it_runs_all_describe_blocks
    set -l describe_one     0 1 0
    set -l describe_two     1 0 0
    set -l describe_expects 1 1 0
    set -l suites

    for return_code_index in (seq (count $describe_one))
      set suites $suites "
          import plugins/fish-spec
          function describe_blank_suite
            function it_returns_0_1_0_1_in_that_order
              return $describe_one[$return_code_index]
            end
          end
          function describe_another_blank_suite
            function it_returns_1_0_0_1_in_that_order
              return $describe_two[$return_code_index]
            end
          end
          spec.run
        "
    end
    for index in (seq (count $suites))
      run_nested_suite $suites[$index]
      expect $status --to-equal $describe_expects[$index]
        or return 1
    end
  end

  function it_runs_all_it_blocks
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_is_executed
            return 0
          end

          function it_is_also_executed
            return 0
          end

          function it_is_also_executed
            return 1
          end
        end

        spec.run
      "
    run_nested_suite $suite
    expect $status --to-equal 1
  end

  function it_adds_a_dot_for_a_successful_expectation
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_is_executed
            expect 'success' --to-equal 'success'
          end
        end

        spec.run
      "
    set -l output (run_nested_suite $suite)
    set -l dot    (echo -ne (set_color 00FF7F).)
    expect "$output" --to-equal $dot
  end

  function it_adds_a_dot_for_each_successful_test
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_is_executed
            expect 'success' --to-equal 'success'
          end
          function it_is_executed_again
            expect 'success' --to-equal 'success'
          end
        end

        spec.run
      "
    set -l output (run_nested_suite $suite)
    set -l dot    (echo -ne (set_color 00FF7F).)
    expect "$output" --to-equal $dot$dot
  end
end

function run_nested_suite -a suite
  # Erase and backup original suite functions to avoid an infinite loop.
  spec.functions -eb it_ describe_ -- "backup."

  # Run nested suite
  eval $suite
  set -l result $status

  # Erase functions created by the nested suite
  spec.functions -e it_ describe_

  # Restore original suite functions
  spec.functions -re backup.

  return $result
end

spec.run $argv
