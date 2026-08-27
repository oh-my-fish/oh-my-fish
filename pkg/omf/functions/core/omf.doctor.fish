function __omf.doctor.theme
  omf.check.fish_prompt
  set -l state $status

  switch $state
    case 0
      return 0

    case 2
      echo (omf::err)"Warning: "(omf::off)(omf::em)"fish_prompt.fish"(omf::off)" links to a different theme than the active one."
      echo "  Oh My Fish left the link behind when switching themes, so the wrong prompt is shown."

    case '*'
      echo (omf::err)"Warning: "(omf::off)(omf::em)"fish_prompt.fish"(omf::off)" is overridden."
      echo (omf::em)"  fish_config"(omf::off)" command persists the prompt to "(omf::em)"~/.config/fish/functions/fish_prompt.fish"(omf::off)
      echo "  That file takes precedence over Oh My Fish's themes."
  end

  if set -q __omf_doctor_fix
    set -l theme (cat $OMF_CONFIG/theme 2> /dev/null)
    omf.theme.link_prompt $theme
      and echo (omf::em)"  Fixed: fish_prompt.fish now follows the $theme theme."(omf::off)
  else
    echo "  Run "(omf::em)"omf doctor --fix"(omf::off)" to repair it (your own prompt file is backed up, not deleted)."
  end
  echo

  return 1
end

function __omf.doctor.bundle
  set -l installed (omf.packages.list)

  # Records in the bundle whose package is not on disk.
  set -l missing
  for record in (cat $OMF_CONFIG/bundle 2> /dev/null | sort -u)
    set -l name_or_url (echo $record | cut -s -d' ' -f2-)
    test -n "$name_or_url"; or continue
    contains -- (omf.packages.name $name_or_url) $installed
      or set missing $missing "$record"
  end

  if set -q missing[1]
    echo (omf::err)"Warning: "(omf::off)"listed in your bundle but not installed: "(omf::em)(string join ', ' $missing)(omf::off)
    if set -q __omf_doctor_fix
      omf.bundle.install
        and echo (omf::em)"  Fixed: missing packages installed."(omf::off)
        or set -l failed
    else
      echo "  Run "(omf::em)"omf doctor --fix"(omf::off)" (or "(omf::em)"omf install"(omf::off)") to install them."
    end
    echo
  end

  # Packages on disk that the bundle does not record.
  set -l unlisted
  for type in package theme
    test $type = package; and set -l flag --plugin; or set -l flag --theme
    for name in (omf.packages.list $flag)
      contains -- $name (omf.bundle.names $type)
        or set unlisted $unlisted "$type $name"
    end
  end

  if set -q unlisted[1]
    echo (omf::err)"Warning: "(omf::off)"installed but missing from your bundle: "(omf::em)(string join ', ' $unlisted)(omf::off)
    if set -q __omf_doctor_fix
      for record in $unlisted
        omf.bundle.add (string split -m1 ' ' -- $record)
      end
      echo (omf::em)"  Fixed: bundle updated."(omf::off)
    else
      echo "  Run "(omf::em)"omf doctor --fix"(omf::off)" to record them, or "(omf::em)"omf remove <name>"(omf::off)" to drop them."
    end
    echo
  end

  not set -q failed
end

function __omf.doctor.packages
  set -l broken

  for path in {$OMF_PATH,$OMF_CONFIG}/pkg/* {$OMF_PATH,$OMF_CONFIG}/themes/*
    test -d $path; or continue
    set -l name (command basename $path)
    contains -- $name omf fish-spec; and continue

    for file in (command find $path -name '*.fish' -type f 2> /dev/null)
      if not fish --no-execute $file > /dev/null 2>&1
        set broken $broken $name
        echo (omf::err)"Warning: "(omf::off)"package "(omf::em)$name(omf::off)" has a syntax error in "(omf::em)$file(omf::off)
        fish --no-execute $file 2>&1 | sed 's/^/  /' | head -n 4
        echo "  Remove it with "(omf::em)"omf remove $name"(omf::off)" or update it with "(omf::em)"omf update $name"(omf::off)
        echo
        break
      end
    end
  end

  not set -q broken[1]
end

function __omf.doctor.fish_version
  set -l min_version 3.0.0
  set -l current_version
  begin
    echo $FISH_VERSION | read -la --delimiter - version_parts
    set current_version "$version_parts[1]"
  end

  if not omf.check.version $min_version $current_version
    echo (omf::err)"Warning: "(omf::off)"Oh-My-Fish requires "(omf::em)"fish"(omf::off)" version "(omf::em)"$min_version"(omf::off)" or above"
    echo "Your fish version is "(omf::em)$FISH_VERSION(omf::off)
    echo
    return 1
  end
end

function __omf.doctor.git_version
  set -l min_version 1.9.5
  set -l current_version
  begin
    git --version | read -la version_parts
    set current_version "$version_parts[3]"
  end

  if not omf.check.version $min_version $current_version
    echo (omf::err)"Warning: "(omf::off)"Oh-My-Fish requires "(omf::em)"git"(omf::off)" version "(omf::em)"$min_version"(omf::off)" or above"
    echo "Your git version is "(omf::em)$current_version(omf::off)
    echo
    return 1
  end
end

# omf doctor [--fix]
function omf.doctor
  set -e __omf_doctor_fix
  for arg in $argv
    switch $arg
      case --fix
        set -g __omf_doctor_fix
      case '*'
        echo (omf::err)"Unknown option: $arg"(omf::off) >&2
        return $OMF_UNKNOWN_OPT
    end
  end

  echo "Oh My Fish version:   "(omf.version)
  echo "OS type:              "(uname)
  echo "Fish version:         "(fish --version)
  echo "Git version:          "(git --version)
  echo "Git core.autocrlf:    "(git config core.autocrlf; or echo no)

  __omf.doctor.fish_version; or set -l doctor_failed
  __omf.doctor.git_version; or set -l doctor_failed
  __omf.doctor.theme; or set -l doctor_failed
  __omf.doctor.bundle; or set -l doctor_failed
  __omf.doctor.packages; or set -l doctor_failed

  fish "$OMF_PATH/bin/install" --check
    or set -l doctor_failed

  set -l fix_requested
  set -q __omf_doctor_fix; or set -e fix_requested
  set -e __omf_doctor_fix

  if set -q doctor_failed
    if set -q fix_requested
      echo "Some problems were fixed. Run "(omf::em)"omf reload"(omf::off)" to apply them."
    else
      echo "If everything you use Oh My Fish for is working fine, please don't worry and just ignore the warnings. Thanks!"
    end
  else
    echo (omf::em)"Your shell is ready to swim."(omf::off)
  end
end
