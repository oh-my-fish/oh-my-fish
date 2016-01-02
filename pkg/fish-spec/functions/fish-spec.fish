function fish-spec
  set -g __fish_spec_dir (dirname (dirname (status -f)))

  # Source formatter
  source $__fish_spec_dir/basic_formatter.fish

  # Reset internal variables
  set -e __any_spec_failed

  # Load each spec file
  for spec_file in spec/*_spec.fish
    source $spec_file
  end

  # Load helper file
  source spec/helper.fish ^/dev/null

  emit all_specs_init

  # Run all specs
  __fish-spec.run_all_specs

  emit all_specs_finished

  not set -q __any_spec_failed
end

function __fish-spec.run_all_specs
  for suite in (functions -n | grep describe_)
    __fish-spec.run_suite $suite
    functions -e $suite
  end
end

function __fish-spec.run_suite -a suite_name
  # This gets the list of specs that were defined on the test suite by
  # comparing the functions names before and after the evaluation of the test suite.
  set -l specs (begin
    functions -n | grep it_
    eval $suite_name >/dev/null
    functions -n | grep it_
  end | sort | uniq -u)

  functions -q before_all; and before_all

  for spec in $specs
    emit spec_init $spec
    functions -q before_each; and before_each
    eval $spec
    functions -q after_each; and after_each
    emit spec_finished $spec
  end

  functions -q after_all; and after_all

  functions -e before_all before_each after_each after_all
end

function __fish-spec.current_time
  if test (uname) = 'Darwin'
    set filename 'epoch.osx'
  else
    set filename 'epoch.linux'
  end

  eval $__fish_spec_dir/utils/$filename
end
