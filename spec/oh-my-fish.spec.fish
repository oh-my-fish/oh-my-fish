import plugins/fish-spec

function describe_oh_my_fish -d "Oh-My-Fish test spec..."
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

  function it_has_a_default_custom_directory \
    -d "It should have a default custom directory"

    set -e fish_custom
    load_oh_my_fish
    expect $fish_custom --to-eq "$HOME/.oh-my-fish/custom"
  end

  function it_allows_the_custom_folder_location_to_be_customized \
    -d "It should allow modifying the location of the custom directory"

    set -g fish_custom /tmp
    load_oh_my_fish
    expect $fish_custom --to-eq '/tmp'
  end

  function it_loads_all_custom_files \
    -d "It should load all custom files"

    set -g fish_custom /tmp
    echo 'set -gx TEST_LOAD_CUSTOM_FILE file_loaded' > $fish_custom/test.load

    load_oh_my_fish
    expect $TEST_LOAD_CUSTOM_FILE --to-eq 'file_loaded'
  end

  function it_loads_all_oh_my_fish_functions \
    -d "It should load all default functions"

    list.erase "$fish_path/functions/" --from fish_function_path

    load_oh_my_fish
    expect $fish_function_path --to-contain $fish_path/functions/
  end

  function it_loads_all_selected_plugins \
    -d "It should load all user selected plugins"

    list.erase "$fish_path/plugins/bak" \
               "$fish_path/plugins/z" --from fish_function_path

    set -g fish_plugins bak z
    load_oh_my_fish
    expect $fish_function_path --to-contain $fish_path/plugins/bak
      and expect $fish_function_path --to-contain $fish_path/plugins/z
  end

  function it_loads_the_selected_theme \
    -d "It should load the user selected theme"

    list.erase "$fish_path/themes/l" --from fish_function_path

    set fish_theme l
    load_oh_my_fish
    expect $fish_function_path --to-contain $fish_path/themes/l
  end
end

function load_oh_my_fish
  . $fish_path/oh-my-fish.fish
end

# Begin test suite ❯❯❯
spec.run $argv
