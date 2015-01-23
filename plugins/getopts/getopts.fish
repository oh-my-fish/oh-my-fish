# NAME
#   getopts -- getopts for fish
#
# SYNOPSIS
#   getopts <option string> [ARGV...]
#
# OPTIONS
#   <option string> [:][<letter>][[:]<word>[:[^]]]
#
#   A string containing the option characters recognized by the utility
#   calling getopts. If a <letter> or <word> ends in `:`, the option is
#   expected to have an argument, which may be supplied separately or
#   next to the option without spaces in the same string.
#
#   To indicate long options: <letter>:<word> and <word> are both valid
#   option strings that will attempt to match -<letter> and --<word>.
#
#   For only short options, do not specify a :<word> after <letter>.
#   For example, `a b` will match `-a` and/or `-b`.
#
#   To indicate optional arguments, use a `^` character after a `:` at
#   the end of the option in the option string. For example <letter>:^
#   and <letter>:<word>:^ are both valid. Optional arguments should be
#   supplied in the same string as the option and without spaces, e.g,
#   -<letter>value will correctly assign `value` as the argument to the
#   the option <letter>, but -<letter> value, will parse `value` as the
#   next argument in <argv>.
#
#   To specify optional arguments using the option's long form, use a
#   `=` character after the option: --<word>=value.
#
#   Use a `:` at the beginning of the option string to enable strict
#   mode. If enabled, getopts will exit with a status > 0 if or when
#   an unknown option is found. See DIAGNOSTICS.
#
#   <ARGV>
#
#   List of options and operands to parse. getopts prints any matched
#   options as well as available argument separated by a \n to stdout
#   and returns with a status of 0 if there are still arguments; else
#   returns with a status > 0 if the end of the options is reached or
#   an error occurs. See DIAGNOSTICS.
#
# DESCRIPTION
#   getopts obtains options and their arguments from a list of parameters
#   that, as indicated by <option string>, are single letters preceded by
#   a - or words preceded by -- and possibly followed by an argument value.
#
#   fish getopts follows the specifications described in the Utility Syntax
#   Guidelines (see LINKS); the following is a summary of the features:
#
#     + Short options; single letters preceded by -, and long options;
#       words preceded by --, are both supported.
#
#     + Single letters may be grouped. -abc → -a -b -c
#
#     + Options required to take an argument can specify the argument
#       either in the same string as the option or separated from the
#       by a space. (1) -a argument, (2) -aargument
#
#     + Options that can take an argument optionally shall specify the
#       argument in the same string as the option argument if in short
#       option style: -aargument, or separated by a = if in long form:
#       --long-form=argument. If a blank space is used, the following
#       argument will be treated independently.
#
#     + Options can appear multiple times in the same argument list.
#       getopts will print every match sequentally on each call, and
#       should default to the short form of the option if available.
#
#     + The option delimiter `:` and optional argument character `^`
#       shall not be used as an option.
#
#     + getopts will return the remaining operands when the end of the
#       options is reached, i.e, a `--` argument that is not an option
#       is found, or an argument that does not begin with `-` is found.
#
# ENVIRONMENT VARIABLES
#   The following environment variables are used internally by getopts.
#   These variables are erased from memory when the functions returns 1.
#
#     + __getopts_optstr      Whitespace trimmed option string.
#     + __getopts_argv        Preprocessed copy of arguments.
#     + __getopts_index       Index of the next argument to handle.
#     + __getopts_required    List of options with required arguments.
#     + __getopts_optional    List of options with optional arguments.
#
# DIAGNOSTICS
#   Possible exit status values are:
#
#     0  An argument formed like an option was found. This causes getopts
#        to print the option short-style and its argument if avaiable. If
#        strict-mode is enabled setting the first character of the option
#        to `:`, an unknown option will cause getopts to fail. See below.
#
#     1  The end of the options was reached. Remaining operands are also
#        sent to stdout.
#
#     2  An option argument was missing.
#
#     3  An unknown option was found. Only if strict-mode is enabled.
#
# EXAMPLES
#   function my_utility
#     while set optarg (getopts "l:long x: o:optional:^" $argv)
#       switch $optarg[1]
#         case l
#           echo handle `-l --long`
#         case x
#           echo handle `-x` w/ argument `$optarg[2]`
#         case o
#           echo handle `-o --optional` w/ optional argument `$optarg[2]`
#         case \*
#           echo unknown option `$optarg[1]`
#       end
#     end
#     echo -n operands: "`$optarg`"
#   end
#
# LINKS
#   UNIX Utility Conventions
#   → http://pubs.opengroup.org/onlinepubs/7908799/xbd/utilconv.html
#
# AUTHORS
#   Jorge Bucaran <@bucaran>
#/
function getopts
  # Currently supported return success/error conditions.
  set -l __CONTINUE                   0
  set -l __END_OF_OPTIONS             1
  set -l __OPTION_ARGUMENT_EXPECTED   2
  set -l __UNKNOWN_OPTION_FOUND       3

  # Self-destroying global variable cleanup utility.
  # Should be called before returning 1.
  function __getopts_cleanup
    set -e __getopts_optstr
    set -e __getopts_argv
    set -e __getopts_index
    set -e __getopts_required
    set -e __getopts_optional
    set -e __getopts_strict_mode
    functions -e __getopts_increase_index
  end

  function __getopts_increase_index
    set __getopts_index (math $__getopts_index + 1)
  end

  # Options string pre-processing.
  if not set -q __getopts_optstr
    set -g __getopts_optstr $argv[1]
    set -e argv[1]

    # Trim option string and collect required / optional options.
    if [ -n "$__getopts_optstr" ]
      set __getopts_optstr (printf $__getopts_optstr | tr '[:space:]' \n)

      # Setting the first token of the option string to `:` enables
      # strict mode. This causes getopts to abort the process if an
      # unknown option is found.
      set -l first_token (printf $__getopts_optstr | head -c1)

      if [ : = "$first_token" ]
        set -g __getopts_strict_mode --true

        # We can safely remove the `:` character now.
        set __getopts_optstr[1] (printf $__getopts_optstr[1] | cut -c2-)
      end

      # Collect options with optional and required option-arguments.
      function __getopts_collect_optargs
        for string in (printf "%s\n" $__getopts_optstr)
          set -l token (printf $string | tail -c1)
          set -l split_string (printf "%s\n" $string | tr : \n)

          # Erase last to make sure not to append `^` token.
          switch $token
            case :
              set -g __getopts_required $__getopts_required $split_string
              set -e __getopts_required[-1]
            case \^
              set -g __getopts_optional $__getopts_optional $split_string
              set -e __getopts_optional[-1]
          end
        end
        functions -e __getopts_collect_optargs
      end

      __getopts_collect_optargs
    end
  end

  # Sanitize arguments. Break up flags: -abc → -a -b -c, but skip optional
  # arguments. If -w is a flag that can take an optional argument, -abw123
  # should be parsed to → -a -b -w 123.
  if not set -q __getopts_argv
    function __getopts_sanitize_argv
      for token in $argv
        switch $token
          case --\* # Skip!
          case -\*
            # Split each token into single characters with `.`
            for char in (printf $token | cut -c2- | grep --only-matching .)
              # Do not split short option characters if this option can
              # take optional required arguments.
              if [ -z "$suspend_break" ]
                printf "-%s\n" $char
              else
                printf "%s" $char
              end

              # Suspend option break-up if the current option is either
              # a required or an optional option type.
              contains -- $char $__getopts_required $__getopts_optional
                and set suspend_break --true

              set last_char $char
            end

            # Break options if we were in suspend mode and reset flag.
            # This makes sure to add a blank space if no argument was
            # specified for the optional option-argument, but not for
            # the required option-argument.
            if [ -n "$suspend_break" ]
              not contains -- $last_char $__getopts_required
                and printf "\n"
              set suspend_break ""
            end
            continue
        end

        printf "%s\n" $token
      end
      functions -e __getopts_sanitize_argv
    end
    set -g __getopts_argv (__getopts_sanitize_argv $argv)
  end

  # Always use our preprocessed argument list.
  set argv $__getopts_argv

  if not set -q __getopts_index
    set -g __getopts_index 1
  end

  # Handle next argument as indicated by the current index.
  if set -q argv[$__getopts_index]
    set -l option $argv[$__getopts_index]

    # Potential matches for $option are: (1) end of arguments `--`,
    # (2) long/short options --* or -* or (3) begin of operands, if
    # (1) and (2) fail.
    switch $option
      # End of arguments. Assume everything from this point are operands.
      case --
        set -e argv[1..$__getopts_index]
        printf "%s\n" $argv
        __getopts_cleanup
        return $__END_OF_OPTIONS

      # Looks like we have a well-formed long/short option. Parse.
      case --\* -\*
        # It will be useful later to know if the current option is in long
        # style. Notice we add a leading blank, because cut fails when the
        # first character is a dash `-`.
        set -e is_long_option
        test (printf " "$option | cut -c2-3) = "--"
          and set -l is_long_option

        # Trim leading dashes and prepare to match with valid options.
        set option (printf $option | sed 's/^-*//g')

        for substring in $__getopts_optstr
          # Split up by token separator `:`. The resulting list contains
          # all valid options, both in short and long style.
          set -l tokens (printf $substring | tr : \n)

          # Start last to first to avoid mistaking long w/ short options.
          for index in (seq (count $tokens) -1 1)
            set -l last_token (printf $substring | tail -c1)

            # Find options with optional argument in long-style and
            # try to split by required delimiter `=`

            # Note: Optional values shall be separated from options in
            # long style by an equals sign. See documentation.

            if [ $last_token = \^ ]
              if set -q is_long_option
                set -l option_value (printf $option | tr = \n)

                if set -q option_value[2]
                  # Check if it is a valid option match.
                  if [ $option_value[1] = $tokens[$index] ]
                    printf "%s\n" $tokens[1]
                    printf $option_value[2]

                    __getopts_increase_index
                    return $__CONTINUE
                  end
                end
              end
            end

            # We are already inside a possible short/long option match.
            # Option is the argument in __getopts_argv[__getopts_index]
            # The following compares option against each valid argument
            # in the option string __getopts_optstr. If no match can be
            # found, print the argument after the loop.

            switch $option
              case $tokens[$index]
                # Success. Send first token to stdout to make sure short
                # options, if available, always get the highest priority.
                printf "%s\n" $tokens[1]

                switch $last_token
                  # At this point, both required and optional arguments
                  # look the same to the parser, so we match last_token
                  # to either `:` required or `^` optional tokens. This
                  # is the result of preprocessing __getopts_argv.

                  case : \^
                    # Find options with optional argument in long-style.
                    if [ $last_token = \^ ]
                      if set -q is_long_option

                      # An optional argument in long-style here means it
                      # didn't split by = in previous checks, so we can
                      # handle it as a missing argument option and exit.

                        # Print any non-empty list character.
                        printf "\n"
                        __getopts_increase_index
                        return $__CONTINUE
                      end
                    end

                    # If we reach this, we are either handling a required
                    # option or an optional in short-style form. Both are
                    # seen by the parser the same after preprocessing.

                    # For example:
                    #   Given the option string `a b:^`, -abX → -a -b X

                    # We need to peek at the next option
                    __getopts_increase_index

                    # Check if next argument exists.
                    if set -q argv[$__getopts_index]
                      # Sanitize the option-argument.
                      set -l value (printf $argv[$__getopts_index])
                      if [ -z "$value" ]
                        # Print any non-empty list character.
                        printf "\n"
                      else
                        printf $value
                      end
                      __getopts_increase_index
                      return $__CONTINUE
                    else
                      __getopts_cleanup
                      return $__OPTION_ARGUMENT_EXPECTED
                    end

                   # Option was a flag that takes no arguments.
                  case \*
                    __getopts_increase_index
                    return $__CONTINUE
                end
            end
          end
        end

        # No match found. Print unknown option to stdout first, and
        # if strict mode is enabled, abort, else continue.
        printf $option
        __getopts_increase_index

        # If the first character of the option string is a `:`, this
        # enables strict mode and any unknown options will cause the
        # process to return > 0.

        if set -q __getopts_strict_mode
          __getopts_cleanup
          return $__UNKNOWN_OPTION_FOUND
        else
          return $__CONTINUE
        end

      # Looks like we run out of options. Print operands return.
      case \*
        if [ $__getopts_index -gt 1 ]

          # Sans the current index, get rid of everything up to here.
          set -e argv[1..(math $__getopts_index-1)]
        end
        printf "%s\n" $argv

        __getopts_cleanup
        return $__END_OF_OPTIONS
    end
  else
    # End of arguments, cleanup and exit.
    __getopts_cleanup
    return $__END_OF_OPTIONS
  end
end
