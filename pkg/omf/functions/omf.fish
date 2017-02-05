# SYNOPSIS
#   Oh My Fish! CLI
#
# OVERVIEW
#   Provides options to list, download and remove packages, update
#   the framework, create / submit a new package, etc.

function omf -d "Oh My Fish"

  if test "x$argv[-1]" = "x--help" -a (count $argv) = 2
    set command help
    set arguments $argv[1]
  else if test (count $argv) -ge 2
    set command $argv[1]
    set arguments $argv[2..-1]
  else if test (count $argv) = 1
    set command $argv[1]
    set arguments
  else
    set command help
    set arguments
  end

  switch "$command"
    case "-v*" "--v*"
      omf.cli.version

    case "-h*" "--h*" "help"
      omf.cli.help $arguments

    case "c" "cd"
      omf.cli.cd $arguments

    case "d" "describe"
      omf.cli.describe $arguments

    case "destroy"
      omf.cli.destroy

    case "doctor"
      omf.cli.doctor

    case "reload"
      omf.cli.reload $arguments

    case "i" "install" "get"
      omf.cli.install $arguments

    case "l" "ls" "list"
      omf.cli.list $arguments

    case "n" "new"
      omf.cli.new $arguments

    case "r" "rm" "remove" "uninstall"
      omf.cli.remove $arguments

    case "t" "theme"
      omf.cli.theme $arguments

    case "u" "update"
      omf.cli.update $arguments

    case "repo" "repositories"
      omf.index.repositories $arguments

    case "channel"
      omf.cli.channel $arguments

    case "s" "search"
      omf.cli.search $arguments

    case "version"
      omf.cli.version $arguments

    case "*"
      echo (omf::err)"$argv[1] option not recognized"(omf::off) >&2
      return $OMF_UNKNOWN_OPT
  end
end
