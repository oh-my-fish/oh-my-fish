# omf.theme.link_prompt <theme>
#
# Makes ~/.config/fish/functions/fish_prompt.fish reflect the given theme.
# That file shadows every theme, so it must either link to the theme's
# prompt or not exist at all. Stale links left by an earlier theme are
# replaced; a prompt the user wrote is backed up first, never deleted.
function omf.theme.link_prompt -a theme
  set -l user_functions_path (omf.xdg.config_home)/fish/functions
  set -l prompt_link "$user_functions_path/fish_prompt.fish"

  command mkdir -p "$user_functions_path"

  if test -e "$prompt_link" -o -L "$prompt_link"
    if not omf.check.fish_prompt.owned "$prompt_link"
      set -l backup "$prompt_link."(date +%s)".copy"
      command mv "$prompt_link" "$backup"
        or return 1
      echo (omf::em)"Your custom fish_prompt.fish was moved to $backup"(omf::off)
      echo "It shadowed every Oh My Fish theme; restore it if you prefer your own prompt."
    end
  end

  if set -l target (omf.theme.prompt_path $theme)
    command ln -sf "$target" "$prompt_link"
  else
    # The theme defines no prompt: nothing may shadow fish's default.
    command rm -f "$prompt_link"
  end
end
