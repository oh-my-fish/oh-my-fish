# SYNOPSIS
#   Oh My Fish! CLI
#
# ENV
#   OMF_CONFIG    Oh My Fish! configuration
#
# OVERVIEW
#   Provides options to list, download and remove packages, update
#   the framework, create / submit a new package, etc.

set -g OMF_MISSING_ARG   1
set -g OMF_UNKNOWN_OPT   2
set -g OMF_INVALID_ARG   3
set -g OMF_UNKNOWN_ERR   4

function omf::em
  set_color $fish_color_match ^/dev/null; or set_color cyan
end

function omf::dim
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
end

function omf::under
  set_color --underline
end

function omf::err
  set_color $fish_color_error ^/dev/null; or set_color red --bold
end

function omf::off
  set_color normal
end

function omf -d "Oh My Fish"
  if test (count $argv) -eq 0
    omf.help "main"; and return 0
  else
    if test "--help" = "$argv[-1]" -a (count $argv) = 2
      omf.help $argv[1..-2]; and return 0
    end
  end

  switch $argv[1]
    case "-v*" "--v*"
      omf.version

    case "doctor"
      omf.doctor

    case "-h*" "--h*" "help"
      if test (count $argv) -eq 1
        omf.help "main"
      else
        omf.help $argv[2]
      end

    case "c" "cd"
      switch (count $argv)
        case 1
          omf.packages.cd
        case 2
          omf.packages.cd $argv[2]
        case "*"
          echo (omf::err)"Invalid number of arguments"(omf::off) 1^&2
          echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" <name>" 1^&2
          return $OMF_INVALID_ARG
      end

    case "d" "describe"
      if test (count $argv) -eq 1
        omf.describe
      else
        omf.describe $argv[2..-1]
      end

    case "destroy"
      omf.destroy

    case "i" "install" "get"
      if test (count $argv) -eq 1
        omf.bundle.install;
          and set installed
      else
        for package in $argv[2..-1]
          omf.install $package;
            and set installed
        end
      end

      set -q installed; and refresh
      return 0

    case "l" "ls" "list"
      omf.packages.list --installed | column

    case "n" "new"
      if test (count $argv) -ne 3
        echo (omf::err)"Package type or name missing"(omf::off) 1^&2
        echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" "(omf::em)"pkg|theme"(omf::off)" <name>" 1^&2
        return $OMF_MISSING_ARG
      end
      omf.new $argv[2..-1]

    case "r" "rm" "remove" "uninstall"
      if test (count $argv) -ne 2
        echo (omf::err)"Invalid number of arguments"(omf::off) 1^&2
        echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" <[package|theme] name>" 1^&2
        return $OMF_INVALID_ARG
      end
      omf.remove_package $argv[2] ; and refresh

    case "s" "submit"
      switch (count $argv)
        case 3
          omf.submit $argv[2] $argv[3]
        case "*"
          echo (omf::err)"Argument missing"(omf::off) 1^&2
          echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" "(omf::em)"pkg|themes"(omf::off)"/<name> <url>" 1^&2
          return $OMF_MISSING_ARG
      end

    case "t" "theme"
      if test (count $argv) -eq 1
        set -l theme (cat $OMF_CONFIG/theme)
        set -l highlight_current "(^|[[:space:]])($theme)([[:space:]]|\$)"

        echo (omf::under)"Installed:"(omf::off)
        omf.packages.list --installed --theme | column | sed -E s/"$highlight_current"/"\1"(omf::em)"\2"(omf::off)"\3"/g
        echo
        echo (omf::under)"Available:"(omf::off)
        omf.packages.list --available --theme | column
      else if test (count $argv) -eq 2
        omf.theme $argv[2]
      else
        echo (omf::err)"Invalid number of arguments"(omf::off) 1^&2
        echo "Usage: $_ "(omf::em)"$argv[1]"(omf::off)" [<theme name>]" 1^&2
        return $OMF_INVALID_ARG
      end

    case "u" "update"
      echo (omf::em)"Updating Oh My Fish..."(omf::off)
      if omf.repo.pull $OMF_PATH
        echo (omf::em)"Oh My Fish is up to date."(omf::off)
      else
        echo (omf::err)"Oh My Fish failed to update."(omf::off)
        echo "Please open a new issue here → "(omf::em)"github.com/oh-my-fish/oh-my-fish/issues"(omf::off)
      end

      for package in (omf.packages.list --installed)
        omf.update $package
      end

      refresh
    case "*"
      echo (omf::err)"$argv[1] option not recognized"(omf::off) 1^&2
      return $OMF_UNKNOWN_OPT
  end
end
