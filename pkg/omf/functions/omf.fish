function omf -d "Oh My Fish"
  # Parse any options before the command name.
  while set -q argv[1]
    switch $argv[1]
      case '-h' '--help' '-\?' '/\?'
        set command help

      case '-v' '--version'
        set command version

      case '-?*'
        echo (omf::err)"Unknown option: $argv[1]"(omf::off) >&2
        return $OMF_UNKNOWN_OPT

      case '*'
        break
    end

    set -e argv[1]
  end

  # Also extract a help flag from the last argument.
  switch "$argv[-1]"
    case '-h' '--help' '-\?' '/\?'
      set command help
      set -e argv[-1]
  end

  # Extract the command name from the remaining arguments.
  if not set -q command
    if set -q argv[1]
      set command $argv[1]
      set -e argv[1]
    else
      set command help
    end
  end

  # Lookup the function for the requested command.
  if not set command_name (omf.command $command)
    echo (omf::err)"Unknown command: $command"(omf::off) >&2
    return $OMF_UNKNOWN_OPT
  end

  # Execute the command.
  echo "function __omf_last_command --no-scope-shadowing
    omf.cli.$command_name \$argv
  end" | source

  __omf_last_command $argv
end
