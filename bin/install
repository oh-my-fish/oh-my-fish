#!/usr/bin/env fish
# Oh My Fish installer. See `install --help` for usage.

# Set environment options.
set -q OMF_REPO_URI;    or set OMF_REPO_URI "https://github.com/oh-my-fish/oh-my-fish"
set -q OMF_REPO_BRANCH; or set OMF_REPO_BRANCH "master"


function main
  # Set default settings
  set -q XDG_DATA_HOME
    and set -g OMF_PATH_DEFAULT "$XDG_DATA_HOME/omf"
    or set -g OMF_PATH_DEFAULT "$HOME/.local/share/omf"

  set -q XDG_CONFIG_HOME
    and set -g CONFIG_PATH "$XDG_CONFIG_HOME"
    or set -g CONFIG_PATH "$HOME/.config"

  set -g OMF_CONFIG_DEFAULT "$CONFIG_PATH/omf"
  set -g FISH_CONFIG "$CONFIG_PATH/fish"

  set -g OMF_PATH "$OMF_PATH_DEFAULT"
  set -g OMF_CONFIG "$OMF_CONFIG_DEFAULT"
  set -g OMF_CHANNEL stable

  # Ensure repository URL ends with .git
  set OMF_REPO_URI (echo $OMF_REPO_URI | command sed 's/\.git//').git

  # Parse command args
  while set -q argv[1]
    switch "$argv[1]"
      case --help -h
        echo "Usage: install [options]
  Install Oh My Fish

Options:
  --channel=<channel>     Download a specific release channel, either \"stable\" or \"dev\" (default is \"$OMF_CHANNEL\").
  --check                 Do a system readiness check without installing.
  --config=<path>         Put config in a specific path (default is $OMF_CONFIG_DEFAULT).
  --help, -h              Show this help message.
  --noninteractive        Disable interactive questions (assume no, use with --yes to assume yes).
  --offline[=<path>]      Offline install, optionally specifying a tar or directory to use.
  --path=<path>           Use a specific install path (default is $OMF_PATH_DEFAULT).
  --uninstall             Uninstall existing installation instead of installing.
  --verbose               Enable verbose debugging statements for the installer.
  --yes, -y               Assume yes for interactive questions.
"
        return 0

      case '--channel=stable'
        set -g OMF_CHANNEL stable

      case '--channel=dev'
        set -g OMF_CHANNEL dev

      case '--channel=*'
        abort "Unknown release channel \""(echo "$argv[1]" | command cut -d= -f2)"\"."

      case --check
        set -g CHECK_ONLY

      case '--config=*'
        echo "$argv[1]" | command cut -d= -f2 | command sed -e "s#~#$HOME#" | read -g OMF_CONFIG

      case --noninteractive
        set -g NONINTERACTIVE

      case --offline
        set -g OFFLINE

      case '--offline=*'
        set -g OFFLINE
        echo "$argv[1]" | command cut -d= -f2 | command sed -e "s#~#$HOME#" | read -g OFFLINE_PATH

      case '--path=*'
        echo "$argv[1]" | command cut -d= -f2 | command sed -e "s#~#$HOME#" | read -g OMF_PATH

      case --uninstall
        set -g UNINSTALL

      case --verbose
        set -g VERBOSE
        debug "verbose turned on"

      case --yes -y
        set -g ASSUME_YES

      case '*'
        abort "Unrecognized option '$argv[1]'. Try 'install --help' for usage."
    end
    set -e argv[1]
  end

  # Do the check only.
  if set -q CHECK_ONLY
    sane_environment_check
    return
  end

  assert_interactive

  # Ensure the environment meets all of the requirements.
  if not sane_environment_check
    abort "Environment does not meet the requirements."
  end

  # If the user wants to uninstall, jump to uninstallation and exit.
  if set -q UNINSTALL
    uninstall_omf
    return
  end

  # Check if OMF is already installed.
  if test -d "$OMF_PATH"
    if is_install_dir "$OMF_PATH"
      say "Existing installation detected at $OMF_PATH"

      confirm_yes "Would you like to remove the existing installation?"
      uninstall_omf
    else
      abort "Target directory $OMF_PATH already exists"
    end
  end

  # Begin the install process.
  install_omf

  # We made it!
  say "Installation successful!"

  # Open a brand new shell if we are in interactive mode.
  set -q NONINTERACTIVE
    or exec fish < /dev/tty

  return 0
end


# Add an exit hook to display a message if the installer aborts or errors.
function on_exit -p %self
  if not contains $argv[3] 0 2
    echo "
Oh My Fish installation failed.

If you think that it's a bug, please open an
issue with the complete installation log here:

http://github.com/oh-my-fish/oh-my-fish/issues"

    if not set -q VERBOSE
      echo
      echo "Try rerunning with --verbose to see additional output."
    end
  end
end


# Installs Oh My Fish.
function install_omf
  say "Installing Oh My Fish to $OMF_PATH..."

  # Prepare paths
  command mkdir -p (dirname "$OMF_PATH")

  # Install step
  if set -q OFFLINE
    install_offline
  else
    install_from_github
  end

  # Config step
  install_bootstrap
  install_config
end


# Downloads and installs the framework from GitHub.
function install_from_github
  say "Using release channel \"$OMF_CHANNEL\"."
  say "Cloning $OMF_REPO_BRANCH from $OMF_REPO_URI..."

  if not command git clone -q -b "$OMF_REPO_BRANCH" "$OMF_REPO_URI" "$OMF_PATH"
    abort "Error cloning repository!"
  end

  if test $OMF_CHANNEL = stable
    # Get the commit for the latest release.
    set -l hash (command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" rev-list --tags='v*' --max-count=1 2> /dev/null)
      # Get the release tag.
      and set -l tag (command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" describe --tags $hash)
      # Checkout the release.
      and command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" checkout --quiet tags/$tag
      or report error "Error getting latest version!"
  end

  set_git_remotes
end


# Install the framework from an offline copy of the source.
function install_offline
  # Prepare the path
  if set -q OFFLINE_PATH
    # Make sure the given path exists
    if not test -e "$OFFLINE_PATH"
      abort "Local installation does not exist"
    end
  else
    # If no path was set, check if the installer is running inside of the source directory.
    set -l path (command dirname (command dirname (builtin status -f)))

    if is_install_dir "$path"
      set OFFLINE_PATH "$path"
    # Try using the current working directory as the source.
    else if is_install_dir "$PWD"
      set OFFLINE_PATH "$PWD"
    else
      # We tried our best.
      abort "Could not find local installation source"
    end
  end

  # Check if the path is some sort of tar.
  if test -f "$OFFLINE_PATH"
    say "Offline path is a file, assuming tar archive..."

    command tar -xf "$OFFLINE_PATH" -C "$OMF_PATH"
      or abort "Could not extract tar file $OFFLINE_PATH"

    return
  end

  # At this point, path must be a directory.
  if not test -d "$OFFLINE_PATH"
    abort "$OFFLINE_PATH is not a directory"
  end

  # Make sure the given path is actually the OMF source.
  if not is_install_dir "$OFFLINE_PATH"
    abort "$OFFLINE_PATH is not a valid local installation source"
  end

  # Copy the source into the install location.
  command cp -r "$OFFLINE_PATH" "$OMF_PATH"
    or abort "Failed to copy source!"

  # Set up Git remotes only if the offline install is a Git repository.
  test -d "$OMF_PATH/.git"
    and set_git_remotes

  return 0
end


# Set upstream remotes on the framework Git repository.
function set_git_remotes
  set git_upstream (command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" config remote.upstream.url)

  if test -z "$git_upstream"
    command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" remote add upstream $OMF_REPO_URI
  else
    command git --git-dir "$OMF_PATH/.git" --work-tree "$OMF_PATH" remote set-url upstream $OMF_REPO_URI
  end
end


# Sets up the necessary bootstrap code for Fish to load OMF.
function install_bootstrap
  set -l fish_config_file "$FISH_CONFIG/config.fish"
  set -l vendor_config_file "$FISH_CONFIG/conf.d/omf.fish"

  # Create the Fish config directory if it doesn't exist yet (if the first thing the user runs with Fish is this
  # installer, for example).
  command mkdir -p "$FISH_CONFIG"

  # If Oh My Fish is already configured and ready to go, there's nothing else we need to do here.
  if is_omf_loaded
    return 0

  # Fish 2.3.0+ supports conf.d which is for vendors to manage, so we can just plop an init file under our control.
  else if is_version_compatible 2.3.0 (get_fish_version)
    say "Writing bootstrap to $vendor_config_file..."
    command mkdir -p "$FISH_CONFIG/conf.d"
    generate_bootstrap > "$vendor_config_file"

  # If the user doesn't have their own config file, we'll just use that as our bootstrap.
  else if not test -e "$fish_config_file"
    say "Writing bootstrap to $fish_config_file..."
    generate_bootstrap > "$fish_config_file"

  # Even though config.fish already exists, we can prepend to it if the user is OK with it.
  else if confirm "Would you like Oh My Fish to be added to your configuration automatically?"
    say "Prepending bootstrap to $fish_config_file..."

    # Create a temporary file to store the combined config so that we can write atomically.
    generate_bootstrap | command cat - "$fish_config_file" > "$fish_config_file.tmp"
      or abort "Error prepending config file"

    # Swap in the prepended file.
    command mv "$fish_config_file.tmp" "$fish_config_file"
      or abort "Error moving file to $fish_config_file"

  # We don't have any options left, so let the user set up the bootstrap manually.
  else
    say "For Oh My Fish to work properly, please paste the code below into a file that Fish can run at startup:"
    echo
    generate_bootstrap
  end

  # Backup the user's theme settings. This can be removed when OMF no longer touches this file to switch themes.
  backup_file "$FISH_CONFIG/functions/fish_prompt.fish"
end


# Sets up the configuration directory.
function install_config
  say "Setting up Oh My Fish configuration..."

  # Set up the Oh My Fish configuration directory.
  if not test -d "$OMF_CONFIG"
    command mkdir -p "$OMF_CONFIG"
  end

  test -f "$OMF_CONFIG/bundle";
    or echo "theme default" > "$OMF_CONFIG/bundle"
  test -f "$OMF_CONFIG/channel";
    or echo $OMF_CHANNEL > "$OMF_CONFIG/channel"
  test -f "$OMF_CONFIG/theme"
    or echo "default" > "$OMF_CONFIG/theme"

  # Install plugins
  fish -c "omf install"
    or abort "Error installing plugins"
end


# Generates the bootstrap code used to initialize Oh My Fish on shell startup.
function generate_bootstrap
  echo "# Path to Oh My Fish install."

  if test "$OMF_PATH" = "$OMF_PATH_DEFAULT"
    echo "\
set -q XDG_DATA_HOME
  and set -gx OMF_PATH \"\$XDG_DATA_HOME/omf\"
  or set -gx OMF_PATH \"\$HOME/.local/share/omf\""
  else
    echo "set -gx OMF_PATH '$OMF_PATH'"
  end

  if test "$OMF_CONFIG" != "$OMF_CONFIG_DEFAULT"
    echo "
# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG '$OMF_CONFIG'"
  end

  echo "
# Load Oh My Fish configuration.
source \$OMF_PATH/init.fish"
end


# Uninstalls an existing OMF installation.
function uninstall_omf
  is_install_dir "$OMF_PATH"
    or abort "No installation detected at $OMF_PATH"

  say (set_color -o red 2> /dev/null)"This will uninstall Oh My Fish and all plugins and themes from $OMF_PATH."(set_color normal 2> /dev/null)

  # If we installed the bootstrap to the user's config, let them know they need to remove it themselves.
  if begin; test -f "$FISH_CONFIG/config.fish"; and grep -q OMF_PATH "$FISH_CONFIG/config.fish"; end
    say (set_color -o 2> /dev/null)"Your configuration will not be modified. You may need to remove Oh My Fish startup code from $FISH_CONFIG/config.fish."(set_color normal 2> /dev/null)
  end

  confirm_yes "Are you sure you want to continue?"
  say "Uninstalling from $OMF_PATH..."

  # Trigger package uninstall events
  for path in $OMF_PATH/pkg/*
    set -l package (command basename "$path")

    test -f "$path/hooks/uninstall.fish"
      and source "$path/hooks/uninstall.fish"

    test -f "$path/uninstall.fish"
      and source "$path/uninstall.fish"

    emit uninstall_$package
  end

  # Remove the core framework
  command rm -rf "$OMF_PATH"
    or abort "Uninstall failed"

  # Remove the bootstrap if it is managed by us
  set -l vendor_config_file "$FISH_CONFIG/conf.d/omf.fish"
  if test -e "$vendor_config_file"
    command rm "$vendor_config_file"
      or abort "Failed to remove bootstrap file"
  end

  # Restore backed-up files
  restore_backup_file "$FISH_CONFIG/functions/fish_prompt.fish"

  say "Uninstall complete"
end


# Makes a backup of a given file.
function backup_file -a file_path
  test -e "$file_path"; or return 1

  set -l path (command dirname $file_path)
  set -l file (command basename $file_path)
  set -l name (echo $file | command cut -d. -f1)

  set -l timestamp (command date +%s)
  set -l backup_file "$path/$name.$timestamp.copy"

  say "Existent $file found at $path"
  say "↳ Moving to $backup_file"

  if not command cp "$file_path" $backup_file 2> /dev/null
    abort "Could not backup $file_path"
  end

  return 0
end


# Restores a backed-up file to its original location.
function restore_backup_file -a file_path
  set -l path (command dirname $file_path)
  set -l file (command basename $file_path)
  set -l name (echo $file | cut -d. -f1)
  set -l backup_file_list $path/$name.*.copy
  set -l backup_file_path (echo $backup_file_list | command tr ' ' '\n' | command sort -r | command head -1)

  if test -e "$backup_file_path"
    say "Found a backup of $file at $backup_file_path"

    if confirm "Would you like to restore it (overwrite existing)?"
      say "Restoring backup file to $path/$file"
      command mv "$backup_file_path" "$path/$file" 2> /dev/null
        or abort "Could not restore backup $backup_file_path"
    end
  end
end


# Verify we have a sane environment that OMF can run in.
function sane_environment_check
  say "Checking for a sane environment..."
  assert_cmds

  debug "Checking for a sane 'head' implementation"
  set -l result (printf 'a\nb\n' | cmd head -n 1)
    and test "$result" = 'a'
    or abort (which head)" is not a sane 'head' implementation"

  debug "Checking for a sane 'sort' implementation"
  set -l result (printf '1.2.3\n2.2.4\n1.2.4\n' | cmd sort -r -n -t '.' -k 1,1 -k 2,2 -k 3,3 -k 4,4)
    and set -q result[3]
    and test "$result[1]" = 2.2.4
    and test "$result[2]" = 1.2.4
    and test "$result[3]" = 1.2.3
    or abort (which sort)" is not a sane 'sort' implementation"

  debug "Checking for a working AWK interpreter"
  cmd awk 'BEGIN{exit 42;}' < /dev/null 2> /dev/null
  if not test $status -eq 42
    abort (which awk)" does not look like an AWK interpreter."
  end

  assert_fish_version_compatible 2.2.0
  assert_git_version_compatible 1.9.5

  debug "Verifying Git implementation is not buggy Git for Windows"
  if cmd git --version | cmd grep -i -q windows
    abort (which git)" is Git for Windows which is not supported."
  end

  debug "Verifying Git autocrlf is not enabled"
  if test (cmd git config core.autocrlf; or echo false) = true
    abort "Please disable core.autocrlf in your Git configuration."
  end
end


# Gets the version of Fish installed.
function get_fish_version
  if set -q FISH_VERSION
    echo $FISH_VERSION
  else if set -q version
    echo $version
  else
    return 1
  end
end


# Gets the version of Git installed.
function get_git_version
  type -f git > /dev/null 2> /dev/null
    and command git --version | command cut -d' ' -f3
end


# Checks if a path looks like an OMF install.
function is_install_dir -a path
  test -n "$path"
    and test -d "$path"
    and test -d "$path/pkg/omf"
end


# Checks if OMF is set up properly and working.
function is_omf_loaded
  command fish -c "omf --version" > /dev/null 2>&1
end


# Tests if the right-hand side version is equal to or greater than the left-hand side version.
function is_version_compatible -a lhs rhs
  # Both arguments must be given.
  set -q argv[2]
    or return 1

  # Right-hand side must be the largest version.
  test "$rhs" = (get_latest_version "$lhs" "$rhs")
end


# Returns the newest version from a given list of versions.
function get_latest_version
  # Sort the version in descending order and output the top result.
  for v in $argv
    echo "$v"
  end | command sort -r -n -t '.' -k 1,1 -k 2,2 -k 3,3 -k 4,4 | command head -n 1
end


# Assert that a minimum required version of Fish is installed.
function assert_fish_version_compatible -a required_version
  set -l installed_version (get_fish_version)
    and is_version_compatible $required_version $installed_version
    or abort "Fish version $required_version or greater required; you have $installed_version"
end


# Assert that a minimum required version of Git is installed.
function assert_git_version_compatible -a required_version
  set -l installed_version (get_git_version)
    and is_version_compatible $required_version $installed_version
    or abort "Git version $required_version or greater required; you have $installed_version"
end


# Assert that all tools we need are available.
function assert_cmds
  set -l cmds awk basename cp cut date dirname env fish fold head mkdir mv readlink rm sed sort tar tr which

  for cmd in $cmds
    type -f $cmd > /dev/null 2> /dev/null
      or abort "Missing required command: $cmd"

    debug "Command '$cmd' is "(which $cmd)
  end
end


# Ensures the keyboard is readable if in interactive mode.
function assert_interactive
  set -q NONINTERACTIVE
    and return

  test -c /dev/tty -a -r /dev/tty
    and echo -n > /dev/tty 2> /dev/null
    or abort "Running interactively, but can't read from tty (try running with --noninteractive)"
end


# A link-following `which` wrapper.
function which
  if type realpath > /dev/null 2> /dev/null
    realpath (command which $argv)
  else
    command readlink (command which $argv)
  end
end


# Execute an external command.
function cmd
  if set -q VERBOSE
    command env $argv
  else
    command env $argv 2> /dev/null
  end
end


# Print a message to the user.
function say -a message
  printf "$message\n" | command fold -s -w 80
end


# Write a debug message.
function debug -a message
  if set -q VERBOSE
    printf 'DEBUG: %s\n' "$message" >&2
  end
end


# Aborts the installer and displays an error.
function abort -a message code
  if test -z "$code"
    set code 1
  end

  if test -n "$message"
    printf "%sInstall aborted: $message%s\n" (set_color -o red 2> /dev/null) (set_color normal 2> /dev/null) >&2
  else
    printf "%sInstall aborted%s\n" (set_color -o red 2> /dev/null) (set_color normal 2> /dev/null) >&2
  end

  exit $code
end


# Asks the user for confirmation.
function confirm -a message
  # Return true if we assume yes for all questions.
  set -q ASSUME_YES
    and return 0

  # Return false if we can't ask the question.
  set -q NONINTERACTIVE
    and return 1

  printf "%s$message (y/N): %s" (set_color yellow 2> /dev/null) (set_color normal 2> /dev/null)
  read -l answer < /dev/tty
    or abort "Failed to read from tty"

  not test "$answer" != y -a "$answer" != Y -a "$answer" != yes
end


# Asks the user for a confirmation or aborts.
function confirm_yes -a message
  confirm "$message"
    or abort "Canceled by user" 2
end


main $argv
