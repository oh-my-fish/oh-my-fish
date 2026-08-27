# Checks whether the user's fish_prompt.fish is consistent with the active theme.
#
# Returns 0 when no file exists or it links to the active theme's prompt,
#         2 when it is an Oh My Fish link to some other (or removed) theme,
#         1 when it is a prompt the user wrote (regular file or foreign link).
function omf.check.fish_prompt
  set -l theme (cat $OMF_CONFIG/theme 2> /dev/null)
  set -l prompt_link (omf.xdg.config_home)/fish/functions/fish_prompt.fish

  if test -L "$prompt_link"
    set -l target (readlink "$prompt_link")
    set -l expected (omf.theme.prompt_path $theme)
    test "$target" = "$expected"
      and return 0
    omf.check.fish_prompt.owned "$prompt_link"
      and return 2
    return 1
  else if test -e "$prompt_link"
    return 1
  end

  return 0
end

# Succeeds when the given fish_prompt.fish is a link created by Oh My Fish,
# i.e. it points into one of the theme directories (even a removed one).
function omf.check.fish_prompt.owned -a prompt_link
  test -L "$prompt_link"; or return 1
  set -l target (readlink "$prompt_link")
  for themes_dir in {$OMF_CONFIG,$OMF_PATH}/themes
    string match -q -- "$themes_dir/*" "$target"; and return 0
  end
  return 1
end
