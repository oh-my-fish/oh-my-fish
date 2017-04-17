function describe_basic_tests
  function before_all
    set -gx CI WORKAROUND
  end

  function it_has_a_help_command
    set -l output (omf help)
    assert 0 = $status
  end

  function it_has_a_doctor_command
    set -l output (omf doctor)
    assert 0 = $status
  end
end
