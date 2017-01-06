function omf.cli.help -a command
  switch "$command"
    case "c" "cd"
      echo "\
Change directory to root or plugin/theme directory.

"(omf::dim)"Usage:"(omf::off)"
  omf cd                                Change to Oh My Fish root folder
  omf cd "(omf::em)"<package name>"(omf::off)" | "(omf::em)"<theme name>"(omf::off)"  Change to plugin or theme directory by name

"(omf::dim)"Examples:"(omf::off)"
  omf cd
  omf cd brew
  omf cd l
"

    case "channel"
      echo \n"\
Gets or changes the update channel.

Two channels are available by default: the "(omf::em)"stable"(omf::off)" channel provides stable
updates with the latest tagged version of Oh My Fish, and "(omf::em)"dev"(omf::off)" which provides
the latest changes under development. The update channel currently set
determines what version "(omf::em)"omf update"(omf::off)" will upgrade to.

"(omf::dim)"Usage:"(omf::off)"
  omf channel         Print the currently selected update channel
  omf channel "(omf::em)"<name>"(omf::off)"  Switch to the given update channel

"(omf::dim)"Examples:"(omf::off)"
  omf channel
  omf channel stable
  omf channel dev
"

    case "d" "describe"
      echo "\
Get information about what packages do.

"(omf::dim)"Usage:"(omf::off)"
  omf describe "(omf::em)"<name>"(omf::off)"  Show information about a package

"(omf::dim)"Examples:"(omf::off)"
  omf describe brew
"

    case "destroy"
      echo "\
Uninstall Oh My Fish.

"(omf::dim)"Usage:"(omf::off)"
  omf destroy
"

    case "doctor"
      echo "\
Troubleshoot Oh My Fish.

"(omf::dim)"Usage:"(omf::off)"
  omf doctor
"

    case "i" "install" "get"
      echo "\
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
      echo "\
List local packages.

"(omf::dim)"Usage:"(omf::off)"
  omf list [ --available | -a ]
  omf list [ --installed | -i ]
  omf list [ --database  | -d ]
"

    case "n" "new"
      echo "\
Create a new package from a template.

"(omf::dim)"Usage:"(omf::off)"
  omf new ("(omf::dim)"pkg"(omf::off)" | "(omf::dim)"theme"(omf::off)") "(omf::em)"<name>"(omf::off)"  Create a new package from a template

"(omf::dim)"Examples:"(omf::off)"
  omf new pkg mypkg
  omf new theme mytheme
"

    case "repo" "repositories"
      echo "\
Manage package repositories.

"(omf::dim)"Usage:"(omf::off)"
  omf repositories [list]                      List installed repositories
  omf repositories add "(omf::em)"<url>"(omf::off)" ["(omf::em)"<branch>"(omf::off)"]        Add a package repository
  omf repositories rm|remove "(omf::em)"<url>"(omf::off)" ["(omf::em)"<branch>"(omf::off)"]  Remove a package repository

"(omf::dim)"Examples:"(omf::off)"
  omf repositories
  omf repositories add https://github.com/vendor/fish-packages
  omf repositories rm https://github.com/vendor/fish-packages master
"

    case "r" "rm" "remove" "uninstall"
      echo "\
Remove a theme or package.

"(omf::dim)"Usage:"(omf::off)"
  omf remove "(omf::em)"<package name>"(omf::off)" | "(omf::em)"<theme name>"(omf::off)"  Removes a theme or package by name

"(omf::dim)"Examples:"(omf::off)"
  omf remove brew
  omf remove l
"

    case "search"
      echo "\
Search for a package or theme.

"(omf::dim)"Usage:"(omf::off)"
  omf search ("(omf::dim)"-pkg/--package"(omf::off)" | "(omf::dim)"-t/--theme"(omf::off)") "(omf::em)"<name>"(omf::off)"  Search for a package or theme

"(omf::dim)"Examples:"(omf::off)"
  omf search -pkg nvm
  omf search -t bobthefish
  omf search vi
"

    case "t" "theme"
      echo "\
Install and list themes.

"(omf::dim)"Usage:"(omf::off)"
  omf theme         List available themes to install
  omf theme "(omf::em)"<name>"(omf::off)"  Install theme by name

"(omf::dim)"Examples:"(omf::off)"
  omf theme
  omf theme l
"

    case "u" "update"
      echo "\
Update Oh My Fish.

"(omf::dim)"Usage:"(omf::off)"
  omf update
"

    case "*"
      echo "\
\$ omf [command] [arguments]

"(omf::dim)"Usage:"(omf::off)"
  omf "(omf::em)"install"(omf::off)" [<name>|<url>]
  omf "(omf::em)"theme"(omf::off)" [<name>]
  omf "(omf::em)"remove"(omf::off)" [<name>]
  omf "(omf::em)"search"(omf::off)" [<name>]
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
  "(omf::em)"s"(omf::off)"earch    Search for a package or theme.
  "(omf::em)"destroy"(omf::off)"   Uninstall Oh My Fish.
  "(omf::em)"doctor"(omf::off)"    Troubleshoot Oh My Fish.
  "(omf::em)"help"(omf::off)"      Shows help about a specific action.

"(omf::dim)"Options:"(omf::off)"
  "(omf::em)"--h"(omf::off)"elp     Display this help.
  "(omf::em)"--v"(omf::off)"ersion  Display version.

For more information visit → "(omf::em)"git.io/oh-my-fish"(omf::off)\n
  end
end
