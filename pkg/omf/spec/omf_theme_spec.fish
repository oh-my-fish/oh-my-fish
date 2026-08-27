# Themes are created under $OMF_CONFIG/themes so the sandboxed install is
# the only thing touched.
function __spec_make_theme -a name layout
  set -l dir $OMF_CONFIG/themes/$name
  switch $layout
    case root
      command mkdir -p $dir
      echo "function fish_prompt; echo '$name> '; end" > $dir/fish_prompt.fish
    case functions
      command mkdir -p $dir/functions
      echo "function fish_prompt; echo '$name> '; end" > $dir/functions/fish_prompt.fish
    case none
      command mkdir -p $dir/functions
      echo "function __$name; end" > $dir/functions/__$name.fish
  end
end

function describe_omf_theme_prompt
  function before_all
    set -g __spec_link (omf.xdg.config_home)/fish/functions/fish_prompt.fish
    set -g __spec_theme_before (cat $OMF_CONFIG/theme)
    __spec_make_theme spec_root root
    __spec_make_theme spec_funcs functions
    __spec_make_theme spec_none none
  end

  function after_all
    omf.theme.set $__spec_theme_before > /dev/null
    command rm -rf $OMF_CONFIG/themes/spec_root $OMF_CONFIG/themes/spec_funcs $OMF_CONFIG/themes/spec_none
    command rm -f $__spec_link.*.copy
    set -e __spec_link __spec_theme_before
  end

  function it_links_a_prompt_kept_under_functions
    omf.theme.set spec_funcs
    assert_exit_code 0
    assert_equal $OMF_CONFIG/themes/spec_funcs/functions/fish_prompt.fish (readlink $__spec_link)
    omf.check.fish_prompt
    assert_exit_code 0
  end

  function it_links_a_prompt_kept_at_the_theme_root
    omf.theme.set spec_root
    assert_exit_code 0
    assert_equal $OMF_CONFIG/themes/spec_root/fish_prompt.fish (readlink $__spec_link)
  end

  function it_removes_a_stale_link_when_the_theme_has_no_prompt
    omf.theme.set spec_root > /dev/null
    omf.theme.set spec_none
    assert_exit_code 0
    assert_file_does_not_exist $__spec_link
    omf.check.fish_prompt
    assert_exit_code 0
  end

  function it_heals_a_link_left_behind_by_another_theme
    omf.theme.set spec_root > /dev/null
    # Simulate the old behaviour: theme switched, link not updated.
    echo spec_funcs > $OMF_CONFIG/theme
    omf.check.fish_prompt
    assert_exit_code 2

    omf.theme.set spec_root > /dev/null
    omf.theme.set spec_funcs
    assert_exit_code 0
    assert_equal $OMF_CONFIG/themes/spec_funcs/functions/fish_prompt.fish (readlink $__spec_link)
  end

  function it_backs_up_a_user_written_prompt_instead_of_refusing
    omf.theme.set spec_root > /dev/null
    command rm -f $__spec_link
    echo 'function fish_prompt; echo "mine> "; end' > $__spec_link
    omf.check.fish_prompt
    assert_exit_code 1

    set -l output (omf.theme.set spec_funcs)
    assert_exit_code 0
    assert_match 'moved to' "$output"
    assert_equal $OMF_CONFIG/themes/spec_funcs/functions/fish_prompt.fish (readlink $__spec_link)
    assert_equal 1 (count $__spec_link.*.copy)
    assert_file_contains (ls $__spec_link.*.copy) 'mine> '
  end

  function it_reports_a_missing_theme
    set -l output (omf theme no-such-theme-omf-spec 2>&1)
    assert_exit_code 3
    assert_match 'Theme not installed' "$output"
  end
end

function describe_omf_doctor
  function before_all
    set -g __spec_link (omf.xdg.config_home)/fish/functions/fish_prompt.fish
    set -g __spec_theme_before (cat $OMF_CONFIG/theme)
    __spec_make_theme spec_root root
    __spec_make_theme spec_funcs functions
  end

  function after_all
    omf.theme.set $__spec_theme_before > /dev/null
    command rm -rf $OMF_CONFIG/themes/spec_root $OMF_CONFIG/themes/spec_funcs $OMF_CONFIG/pkg/spec_broken
    omf.bundle.remove theme spec_root
    omf.bundle.remove theme spec_funcs
    omf.bundle.remove package spec_broken
    set -e __spec_link __spec_theme_before
  end

  function it_fixes_a_stale_prompt_link
    omf.theme.set spec_root > /dev/null
    echo spec_funcs > $OMF_CONFIG/theme
    set -l output (omf doctor --fix 2>&1 | string replace -ra '\e\[[0-9;]*m' '')
    assert_match 'links to a different theme' "$output"
    assert_match 'Fixed: fish_prompt.fish now follows the spec_funcs theme' "$output"
    assert_equal $OMF_CONFIG/themes/spec_funcs/functions/fish_prompt.fish (readlink $__spec_link)
  end

  function it_reports_packages_with_syntax_errors
    command mkdir -p $OMF_CONFIG/pkg/spec_broken/functions
    echo 'function spec_broken' > $OMF_CONFIG/pkg/spec_broken/functions/spec_broken.fish
    set -l output (omf doctor 2>&1 | string replace -ra '\e\[[0-9;]*m' '')
    assert_match 'package spec_broken has a syntax error' "$output"
    assert_match 'omf remove spec_broken' "$output"
    command rm -rf $OMF_CONFIG/pkg/spec_broken
  end

  function it_records_installed_packages_missing_from_the_bundle
    omf.bundle.remove theme spec_root
    omf.bundle.remove theme spec_funcs
    set -l output (omf doctor 2>&1 | string replace -ra '\e\[[0-9;]*m' '')
    assert_match 'missing from your bundle: .*theme spec_funcs, theme spec_root' "$output"
    omf doctor --fix > /dev/null 2>&1
    assert_file_contains_regex $OMF_CONFIG/bundle '^theme spec_root$'
    assert_file_contains_regex $OMF_CONFIG/bundle '^theme spec_funcs$'
  end

  function it_reports_a_healthy_install
    omf doctor --fix > /dev/null 2>&1
    set -l output (omf doctor 2>&1 | string replace -ra '\e\[[0-9;]*m' '')
    assert_exit_code 0
    assert_match 'ready to swim' "$output"
    assert_not_match 'Warning' "$output"
  end

  function it_rejects_unknown_options
    omf doctor --nope 2>/dev/null
    assert_exit_code 2
  end
end
