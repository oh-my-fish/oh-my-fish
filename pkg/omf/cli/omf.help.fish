function omf.help -a command
  switch $command
    case "c" "cd"
      echo \n"\
      Change directory to root or plugin/theme directory.

      "(omf::dim)"Usage:"(omf::off)"
        omf cd                                Change to Oh My Fish root folder
        omf cd "(omf::em)"<package name>"(omf::off)" | "(omf::em)"<theme name>"(omf::off)"  Change to plugin or theme directory by name

      "(omf::dim)"Examples:"(omf::off)"
        omf cd
        omf cd brew
        omf cd l
      "

    case "d" "describe"
      echo \n"\
      Get information about what packages do.

      "(omf::dim)"Usage:"(omf::off)"
        omf describe                 Get information from all available packages
        omf describe "(omf::em)"<name>"(omf::off)"  Get information from package by name

      "(omf::dim)"Examples:"(omf::off)"
        omf describe
        omf describe brew
      "

    case "destroy"
      echo \n"\
      Uninstall Oh My Fish.

      "(omf::dim)"Usage:"(omf::off)"
        omf destroy
      "

    case "doctor"
      echo \n"\
      Troubleshoot Oh My Fish.

      "(omf::dim)"Usage:"(omf::off)"
        omf doctor
      "

    case "i" "install" "get"
      echo \n"\
      Install packages.

      "(omf::dim)"Usage:"(omf::off)"
        omf install                 Install missing packages from bundle
        omf install "(omf::em)"<name>"(omf::off)" | "(omf::em)"<url>"(omf::off)"  Install package by name or URL

      "(omf::dim)"Examples:"(omf::off)"
        omf install
        omf install brew
        omf install https://github.com/oh-my-fish/plugin-brew
      "

    case "l" "ls" "list"
      echo \n"\
      List local packages.

      "(omf::dim)"Usage:"(omf::off)"
        omf list
      "

    case "n" "new"
      echo \n"\
      Create a new package from a template.

      "(omf::dim)"Usage:"(omf::off)"
        omf new ("(omf::dim)"pkg"(omf::off)" | "(omf::dim)"theme"(omf::off)") "(omf::em)"<name>"(omf::off)"  Create a new package from a template

      "(omf::dim)"Examples:"(omf::off)"
        omf new pkg mypkg
        omf new theme mytheme
      "

    case "r" "rm" "remove" "uninstall"
      echo \n"\
      Remove a theme or package.

      "(omf::dim)"Usage:"(omf::off)"
        omf remove "(omf::em)"<package name>"(omf::off)" | "(omf::em)"<theme name>"(omf::off)"  Removes a theme or package by name

      "(omf::dim)"Examples:"(omf::off)"
        omf remove brew
        omf remove l
      "

    case "s" "submit"
      echo \n"\
      Submit a package to the registry.

      "(omf::dim)"Usage:"(omf::off)"
        omf submit ("(omf::dim)"pkg"(omf::off)" | "(omf::dim)"theme"(omf::off)") "(omf::em)"<url>"(omf::off)"  Submit a package or theme to the registry

      "(omf::dim)"Examples:"(omf::off)"
        omf submit pkg https://github.com/oh-my-fish/plugin-mypkg
        omf submit theme https://github.com/oh-my-fish/plugin-mythemes
      "

    case "t" "theme"
      echo \n"\
      Install and list themes.

      "(omf::dim)"Usage:"(omf::off)"
        omf theme         List available themes to install
        omf theme "(omf::em)"<name>"(omf::off)"  Install theme by name

      "(omf::dim)"Examples:"(omf::off)"
        omf theme
        omf theme l
      "

    case "u" "update"
      echo \n"\
      Update Oh My Fish.

      "(omf::dim)"Usage:"(omf::off)"
        omf update
      "

    case "*"
      echo \n"\
      \$ omf [command] [arguments]

      "(omf::dim)"Usage:"(omf::off)"
        omf "(omf::em)"install"(omf::off)" [<name>|<url>]
        omf "(omf::em)"theme"(omf::off)" [<name>]
        omf "(omf::em)"remove"(omf::off)" [<name>]
        omf "(omf::em)"update"(omf::off)"
        omf "(omf::em)"help"(omf::off)" [<command>]

      "(omf::dim)"Commands:"(omf::off)"
        "(omf::em)"l"(omf::off)"ist      List local packages.
        "(omf::em)"d"(omf::off)"escribe  Get information about what packages do.
        "(omf::em)"i"(omf::off)"nstall   Install one or more packages.
        "(omf::em)"t"(omf::off)"heme     List / Use themes.
        "(omf::em)"r"(omf::off)"emove    Remove a theme or package.
        "(omf::em)"u"(omf::off)"pdate    Update Oh My Fish.
        "(omf::em)"c"(omf::off)"d        Change directory to plugin/theme directory.
        "(omf::em)"n"(omf::off)"ew       Create a new package from a template.
        "(omf::em)"s"(omf::off)"ubmit    Submit a package to the registry.
        "(omf::em)"destroy"(omf::off)"   Uninstall Oh My Fish.
        "(omf::em)"doctor"(omf::off)"    Troubleshoot Oh My Fish.
        "(omf::em)"help"(omf::off)"      Shows help about a specific action.

      "(omf::dim)"Options:"(omf::off)"
        "(omf::em)"--h"(omf::off)"elp     Display this help.
        "(omf::em)"--v"(omf::off)"ersion  Display version."

      echo \n"\
      For more information visit → "(omf::em)"git.io/oh-my-fish"(omf::off)\n
  end
end
