#!/usr/bin/env fish
# vim: ai ts=2 sw=2 et sts=2


function echo_text
  set -g __test_text 'Hello, tests! I am just testing suite for oh-my-fish plugin: https://github.com/bpinto/oh-my-fish/pull/170'
  echo -e $__test_text 
end

function curl
  command curl --silent $argv
end

function curl_and_check
  assert_equal $argv[2..-1] (curl $argv[1])
end

function curl_and_fail
  assert_match '.*404 Not found.*' (curl $argv[1])
end

function test_dpaste_system
  set url (eval $argv[1])/raw
  curl_and_check $url (echo_text)
  # now it shouldn't be available
  curl_and_fail $url
end

function dpaste_setup
  set -g test_dir /tmp/dpaste_test
  set -g test_file $test_dir/file
  mkdir -p $test_dir
  pushd
  cd $test_dir
  echo_text > $test_file
end

function dpaste_teardown
  rm -rf $test_dir
  popd
end

function suite_dpaste

  function setup
    set dpaste_site 'dpaste.de'
    __dpaste_set_defaults
  end

  function test_dpaste_parse_expires
    assert_equal text (__dpaste_parse_expires text)
    assert_equal "https://dpaste.de/api/?format=url" $__dpaste_send_url
  end

  function test_dpaste_parse_expires_1
    assert_equal text (__dpaste_parse_expires -t 1 text)
    assert_equal "https://dpaste.de/api/?format=url&expires=onetime" $__dpaste_send_url
  end

  function test_dpaste_parse_expires_hour
    assert_equal text (__dpaste_parse_expires -t hour text)
    assert_equal "https://dpaste.de/api/?format=url&expires=3600" $__dpaste_send_url
  end

  function test_dpaste_parse_expires_never
    assert_equal text (__dpaste_parse_expires -t never text)
    assert_equal "https://dpaste.de/api/?format=url&expires=never" $__dpaste_send_url
  end

  function test_dpaste_system_file_redirect
    function dpaste_file_redirect
      dpaste -t onetime < /tmp/dpaste_test/file
    end
    test_dpaste_system dpaste_file_redirect
  end

  function test_dpaste_system_file
    function dpaste_file
      dpaste -t onetime /tmp/dpaste_test/file
    end
    test_dpaste_system dpaste_file
  end

  function test_dpaste_system_stdin
    function dpaste_stdin
      echo_text | dpaste -t onetime
    end
    test_dpaste_system dpaste_stdin
  end

  function test_dpaste_system_text
    function dpaste_text
      dpaste -t onetime "$__test_text"
    end
    test_dpaste_system dpaste_text
  end

end


if not set -q tank_running
  source (dirname (status -f))/helper.fish
  set -g __dpaste_expires_choises
  source (dirname (status -f))/../dpaste.fish

  dpaste_setup
  tank_run
  dpaste_teardown
end
