# NAME
#   spec.run - run suite of tests
#
# SYNOPSIS
#   spec.run [-v --verbose]
#
# DESCRIPTION
#   In order to run tests create the test file, import plugins/spec at
#   before adding any of the functions described above and call spec.run.
#
# FUNCTIONS
#   import plugins/spec
#
#   function before_all     Run before any tests are run.
#   function before_each    Run before each test.
#   function describe_*     Use to organize different specs.
#   function it_*           Use to test your library/plugin.
#   function after_each     Run after each test.
#   function after_all      Run after all tests are finished.
#
# EXAMPLES
#     import plugins/fish-spec
#     function describe_erase
#       function before_each
#         set -g nums 1 2 3
#       end
#       function it_erases_one_item -d "It should erase an item from a list."
#         erase 1 --from nums
#         expect $nums --to-not-contain 1
#       end
#     end
#     spec.run --verbose
#
# AUTHORS
#   Bruno Pinto <@pfbruno>
#   Jorge Bucaran <@bucaran>
#/
function spec.run
  set -l result 0 # Optimism
  set -l output "--silent"
  if contains -- $argv[1] -v --verbose
    set output ""
  end
  # Run 1 or more topmost describe blocks causing fish to load inmediately
  # scoped functions, i.e, those inside any invoked describe_ blocks.
  spec.eval describe_ --depth 0 $output
  spec.eval before_all $output
  for test in (spec.functions "it_")
    spec.eval before_each $output
    # Stop test execution if an expectation fails.
    if not spec.eval $test --unit --depth 1 $output
      set result 1 # Flunk
    end

    # Make sure to run after_each if test fails.
    spec.eval after_each $output
    if [ $result -eq 1 ]
    # We can safely exit the loop if test fails.
      break
    end
  end
  spec.eval after_all $output

  return $result
end
