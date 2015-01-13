# NAME
#   spec.eval - eval a function by name and echo its description field
#
# SYNOPSIS
#   spec.eval <function> [OPTIONS...]

# OPTIONS
#   <function>
#     Name / glob of one or more functions to evaluate. By default find all
#     functions that match the glob and test each. To run a single function,
#     use the -u --unit option as described below.
#
#   [-u --unit]
#     Evaluate a single function as indicated by <function>.
#
#  [-d --depth <depth>]
#     Used to calculate the increment rate of padding added to test blocks.
#     A depth of N will prepend N*2 spaces to test descriptions. No padding
#     is added by default. Use a depth of 0 to NOT output newlines between
#     each test log output.
#
#  [-s --silent]
#     Do NOT output test descriptions. This option is off by default.
#
# DESCRIPTION
#   Run the specified function. Add a -d --description field to tests in
#   order to log a message before evaluating the function. Use the depth
#   option to indicate the indentation factor when logging a message.
#
#   The process is split up in these steps:
#
#   1. Extract test name.
#   2. Parse description from function definition if available.
#   3. Parse options
#     + Calculate indentation from --depth * $tab.
#     + Determine newline output.
#     + Skip output if -s --silent is specified.
#
# EXAMPLES
#   spec.eval "describe_" --depth 0
#   spec.eval "teardown_"
#   spec.eval "it_"
#   spec.eval "my_test" --unit
#/
function spec.eval -d "Eval a function by name and echo its description field."
  # Parse and print description field of a function.
  # spec.get.info <function name>
  function spec.get.info -a name
    type $name        \
    | head -n 2       \
    | tail -n 1       \
    | cut -d" " -f4-  \
    | sed "s/^\'//g"  \
    | sed "s/\'\$//g"
  end

  set -l default_color white
  # Keep a copy in case -u --unit option is used.
  set -l query $argv[1]
  # Collect all functions that start with $query's key.
  set -l tests (spec.functions $query)
  set -l tab      2
  set -l indent  ""
  set -l newline \n
  set -l silent  ""

  for index in (seq (count $argv))
    switch $argv[$index]
      case -d --depth
        set -l depth $argv[(math $index + 1)]
        if [ $depth -gt 0 ]
          set indent (printf " %.0s" (seq (math $depth \* $tab)))
        else
          set newline ""
        end
      case -s --silent
        set silent $argv[$index]
      case -u --unit
        # Evaluate query as a single function instead of a set.
        set tests $query
    end
  end

  for test in $tests
    if [ -z "$silent" ]
      set -l info (spec.get.info $tests)
      if [ -n "$info" ]
        # Do not print empty lines for tests with empty descriptions.
        set info $newline$indent$info
      end
      spec.log --message $default_color "$info"
    end
    eval $test
      or return 1
  end
end
