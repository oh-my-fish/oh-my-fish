import plugins/fish-spec

function describe_fish-spec
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
    set -l suite "
        import plugins/fish-spec

        function describe_blank_suite
          echo 'first describe'
        end

        function describe_another_blank_suite
          echo 'second describe'
        end

        spec.run
      "

    expect (run_nested_suite $suite) --to-contain-all 'first describe' 'second describe'
  end

  function it_runs_all_it_blocks
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_a_test
            echo 'first test'
          end
        end

        function describe_another_suite
          function it_another_test
            echo 'second test'
          end
        end

        spec.run
      "

    expect (run_nested_suite $suite) --to-contain-all 'first test' 'second test'
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

    expect (run_nested_suite $suite) --to-equal (dot)
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

    expect (run_nested_suite $suite) --to-equal (dot)(dot)
  end

  function it_only_adds_a_dot_once_for_each_successful_test
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_is_executed
            expect 'success' --to-equal 'success'
            expect 'success' --to-equal 'success'
          end
        end

        spec.run
      "

    expect (run_nested_suite $suite) --to-equal (dot)
  end

  function it_allows_debugging_messages_to_be_echoed_inside_a_test
    set -l suite "
        import plugins/fish-spec

        function describe_suite
          function it_is_executed
            echo 'I can see this'
          end
        end

        spec.run
      "
    set -l output (run_nested_suite $suite)
    expect "$output" --to-contain-all 'I can see this'
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

function dot
  echo -ne (set_color 00FF7F).
end

spec.run $argv
