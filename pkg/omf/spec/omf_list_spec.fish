function describe_omf_list_tests
  function it_can_list_plugins
    set -l list_output (omf list -p)
    assert 0 = $status
    set list_output (echo "$list_output" | tr -s ' \t' ' ' | string trim)
    assert_equal "fish-spec omf" "$list_output"
  end

  function it_can_list_themes
    set -l list_output (omf list -t)
    assert 0 = $status
    set list_output (echo "$list_output" | tr -s ' \t' ' ' | string trim)
    assert_equal "default" "$list_output"
  end

  function it_can_list_installed_plugins
    set -l output (omf remove apt 2> /dev/null)
    set -l output (omf install apt 2> /dev/null)
    set -l list_output (omf list -p)
    assert 0 = $status
    set list_output (echo "$list_output" | tr -s ' \t' ' ' | string trim)
    assert_equal "apt fish-spec omf" "$list_output"
    set -l output (omf remove apt 2> /dev/null)
  end
end
