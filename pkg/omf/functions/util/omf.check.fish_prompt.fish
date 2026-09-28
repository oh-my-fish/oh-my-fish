# Succeeds when the user's fish_prompt.fish does not override the active theme.
function omf.check.fish_prompt
  set -l prompt_file "fish_prompt.fish"
  set -l theme (cat $OMF_CONFIG/theme 2> /dev/null)

  set -l user_functions_path (omf.xdg.config_home)/fish/functions
  set -l prompt_path "$user_functions_path/$prompt_file"

  if test -L "$prompt_path"
    # Oh My Fish manages the prompt through a symlink to the theme's file.
    set -l target (readlink "$prompt_path")
    contains -- "$target" {$OMF_CONFIG,$OMF_PATH}/themes/$theme/$prompt_file
  else if test -e "$prompt_path"
    # A regular file (e.g. written by fish_config) shadows every theme.
    return 1
  else
    return 0
  end
end
