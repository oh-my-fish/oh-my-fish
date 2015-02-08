import plugins/fish-spec
import plugins/tiny

function describe_tiny -d "tiny (git.io ULR shortener)"
  function it_generates_a_short_url
    expect (tiny -u facebook -r react | cut -d/ -f3) --to-equal git.io
  end

  function it_prints_usage_if_there_is_no_input
    expect (tiny | grep USAGE) --to-equal "  USAGE"
  end

  function it_returns_1_if_gitio_fails
    tiny https://notgithub.com/bad/url
    expect $status --to-equal 1
  end

  function it_returns_2_if_there_is_an_invalid_option
    set -l ignore_output (tiny --wrong-option)
    expect $status --to-equal 2
  end

  function it_returns_2_if_there_is_no_user_or_repo_specified
    set -l ignore_output (tiny)
    expect $status --to-equal 2
  end

  function it_prints_usage_if_there_is_an_invalid_option
    expect (tiny -x | grep USAGE) --to-equal "  USAGE"
  end

  function it_prints_help_if_no_global_user_is_configured
    set github_user_copy (git config --local github.user)

    git config --local github.user ""
    expect (tiny --repo whos-repo | head -c7) --to-equal "Specify"
    expect $status --to-equal 2

    git config --local github.user "$github_user_copy"
  end
end

spec.run $argv
