function describe_omf_new_and_remove
  function after_all
    command rm -rf $OMF_CONFIG/pkg/MyPlugin
    omf.bundle.remove package MyPlugin
  end

  function it_creates_a_package_with_a_capitalised_name
    fish -c 'omf new plugin MyPlugin' >/dev/null
    assert_exit_code 0
    assert_directory_exists $OMF_CONFIG/pkg/MyPlugin
    assert_file_exists $OMF_CONFIG/pkg/MyPlugin/init.fish
  end

  function it_removes_a_package_with_a_capitalised_name
    test -d $OMF_CONFIG/pkg/MyPlugin; or fish -c 'omf new plugin MyPlugin' >/dev/null
    set -l output (omf remove MyPlugin)
    assert_exit_code 0
    assert_directory_does_not_exist $OMF_CONFIG/pkg/MyPlugin
  end

  function it_does_not_exit_the_shell_when_paths_are_missing
    set -l output (fish -c 'cd /; set -x OMF_CONFIG /nonexistent; set -x OMF_PATH /nonexistent; omf.packages.new plugin foo 2>/dev/null; echo survived')
    assert_equal survived "$output[-1]"
  end
end

function describe_omf_theme_cli
  function it_prints_a_usage_line_with_the_command_name
    set -l output (omf theme a b 2>&1 | string replace -ra '\e(\[[0-9;]*m|\(B)' '')
    assert_match 'Usage: omf theme' "$output"
  end
end

function describe_omf_install_and_update_exit_codes
  function it_fails_when_a_package_cannot_be_installed
    omf install this-package-does-not-exist-omf-spec >/dev/null 2>&1
    assert_exit_code 1
  end

  function it_reports_a_failed_core_update
    set -l output (fish -c 'function omf.core.update; return 1; end; omf update omf 2>&1' | string replace -ra '\e(\[[0-9;]*m|\(B)' '')
    assert_match 'failed to update' "$output"
    assert_not_match 'is up to date' "$output"
  end
end
