import plugins/fish-spec

function describe_import
  function before_all
    set -g fish_function_path_bak   $fish_function_path

    list.erase "$fish_path/plugins/archlinux" --from fish_function_path
    list.erase "$fish_path/plugins/git-flow" --from fish_function_path
    list.erase "$fish_path/plugins/tiny" --from fish_function_path
  end

  function after_all
    set fish_function_path  $fish_function_path_bak
  end

  function it_imports_all_fish_files
    import plugins/tiny
    expect $fish_function_path --to-contain-all $fish_path/plugins/tiny
  end

  function it_imports_all_fish_files_recursively
    import plugins/archlinux
    expect $fish_function_path --to-contain-all $fish_path/plugins/archlinux/pacman
  end

  function it_does_not_import_test_files
    import plugins/tiny
    expect $fish_function_path --to-not-contain-all $fish_path/plugins/spec
  end

  function it_does_not_import_completion_files
    import plugins/git-flow
    expect $fish_function_path --to-not-contain-all $fish_path/plugins/git-flow/completions/
  end

  function it_adds_completion_files_to_completion_path
    import plugins/git-flow
    expect $fish_complete_path --to-contain-all $fish_path/plugins/git-flow/completions
  end

  function it_adds_completion_files_for_custom_plugins_to_completion_path
    import plugins/example
    expect $fish_complete_path --to-contain-all $fish_custom/plugins/example/completions
  end
end

spec.run $argv
