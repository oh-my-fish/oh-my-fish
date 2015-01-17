import plugins/fish-spec

function describe_oh_my_fish
  function before_all
    set -g fish_custom_bak          $fish_custom
    set -g fish_plugins_bak         $fish_plugins
    set -g fish_function_path_bak   $fish_function_path
  end

  function after_all
    set fish_custom         $fish_custom_bak
    set fish_plugins        $fish_plugins_bak
    set fish_function_path  $fish_function_path_bak
  end

  function it_has_a_default_custom_directory
    set -e fish_custom
    load_oh_my_fish
    expect $fish_custom --to-equal "$HOME/.oh-my-fish/custom"
  end

  function it_allows_the_custom_folder_location_to_be_customized
    set -g fish_custom /tmp
    load_oh_my_fish
    expect $fish_custom --to-equal '/tmp'
  end

  function it_loads_all_custom_files
    set -g fish_custom /tmp
    echo 'set -gx TEST_LOAD_CUSTOM_FILE file_loaded' > $fish_custom/test.load

    load_oh_my_fish
    expect $TEST_LOAD_CUSTOM_FILE --to-equal 'file_loaded'
  end

  function it_loads_all_oh_my_fish_functions
    list.erase "$fish_path/functions/" --from fish_function_path

    load_oh_my_fish
    expect $fish_function_path --to-contain-all $fish_path/functions/
  end

  function it_loads_all_selected_plugins
    list.erase "$fish_path/plugins/bak" \
               "$fish_path/plugins/z" --from fish_function_path

    set -g fish_plugins bak z
    load_oh_my_fish
    expect $fish_function_path --to-contain-all $fish_path/plugins/bak
    expect $fish_function_path --to-contain-all $fish_path/plugins/z
  end

  function it_loads_the_selected_theme
    list.erase "$fish_path/themes/l" --from fish_function_path

    set fish_theme l
    load_oh_my_fish
    expect $fish_function_path --to-contain-all $fish_path/themes/l
  end

  function it_reloads_with_status_of_0
    load_oh_my_fish
    expect $status --to-equal 0
  end
end

function load_oh_my_fish
  . $fish_path/oh-my-fish.fish
end

spec.run $argv
