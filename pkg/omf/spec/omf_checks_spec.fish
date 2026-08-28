function describe_omf_check_version
  function it_accepts_equal_and_newer_versions
    omf.check.version 3.0.0 3.0.0
    assert_exit_code 0
    omf.check.version 3.0.0 4.8.1
    assert_exit_code 0
    omf.check.version 1.9.5 1.10.0
    assert_exit_code 0
    omf.check.version 2.9 2.10
    assert_exit_code 0
  end

  function it_rejects_older_versions
    omf.check.version 3.0.0 2.7.1
    assert_exit_code 1
    omf.check.version 1.10.0 1.9.5
    assert_exit_code 1
  end
end

function describe_omf_check_fish_prompt
  function before_all
    set -g __spec_prompt (omf.xdg.config_home)/fish/functions/fish_prompt.fish
    command mkdir -p (dirname $__spec_prompt)
    set -g __spec_prompt_backup (mktemp)
    if test -L $__spec_prompt
      set -g __spec_prompt_was_link (readlink $__spec_prompt)
    else if test -e $__spec_prompt
      command cp $__spec_prompt $__spec_prompt_backup
      set -g __spec_prompt_was_file
    end
  end

  function after_all
    command rm -f $__spec_prompt
    if set -q __spec_prompt_was_link
      command ln -s $__spec_prompt_was_link $__spec_prompt
    else if set -q __spec_prompt_was_file
      command cp $__spec_prompt_backup $__spec_prompt
    end
    command rm -f $__spec_prompt_backup
    set -e __spec_prompt __spec_prompt_backup __spec_prompt_was_link __spec_prompt_was_file
  end

  function it_is_healthy_when_no_prompt_file_exists
    command rm -f $__spec_prompt
    omf.check.fish_prompt
    assert_exit_code 0
  end

  function it_is_healthy_when_prompt_links_to_the_active_theme
    read -l theme < $OMF_CONFIG/theme
    command rm -f $__spec_prompt
    command ln -s (omf.theme.prompt_path $theme) $__spec_prompt
    omf.check.fish_prompt
    assert_exit_code 0
  end

  function it_detects_a_plain_prompt_file_overriding_the_theme
    command rm -f $__spec_prompt
    echo 'function fish_prompt; echo "> "; end' > $__spec_prompt
    omf.check.fish_prompt
    assert_exit_code 1
  end
end

function describe_omf_version
  function it_prints_a_version_without_a_leading_v
    set -l omf_version (omf.version)
    assert_exit_code 0
    assert_not_match '^v' "$omf_version"
    assert_not_equal "" "$omf_version"
  end

  function it_does_not_truncate_a_commit_hash_when_there_are_no_tags
    if not set -l head (command git -C $OMF_PATH rev-parse --short HEAD 2> /dev/null)
      # Not a Git checkout (e.g. installed from a tarball).
      assert_equal unknown (omf.version)
      return
    end
    if test -z (command git -C $OMF_PATH tag -l 'v*' | head -n1)
      assert_equal $head (omf.version)
    end
  end
end

function describe_omf_index_path
  function it_ignores_an_empty_xdg_cache_home
    set -l path (env XDG_CACHE_HOME= fish -c 'omf.index.path')
    assert_match '/\.cache/omf$' "$path"
  end
end

function describe_omf_packages_list
  function it_hides_builtin_packages
    set -l plugins (omf.packages.list --plugin)
    assert_not_in_array omf $plugins
    assert_not_in_array fish-spec $plugins
  end
end
