import plugins/fish-spec
import plugins/theme

function describe_theme -d "theme: quick theme switcher"
  function before_all
    set -g __theme_test_last_theme $fish_theme
  end

  function it_changes_the_current_theme
    theme bobthefish
    expect $fish_theme --to-equal bobthefish
      and expect $fish_function_path --to-contain-all $fish_path/themes/bobthefish
  end

  function it_restores_the_original_theme
    theme bobthefish
    theme -r
    expect $fish_theme --to-equal $__theme_test_last_theme
  end

  function it_prints_usage_help
    expect (theme -h | grep USAGE | sed -E 's/ //g') --to-equal "USAGE"
  end

  function it_prints_a_list_of_all_themes
    set -l themes (theme -l)
    for theme in $fish_custom/themes/* $fish_path/themes/*
      set theme (basename "$theme")
      expect (echo "$themes" | grep -o "$theme") --to-equal "$theme"
    end
  end

  function it_highlights_the_currently_selected_theme
    set -l themes (theme -l)
    expect (echo "$themes" | grep -o "$fish_theme\*") --to-equal "$fish_theme*"
  end

  function it_can_reload_a_theme_multiple_times
    theme bobthefish
    theme fishface
    theme bobthefish
    expect $fish_theme --to-equal bobthefish
      and expect $fish_function_path --to-contain-all $fish_path/themes/bobthefish
      and expect $fish_function_path --to-not-contain-all $fish_path/themes/fishface
  end

  function it_returns_1_if_the_theme_does_not_exist
    set -l improbable_theme ___(date +%s)___
    set -l ignore_output (theme "$improbable_theme")
    expect $status --to-equal 1
  end
end

spec.run $argv
