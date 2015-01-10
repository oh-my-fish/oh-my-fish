function run_specs
  # Run each describe function
  for describe in (functions -n | grep describe_)
    eval $describe
  end

  # Run before all block
  eval "before_all"

  # Run tests
  for test in (functions -n | grep it_)
    run_spec $test
  end

  # Run after all block
  eval "after_all"
end
