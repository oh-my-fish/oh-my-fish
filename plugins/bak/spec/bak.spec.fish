import plugins/bak
import plugins/fish-spec

function describe_bak_plugin
  function before_all
    set -g test_dir /tmp/bak_test
    mkdir -p $test_dir
    pushd
    cd $test_dir
    rm -rf $test_dir/*
  end

  function after_each
    rm -rf $test_dir/*
  end

  function after_all
    popd
  end

  function it_checks_if_bak_filename_pattern_is_followed
    expect __is_bak '.ccnet.20140817_234302.bak' --to-be-true
    expect __is_bak 'file\ with\ spaces.20140817_234302.bak' --to-be-true
    expect __is_bak '.ccnet.bak' --to-be-false
  end

  function it_normalizes_the_file_name
    expect (__bak_normalized '.ccnet.20140817_234302.bak') --to-equal '.ccnet'
    expect (__bak_normalized 'file with spaces.20140817_234302.bak') --to-equal 'file with spaces'
  end

  function it_moves_a_single_file
    touch a
    mvbak a
    expect __is_bak (ls) --to-be-true
  end

  function it_moves_multiple_files
    touch a b
    mvbak a b

    for f in (ls)
      expect __is_bak $f --to-be-true
    end
  end

  function it_undo_moves_of_a_single_file
    touch a
    mvbak a
    unmvbak (ls)

    expect (ls) --to-equal a
  end

  function it_undo_moves_of_multiple_files
    set files (seq 4)
    touch $files
    mvbak $files
    unmvbak (ls)

    expect (ls) --to-equal "$files"
  end

  function it_copies_a_single_file
    touch a
    cpbak a

    expect (ls -p) --to-contain-all (echo 'a'\n(__bak_name a))
  end

  function it_copies_multiple_files
    set files (seq 4)
    touch $files
    cpbak $files

    for f in $files
      set files_bak $files_bak (__bak_name $f)
    end

    expect (ls) --to-contain-all $files $file_bak
  end

  function it_undo_copies_of_a_single_file
    touch a
    cpbak a
    set -l bak_filename (__bak_name a)

    rm a
    uncpbak (ls)

    expect (ls) --to-contain-all (echo 'a'\n$bak_filename)
  end

  function it_undo_copies_of_multiple_files
    set files (seq 4)
    touch $files
    mvbak $files
    unmvbak (ls)

    expect (ls) --to-equal "$files"
  end

  function it_undo_copies_of_a_directory
    mkdir a
    cpbak a/
    rmdir a
    uncpbak (ls -p)

    expect (ls -p) --to-contain-all (echo 'a/'\n(__bak_name a)'/')
  end
end

spec.run $argv
