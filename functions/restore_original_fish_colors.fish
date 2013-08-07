function restore_original_fish_colors
  # Regular syntax highlighting colors
  set fish_color_normal normal
  set fish_color_command 005fd7 purple
  set fish_color_param 00afff cyan
  set fish_color_redirection normal
  set fish_color_comment red
  set fish_color_error red --bold
  set fish_color_escape cyan
  set fish_color_operator cyan
  set fish_color_quote brown
  set fish_color_autosuggestion 555 yellow
  set fish_color_valid_path --underline

  set fish_color_cwd green
  set fish_color_cwd_root red

  # Background color for matching quotes and parenthesis
  set fish_color_match cyan

  # Background color for search matches
  set fish_color_search_match --background=purple

  # Pager colors
  set fish_pager_color_prefix cyan
  set fish_pager_color_completion normal
  set fish_pager_color_description 555 yellow
  set fish_pager_color_progress cyan
end
