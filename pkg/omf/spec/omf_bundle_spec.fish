function describe_omf_bundle
  function before_all
    set -g __spec_bundle_backup (mktemp)
    command cp $OMF_CONFIG/bundle $__spec_bundle_backup
  end

  function before_each
    echo "theme default" > $OMF_CONFIG/bundle
  end

  function after_all
    command cp $__spec_bundle_backup $OMF_CONFIG/bundle
    command rm -f $__spec_bundle_backup
    set -e __spec_bundle_backup
  end

  function it_adds_a_record_once
    omf.bundle.add package bass
    omf.bundle.add package bass
    assert_equal 1 (grep -c '^package bass$' $OMF_CONFIG/bundle)
  end

  function it_adds_a_record_that_is_a_prefix_of_an_existing_one
    omf.bundle.add package bassx
    omf.bundle.add package bass
    assert_file_contains_regex $OMF_CONFIG/bundle '^package bass$'
    assert_file_contains_regex $OMF_CONFIG/bundle '^package bassx$'
  end

  function it_removes_only_the_matching_record
    omf.bundle.add package bass
    omf.bundle.add package bassx
    omf.bundle.remove package bass
    assert_not_file_contains_regex $OMF_CONFIG/bundle '^package bass$'
    assert_file_contains_regex $OMF_CONFIG/bundle '^package bassx$'
  end

  function it_keeps_an_empty_bundle_file_after_removing_the_last_record
    echo "package bass" > $OMF_CONFIG/bundle
    omf.bundle.remove package bass
    assert_file_exists $OMF_CONFIG/bundle
    assert_file_empty $OMF_CONFIG/bundle
  end
end
