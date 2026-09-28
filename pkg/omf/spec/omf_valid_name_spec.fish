function describe_omf_packages_valid_name
  function it_accepts_lowercase_names
    omf.packages.valid_name bass
    assert_exit_code 0
    omf.packages.valid_name theme-bobthefish
    assert_exit_code 0
    omf.packages.valid_name foo.bar_baz
    assert_exit_code 0
  end

  function it_accepts_names_starting_with_uppercase_or_digit
    omf.packages.valid_name Bass
    assert_exit_code 0
    omf.packages.valid_name 2fa
    assert_exit_code 0
  end

  function it_rejects_reserved_names
    omf.packages.valid_name omf
    assert_exit_code 10
    omf.packages.valid_name OMF
    assert_exit_code 10
    omf.packages.valid_name default
    assert_exit_code 10
  end

  function it_rejects_names_with_unsafe_characters
    omf.packages.valid_name "foo/bar"
    assert_exit_code 10
    omf.packages.valid_name "foo bar"
    assert_exit_code 10
    omf.packages.valid_name "foo&bar"
    assert_exit_code 10
    omf.packages.valid_name "-foo"
    assert_exit_code 10
    omf.packages.valid_name ""
    assert_exit_code 10
  end
end
