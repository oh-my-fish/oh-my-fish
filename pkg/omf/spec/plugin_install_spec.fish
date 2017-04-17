function describe_plugin_install
  function before_all
    set -gx CI WORKAROUND
  end

  function before_each
    rm -rf $OMF_PATH/pkg/omf-test-plugin-* ^/dev/null
    cp $OMF_CONFIG/bundle $OMF_CONFIG/bundle.fish-spec
  end

  function after_each
    rm -rf $OMF_PATH/pkg/omf-test-plugin-* ^/dev/null
    cp $OMF_CONFIG/bundle.fish-spec $OMF_CONFIG/bundle
  end

  function after_all
    rm -rf $OMF_PATH/db/pkg/omf-test-plugin-*
  end

  function it_installs_plugins_from_the_bundle_file_when_called_with_no_arguments
    echo package (plugin) > $OMF_CONFIG/bundle

    set -l output (omf install 2>&1 | grep "omf-test-plugin-valid")
    assert -n "$output"
  end

  function it_returns_success_if_a_plugin_is_installed
    omf install (plugin) >/dev/null
    assert 0 = $status
  end

  function it_prints_a_success_message_if_a_plugin_is_installed
    set -l output (omf install (plugin) | grep "successfully installed")
    assert -n "$output"
  end

  #function it_returns_an_error_if_a_plugin_fails_to_install
    #omf install (invalid_plugin) >/dev/null 2>&1
    #assert 1 = $status
  #end

  function it_prints_an_error_message_if_a_plugin_fails_to_install
    set -l output (omf install (invalid_plugin) 2>&1 | grep "Could not install package")
    assert -n "$output"
  end

  function it_returns_success_if_a_plugin_and_its_dependencies_are_installed
    omf install (plugin_with_dependent_plugin) >/dev/null
    assert 0 = $status
  end

  function it_prints_a_success_message_if_a_plugin_and_its_dependencies_are_installed
    set -l count (omf install (plugin_with_dependent_plugin) | grep -o "successfully installed" | wc -l | bc)
    assert 2 = $count
  end

  ### Factories ###

  function plugin
    cp $OMF_PATH/db/pkg/basename-compat $OMF_PATH/db/pkg/omf-test-plugin-valid
    echo 'omf-test-plugin-valid'
  end

  function invalid_plugin
    echo 'omf-test-plugin-invalid'
  end

  function plugin_with_dependent_plugin
    omf remove foreign-env 2>&1 >/dev/null #Temporary workaround until we have offline install

    cp $OMF_PATH/db/pkg/nvm $OMF_PATH/db/pkg/omf-test-plugin-with-dependent
    echo 'omf-test-plugin-with-dependent'
  end
end
