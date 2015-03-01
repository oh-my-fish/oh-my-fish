import plugins/fish-spec
import plugins/balias

function describe_library -d "better-alias"

  function after_all
    functions -e changedir
  end

  function it_doesnt_fail
    balias changedir cd
    expect test $status --to-be-true
  end

  function it_defines_an_alias
    functions changedir
    expect test $status --to-be-true
  end

  function you_can_use_the_alias
    mkdir testdir
    changedir testdir
    expect test $status --to-be-true
    cd ..
    rmdir testdir
  end

end

spec.run $argv