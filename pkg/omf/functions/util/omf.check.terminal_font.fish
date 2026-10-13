function omf.check.terminal_font
  # Check if the active theme commonly relies on Powerline/Nerd fonts
  # and warn if the user runs on a terminal emulator without built-in fallback
  # (such as native Apple Terminal) without configuring explicit font settings.
  set -l active_theme
  test -f "$OMF_CONFIG/theme"; and set active_theme (cat "$OMF_CONFIG/theme")
  test -z "$active_theme"; and set active_theme "default"

  # Themes that default to Powerline glyphs:
  set -l powerline_themes bobthefish agnoster chain bira dangerous lambda

  if contains -- "$active_theme" $powerline_themes
    # Apple Terminal (TERM_PROGRAM=Apple_Terminal) does not auto-fallback private unicode glyphs
    if test "$TERM_PROGRAM" = "Apple_Terminal"
      # If neither theme_powerline_fonts nor theme_nerd_fonts is explicitly set
      if not set -q theme_powerline_fonts; and not set -q theme_nerd_fonts
        return 1
      end
    end
  end

  return 0
end
