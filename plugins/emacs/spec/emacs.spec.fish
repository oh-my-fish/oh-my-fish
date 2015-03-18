import plugins/fish-spec


function describe_emacs

  function before_all
    set -g __emacs_current_editor $EDITOR
    set -g __emacs_load_file $fish_path/plugins/emacs/emacs.load
    set -g __emacs_functions e ec ek et ecd eeval efile eframe emacs emasc emcas
  end

  function before_each
    set -e EDITOR
    set -g __emacs '/bin/emacs'
    set -g __emacs_version 25
  end

  function it_sets_editor_on_load
    load_emacs_plugin

    expect $EDITOR --to-equal "emacs"
  end

  function it_does_not_set_editor_when_it_is_already_set
    set EDITOR 'vim'

    load_emacs_plugin

    expect $EDITOR --to-equal "vim"
  end

  function it_does_not_set_editor_when_emacs_is_not_found
    emacs_is_not_found

    load_emacs_plugin

    expect "$EDITOR" --to-equal ""
  end

  function it_does_not_set_editor_when_emacs_version_is_lower_than_23
    set __emacs_version 22

    load_emacs_plugin

    expect "$EDITOR" --to-equal ""
  end

  function it_adds_functions_to_fish_function_path
    load_emacs_plugin

    expect (functions) --to-contain-all $__emacs_functions
  end

  function it_has_a_test_helper_that_removes_emacs_functions
    load_emacs_plugin

    expect (functions) --to-contain-all $__emacs_functions

    remove_emacs_functions

    expect (functions) --to-not-contain-all $__emacs_functions
  end


  function it_does_not_add_functions_when_emacs_is_not_found
    remove_emacs_functions
    emacs_is_not_found

    load_emacs_plugin

    expect (functions) --to-not-contain-all $__emacs_functions
  end

  function it_does_not_add_functions_when_emacs_version_is_lower_than_23
    set __emacs_version 22

    expect (functions) --to-not-contain-all $__emacs_functions

    load_emacs_plugin

    expect (functions) --to-not-contain-all $__emacs_functions
  end


  function emacs_is_not_found
    set __emacs ""
    set __emacs_version ""
  end

  function load_emacs_plugin
    source $__emacs_load_file
  end

  function remove_emacs_functions
    for path in $fish_function_path
      set match (echo $path | grep emacs)
      if test -z "$match"
        set -g __new_fish_function_path $__new_fish_function_path $path
      end
    end

    set fish_function_path $__new_fish_function_path
    set -e __new_fish_function_path
  end

  function after_all
    set EDITOR $__emacs_current_editor

    set -e __emacs
    set -e __emacs_version
    set -e __emacs_load_file
    set -e __emacs_functions
    set -e __emacs_current_editor
  end
end


spec.run $argv
