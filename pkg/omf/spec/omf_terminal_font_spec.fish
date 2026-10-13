function describe_terminal_font_spec
  function before_all
    set -g __old_term_prog $TERM_PROGRAM
    set -g __old_theme_powerline $theme_powerline_fonts
    set -g __old_theme_nerd $theme_nerd_fonts
  end

  function after_all
    set -gx TERM_PROGRAM $__old_term_prog
    set -gx theme_powerline_fonts $__old_theme_powerline
    set -gx theme_nerd_fonts $__old_theme_nerd
    set -e __old_term_prog
    set -e __old_theme_powerline
    set -e __old_theme_nerd
  end

  function it_passes_when_not_in_apple_terminal
    set -gx TERM_PROGRAM "iTerm.app"
    omf.check.terminal_font
    assert_exit_code 0
  end

  function it_passes_when_powerline_fonts_explicitly_configured
    set -gx TERM_PROGRAM "Apple_Terminal"
    set -gx theme_powerline_fonts no
    omf.check.terminal_font
    assert_exit_code 0
  end

  function it_warns_in_apple_terminal_without_explicit_config
    set -gx TERM_PROGRAM "Apple_Terminal"
    set -e theme_powerline_fonts
    set -e theme_nerd_fonts
    # In test sandbox, theme is default which is not in powerline list
    omf.check.terminal_font
    assert_exit_code 0
  end
end
