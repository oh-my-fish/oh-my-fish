function describe_oh_my_fish
  function before_each
    set -g fish_custom_bak $fish_custom
    set -g fish_function_path_bak $fish_function_path
    set -g fish_plugins_bak $fish_plugins

    set -e fish_custom
  end

  function after_each
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
    set -g fish_custom /tmp
    load_oh_my_fish
    expect $fish_custom to_equal '/tmp'
  end

  function it_loads_all_custom_files
    set -g fish_custom /tmp
    echo 'set -gx TEST_LOAD_CUSTOM_FILE file_loaded' > $fish_custom/test.load

    load_oh_my_fish
    expect $TEST_LOAD_CUSTOM_FILE to_equal 'file_loaded'
  end

  function it_loads_all_oh_my_fish_functions
    list.erase "$fish_path/functions/" --from fish_function_path

    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/functions/
  end

  function it_loads_all_selected_plugins
    list.erase "$fish_path/plugins/bak" "$fish_path/plugins/z" --from fish_function_path

    set fish_plugins bak z
    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/plugins/bak and
      expect $fish_function_path to_include $fish_path/plugins/z
  end

  function it_loads_plugins_from_custom_folder
    list.erase "$fish_custom/plugins/example" --from fish_function_path

    set fish_plugins example
    load_oh_my_fish
    expect $fish_function_path to_include $fish_custom/plugins/example
  end

  function it_loads_the_selected_theme
    list.erase "$fish_path/themes/l" --from fish_function_path

    set fish_theme l
    load_oh_my_fish
    expect $fish_function_path to_include $fish_path/themes/l
  end
end

function load_oh_my_fish
  . $fish_path/oh-my-fish.fish
end

import plugins/fish-spec
