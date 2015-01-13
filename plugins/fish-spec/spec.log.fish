# NAME
#   spec.log - log a message / test result
#
# SYNOPSIS
#   spec.log -m | --msg/--message
#            -o | --ok
#            -f | --fail
#            [<color> <string>...]
# OPTIONS
#   -m --msg --message
#     Output the message according to the <color> <string>... list.
#
#   -o --ok
#     Echo a . character. Optionally, print a list of <color> <string>...
#     messages.
#
#   -f --fail
#     Echo a ✘ character. Optionally, print a list of <color> <string>...
#     messages. Use this feature to indicate the expected value, condition
#     description and actual value of the failed assertion. For example:
#
#       spec.log --fail red "Expected" blue "$value"
#
# NOTES
#   This function does not modify the $status variable.
#
#   Some tests may specify multiple success conditions, invoking `expect`
#   several times per test case. In this case, spec.log will be run once
#   each per `expect` call.
#
#   Notice that a message in the form [<color> <string>...] implies that
#   colors occupy odd and strings even indices after the first option.
#/
function spec.log -d "Log / commit a message or test result."
  switch $argv[1]
    case -o --ok
      set -e argv[1]
      set argv green . $argv
    case -f --fail
      set -e argv[1]
      set argv red ✘ $argv
    case -m --msg --message
      # Default message color.
      set -e argv[1]
  end

  if [ (count $argv) -gt 0 ]
    for i in (seq (count $argv))
      if [ (math "$i % 2") -eq 0 ]
        echo -ne $argv[$i](set_color white)
      else
        set_color $argv[$i]
      end
    end
  end
end
