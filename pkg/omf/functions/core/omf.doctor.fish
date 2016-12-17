function __omf.doctor.theme
  if not omf.check.fish_prompt
    echo (omf::err)"Warning: "(omf::off)(omf::em)"fish_prompt.fish"(omf::off)" is overridden."
    echo (omf::em)"  fish_config"(omf::off)" command persists the prompt to "(omf::em)"~/.config/fish/functions/fish_prompt.fish"(omf::off)
    echo "  That file takes precedence over Oh My Fish's themes. Remove the file to fix it:"
    echo (omf::em)"  rm ~/.config/fish/functions/fish_prompt.fish"(omf::off)
    echo

    return 1
  end

  return 0
end

function __omf.doctor.fish_version
  set -l min_version 2.2.0
  set -l current_version
  begin
    set -l IFS '-'
    echo $FISH_VERSION | read -la version_parts
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

function omf.doctor
  echo "Oh My Fish version:   "(omf.version)
  echo "OS type:              "(uname)
  echo "Fish version:         "(fish --version)
  echo "Git version:          "(git --version)
  echo "Git core.autocrlf:    "(git config core.autocrlf; or echo no)

  __omf.doctor.fish_version; or set -l doctor_failed
  __omf.doctor.git_version; or set -l doctor_failed
  __omf.doctor.theme; or set -l doctor_failed

  if set -q doctor_failed
    echo "If everything you use Oh My Fish for is working fine, please don't worry and just ignore the warnings. Thanks!"
  else
    echo (omf::em)"Your shell is ready to swim."(omf::off)
  end
end
