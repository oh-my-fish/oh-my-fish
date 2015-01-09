function suite_oh-my-fish
  function setup
    set -g fish_custom_bak $fish_custom
    set -g fish_function_path_bak $fish_function_path
    set -g fish_plugins_bak $fish_plugins
  end

  function teardown
    set fish_custom $fish_custom_bak
    set fish_function_path $fish_function_path_bak
    set fish_plugins $fish_plugins_bak
  end

  #
  # tests
  #

  function test_default_custom_folder
    set -e fish_custom
    load_oh_my_fish
    assert_equal ~/.oh-my-fish/custom $fish_custom
  end

  function test_custom_folder
    set fish_custom /tmp
    load_oh_my_fish
    assert_equal /tmp $fish_custom
  end

  function test_load_custom_files
    set fish_custom /tmp
    echo 'set -gx TEST_LOAD_CUSTOM_FILE test_load' > $fish_custom/test.load
    load_oh_my_fish
    assert_equal test_load $TEST_LOAD_CUSTOM_FILE
  end

  function test_oh_my_fish_functions
    remove_from_array "$fish_path/functions/" fish_function_path
    load_oh_my_fish
    assert_includes $fish_path/functions/ $fish_function_path
  end

  function test_oh_my_fish_plugins
    remove_from_array "$fish_path/plugins/z" fish_function_path
    set fish_plugins z
    load_oh_my_fish
    assert_includes $fish_path/plugins/z $fish_function_path
  end

  function test_oh_my_fish_themes
    remove_from_array "$fish_path/themes/l" fish_function_path
    set fish_theme l
    load_oh_my_fish
    assert_includes $fish_path/themes/l $fish_function_path
  end

  #
  # helper functions
  #

  function load_oh_my_fish
    . $fish_path/oh-my-fish.fish
  end

  function remove_from_array
    set -l element $argv[1]

    for i in (seq (count $$argv[2]))
      if test $$argv[2][$i] = $element
        set -e $argv[2][$i]
        break
      end
    end
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish
  tank_run
end
