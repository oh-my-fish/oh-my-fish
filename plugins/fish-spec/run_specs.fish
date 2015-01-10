function run_specs
  # Run each describe function
  for describe in (functions -n | grep describe_)
    eval $describe
  end

  # Run before all block
  functions -q before_all; and before_all

  # Run tests
  for test in (functions -n | grep it_)
    run_spec $test
  end

  # Run after all block
  functions -q after_all; and after_all
end
