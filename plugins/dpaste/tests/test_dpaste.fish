#!/usr/bin/env fish

set -l script_dir (dirname (status -f))

function suite_dpaste
  function setup
    set -g __dpaste_expires_choises
    source $script_dir/../dpaste.fish
    __dpaste_set_defaults
  end

  function test_dpaste_parse_expires
    assert_equal text (__dpaste_parse_expires text)
    assert_equal "https://dpaste.de/api/?format=url" $__dpaste_send_url
    set -g __dpaste_send_url $dpaste_url
    assert_equal text (__dpaste_parse_expires -t never text)
    assert_equal "https://dpaste.de/api/?format=url&expires=never" $__dpaste_send_url
    set -g __dpaste_send_url $dpaste_url
    assert_equal text (__dpaste_parse_expires -t hour text)
    assert_equal "https://dpaste.de/api/?format=url&expires=3600" $__dpaste_send_url
    set -g __dpaste_send_url $dpaste_url
  end
end

if not set -q tank_running
  source $script_dir/helper.fish
  tank_run
end
