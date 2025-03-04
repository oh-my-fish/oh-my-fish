function describe_omf_packages_tests
  function before_all
    set -gx CI WORKAROUND
  end

  function before_all
    set -e CI
  end

  function it_can_extract_name_from_name
    set -l output (omf.packages.name foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_of_a_plugin_package
    set -l output (omf.packages.name plugin-foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_of_a_theme_package
    set -l output (omf.packages.name theme-foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_name_ended_in_dot_git
    set -l output (omf.packages.name foo.git)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_name_with_dot
    set -l output (omf.packages.name foo.bar)
    assert 0 = $status
    assert "foo.bar" = "$output"
  end

  function it_can_extract_name_from_name_ended_in_git
    set -l output (omf.packages.name foobargit)
    assert 0 = $status
    assert "foobargit" = "$output"
  end

  function it_can_extract_name_from_url
    set -l output (omf.packages.name http://github.com/user/foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_url_of_a_plugin_package
    set -l output (omf.packages.name http://github.com/user/plugin-foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_url_of_a_theme_package
    set -l output (omf.packages.name http://github.com/user/theme-foo)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_url_ended_in_dot_git
    set -l output (omf.packages.name http://github.com/user/foo.git)
    assert 0 = $status
    assert "foo" = "$output"
  end

  function it_can_extract_name_from_url_with_dot
    set -l output (omf.packages.name http://github.com/user/foo.bar)
    assert 0 = $status
    assert "foo.bar" = "$output"
  end

  function it_can_extract_name_from_url_ended_in_git
    set -l output (omf.packages.name http://github.com/user/foobargit)
    assert 0 = $status
    assert "foobargit" = "$output"
  end
end
