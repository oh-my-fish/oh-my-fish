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

function omf.doctor
  __omf.doctor.theme; or set -l doctor_failed

  if set -q doctor_failed
    echo "If everything you use Oh My Fish for is working fine, please don't worry and just ignore the warnings. Thanks!"
  else
    echo (omf::em)"Your shell is ready to swim."(omf::off)
  end
end
