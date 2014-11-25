#!/usr/bin/env fish


function suite_bak
  function setup
    return 0
  end

  function teardown
    rm -rf $test_dir/*
  end

  function test_is_bak
    assert (__is_bak '.ccnet.20140817_234302.bak')
    assert (__is_bak 'file with spaces.20140817_234302.bak')
    assert (not __is_bak '.ccnet.bak')
  end

  function test_normalized
    assert_equal '.ccnet' (__bak_normalized '.ccnet.20140817_234302.bak')
    assert_equal 'file with spaces' (__bak_normalized 'file with spaces.20140817_234302.bak')
  end
  
  function test_mv_single
    touch a
    mvbak a
    assert __is_bak (ls)
  end

  function test_mv_multiple
    touch a b
    mvbak a b
    for f in (ls)
      assert __is_bak $f
    end
  end

  function test_unmv_single
    touch a
    mvbak a
    unmvbak (ls)
    assert_equal a (ls)
  end

  function test_unmv_multiple
    set files (seq 4)
    touch $files
    mvbak $files
    unmvbak (ls)
    assert_equal "$files" (ls)
  end

  function test_cp_single
    touch a
    cpbak a
    assert_equal (echo -e 'a' (__bak_name a) | sort) (ls | sort)
  end

  function test_cp_multiple
    set files (seq 4)
    touch $files
    cpbak $files
    for f in $files
      set files_bak "$files_bak\n"(__bak_name $f) 
    end
    set expected (begin; echo $files | sed 's/ /\n/g'; echo -e $files_bak; end | sort | grep -v '^$')
    assert_equal "$expected" (ls | sort)
  end

  function test_uncp_single
    touch a
    cpbak a
    rm a
    uncpbak (ls)
    assert_equal (echo -e 'a' (__bak_name a) | sort) (ls | sort)
  end

  function test_uncp_dir_single
    mkdir a
    cpbak a/
    rmdir a
    uncpbak (ls -p)
    assert_equal (echo -e 'a/' (__bak_name a)'/' | sort) (ls -p | sort)
  end

  function test_cp_multiple
    set files (seq 4)
    touch $files
    cpbak $files
    rm $files
    uncpbak (ls)
    for f in $files
      set files_bak "$files_bak\n"(__bak_name $f) 
    end
    set expected (begin; echo $files | sed 's/ /\n/g'; echo -e $files_bak; end | sort | grep -v '^$')
  end
end

if not set -q tank_running
  source (dirname (status -f))/helper.fish

  set -g test_dir /tmp/bak_test
  mkdir -p $test_dir
  pushd
  cd $test_dir

  tank_run

  popd
end
