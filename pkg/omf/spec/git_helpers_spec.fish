function describe_git_helpers
  function before_all
    set -g __omf_git_test_root (mktemp -d)
    mkdir -p "$__omf_git_test_root/empty" "$__omf_git_test_root/invalid/.git"
    command git init --quiet "$__omf_git_test_root/repo"
    mkdir "$__omf_git_test_root/repo/subdir"
    command git -C "$__omf_git_test_root/repo" -c user.name=Test -c user.email=test@example.com commit --quiet --allow-empty -m initial
    command git -C "$__omf_git_test_root/repo" worktree add --quiet --detach "$__omf_git_test_root/linked"
    command git init --quiet --bare "$__omf_git_test_root/bare"
  end

  function after_all
    command rm -rf "$__omf_git_test_root"
    set -e __omf_git_test_root
    functions -e __omf_git_assert_helpers
  end

  function __omf_git_assert_helpers -a directory repo_status worktree_status
    set -l original_directory "$PWD"
    set -l output "$__omf_git_test_root/output"
    cd "$__omf_git_test_root/$directory"
    git_is_repo >"$output" 2>&1
    assert_exit_code $repo_status
    assert_file_empty "$output"
    git_is_worktree >"$output" 2>&1
    assert_exit_code $worktree_status
    assert_file_empty "$output"
    cd "$original_directory"
  end

  function it_rejects_an_ordinary_directory_quietly
    __omf_git_assert_helpers empty 1 1
  end

  function it_rejects_an_empty_git_directory_quietly
    __omf_git_assert_helpers invalid 1 1
  end

  function it_recognizes_a_repository
    __omf_git_assert_helpers repo 0 0
  end

  function it_recognizes_a_repository_subdirectory
    __omf_git_assert_helpers repo/subdir 0 0
  end

  function it_recognizes_a_linked_worktree
    __omf_git_assert_helpers linked 0 0
  end

  function it_excludes_the_git_directory_from_the_worktree
    __omf_git_assert_helpers repo/.git 0 1
  end

  function it_excludes_a_bare_repository
    __omf_git_assert_helpers bare 1 1
  end
end
