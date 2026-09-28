function describe_omf_list_tests
  function it_can_list_plugins
    set -l list_output (omf list -p)
    assert_exit_code 0
    # Built-in packages (omf, fish-spec) are not listed.
    assert_equal "" "$list_output"
  end

  function it_can_list_themes
    set -l list_output (omf list -t)
    assert_exit_code 0
    assert_equal default "$list_output"
  end

  function it_can_list_installed_plugins
    set -l output (omf remove apt 2> /dev/null)
    set -l output (omf install apt 2> /dev/null)
    set -l list_output (omf list -p)
    assert_exit_code 0
    assert_equal apt "$list_output"
    set -l output (omf remove apt 2> /dev/null)
  end
end
