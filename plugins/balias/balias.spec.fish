import plugins/fish-spec
import plugins/balias

function describe_library -d "balias: better-alias"

  function after_all
    functions -e changedir
    functions -e ls_as_root
  end

  function it_doesnt_fail
    balias changedir cd
    expect $status --to-equal 0
  end

  function it_defines_an_alias
    balias changedir cd
    set -l ignore_output (functions changedir)
    expect $status --to-equal 0
  end

  function you_can_use_the_alias
    mkdir testdir
    changedir testdir
    expect test $status --to-be-true
    cd ..
    rmdir testdir
  end

  function it_chops_off_sudo
    balias ls_as_root 'sudo ls'
    expect test $status --to-be-true
  end
end

spec.run $argv
