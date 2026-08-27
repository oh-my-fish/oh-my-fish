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
