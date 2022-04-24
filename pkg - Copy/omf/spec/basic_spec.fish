function describe_basic_tests
  function before_all
    set -gx CI WORKAROUND
  end

  function it_has_a_help_command
    set -l output (omf help)
    echo $output | grep -Eq "cd.+Change to root or package directory"
    echo $output | grep -Eq "channel.+Get or change the update channel"
    echo $output | grep -Eq "describe.+Show information about a package"
    echo $output | grep -Eq "destroy.+Uninstall Oh My Fish"
    echo $output | grep -Eq "doctor.+Troubleshoot Oh My Fish"
    echo $output | grep -Eq "help.+Shows help about a command"
    echo $output | grep -Eq "install.+Install one or more packages"
    echo $output | grep -Eq "list.+List installed packages"
    echo $output | grep -Eq "new.+Create a new package from a template"
    echo $output | grep -Eq "reload.+Reload the current shell"
    echo $output | grep -Eq "remove.+Remove a package"
    echo $output | grep -Eq "repositories.+Manage package repositories"
    echo $output | grep -Eq "search.+Search for a package or theme"
    echo $output | grep -Eq "theme.+Activate and list available themes"
    echo $output | grep -Eq "update.+Update Oh My Fish"
    echo $output | grep -Eq "version.+Display version and exit"
    assert 0 = $status
  end

  function it_has_a_doctor_command
    set -l output (omf doctor)
    assert 0 = $status
    assert -n (echo $output | grep "Oh My Fish version")
    assert -n (echo $output | grep "Checking for a sane environment...")
  end

  function it_installs_packages
    set -l remove_output (omf remove apt 2> /dev/null)
    set -l install_output (omf install apt)
    assert 0 = $status
    assert -n (echo $install_output | grep "apt successfully installed.")
  end

  function it_removes_packages
    set -l install_output (omf install apt 2> /dev/null)
    set -l remove_output (omf remove apt)
    assert 0 = $status
    assert -n (echo $remove_output | grep -q "apt successfully removed.")
  end
end
