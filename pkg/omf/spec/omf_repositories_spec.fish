function describe_omf_repositories
  function before_all
    set -g __spec_repos $OMF_CONFIG/repositories
    set -g __spec_repos_backup (mktemp)
    if test -f $__spec_repos
      command cp $__spec_repos $__spec_repos_backup
    end
  end

  function after_all
    if test -s $__spec_repos_backup
      command cp $__spec_repos_backup $__spec_repos
    else
      command rm -f $__spec_repos
    end
    command rm -f $__spec_repos_backup
    set -e __spec_repos __spec_repos_backup
  end

  function it_refuses_to_add_a_builtin_repository
    omf.index.repositories add https://github.com/oh-my-fish/packages-main master 2>/dev/null
    assert_exit_code 1
  end

  function it_removes_only_the_exact_repository
    command rm -f $__spec_repos
    echo "https://example.com/a main" > $__spec_repos
    echo "https://example.com/a-b main" >> $__spec_repos
    omf.index.repositories remove https://example.com/a main
    assert_exit_code 0
    assert_not_file_contains_regex $__spec_repos '^https://example.com/a main$'
    assert_file_contains_regex $__spec_repos '^https://example.com/a-b main$'
  end

  function it_matches_the_whole_line_when_removing
    command rm -f $__spec_repos
    echo "https://example.com/a main" > $__spec_repos
    echo "https://example.com/a main-old" >> $__spec_repos
    omf.index.repositories remove https://example.com/a main
    assert_exit_code 0
    assert_not_file_contains_regex $__spec_repos '^https://example.com/a main$'
    assert_file_contains_regex $__spec_repos '^https://example.com/a main-old$'
  end

  function it_matches_the_whole_line_when_adding
    command rm -f $__spec_repos
    echo "https://example.com/a main-old" > $__spec_repos
    # `git ls-remote` on the fake URL fails, so a refusal must come from the
    # duplicate check to be wrong; success here means it got past that check.
    omf.index.repositories add https://example.com/a main 2>&1 | string match -q '*could not be found*'
    assert_exit_code 0
  end

  function it_reports_an_unknown_repository_on_remove
    command rm -f $__spec_repos
    omf.index.repositories remove https://example.com/nope main 2>/dev/null
    assert_exit_code 1
  end
end
