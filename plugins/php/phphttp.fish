# PHP HTTP server.
function phphttp
  set -l port 8000
  set -l path
  set -l host 127.0.0.1

  # Ignore argument for slice.
  set argv $argv ignore

  # Process options. I think that fish should have some builtin for
  # option parsing, but it doesn't.
  while count $argv > /dev/null
    set -l option $argv[1]

    switch $option
    # When two hyphens appear, stop processing, while removing
    # hyphens from $argv.
    case --
      set argv $argv[2..-1]
      break

    # Public mode.
    case -p\* --p --pu --pub --publ --publi --public p public
      if test $host = 0
        echo phphttp: Duplicate option --public >&2
      end
      set host 0

    # Help.
    case -h\* --h --he --hel --help '-\?' h help
      echo 'phphttp [--public] <port=8000> <path=.>'
      return

    # Anything else stops processing.
    case \*
      break
    end

    # Check if the option was one letter.
    switch $option
    case --\*
      # Doesn't count as single option

    case -\?\?\*
      set argv[1] -(expr substr $argv[1] 3 length $argv[1])
      continue
    end

    set argv $argv[2..-1]
  end

  if test (count $argv[1..-1]) -ge 4
    echo 'phphttp: Expected up to two arguments, got '(math (count $argv) - 1)'.' >&2
    return
  end

  # argv is bigger by 1 because of "ignore" argument.
  if test (count $argv) -ge 2
    # Check legality of first argument
    switch $argv[1]
    # Fine values
    case {0,1,2,3,4,5,6,7,8,9}\*
      # Do nothing

    case \*
      # The dev team thinks of everything. Or something.
      if test -d $argv[1]
        if test (count $argv) -eq 2
          echo "phphttp: directory specified without port."  >&2
        else
          echo "phphttp: swapped directory and port arguments." >&2
        end
        return
      else
        echo "phphttp: $argv[1] is not a port."  >&2
        return
      end
    end

    set port $argv[1]
  end
  if test (count $argv) -eq 3
    set path -t$argv[2]
  end

  php -S$host:$port $path
end
