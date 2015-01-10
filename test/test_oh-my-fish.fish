function describe_oh_my_fish
  function before_all
    set -g fish_custom_bak $fish_custom
    set -g fish_function_path_bak $fish_function_path
    set -g fish_plugins_bak $fish_plugins
  end

  function after_all
    set fish_custom $fish_custom_bak
    set fish_function_path $fish_function_path_bak
    set fish_plugins $fish_plugins_bak
  end

  function it_has_a_default_custom_folder
    set -e fish_custom
    load_oh_my_fish
    expect $fish_custom to_equal "$HOME/.oh-my-fish/custom"
  end

  function it_allows_the_custom_folder_location_to_be_customized
    set fish_custom /tmp
    load_oh_my_fish
    expect $fish_custom to_equal '/tmp'
  end

  function it_loads_all_custom_files
    set fish_custom /tmp
    echo 'set -gx TEST_LOAD_CUSTOM_FILE file_loaded' > $fish_custom/test.load

    load_oh_my_fish
    expect $TEST_LOAD_CUSTOM_FILE to_equal 'file_loaded'
  end

  function it_loads_all_oh_my_fish_functions
    array.delete "$fish_path/functions/" fish_function_path

    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/functions/
  end

  function it_loads_all_selected_plugins
    array.delete "$fish_path/plugins/bak" fish_function_path
    array.delete "$fish_path/plugins/z" fish_function_path

    set fish_plugins bak z
    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/plugins/bak and
      expect $fish_function_path to_include $fish_path/plugins/z
  end

  function it_loads_the_selected_theme
    array.delete "$fish_path/themes/l" fish_function_path

    set fish_theme l
    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/themes/l
  end
end

function load_oh_my_fish
  . $fish_path/oh-my-fish.fish
end

import plugins/fish-spec
