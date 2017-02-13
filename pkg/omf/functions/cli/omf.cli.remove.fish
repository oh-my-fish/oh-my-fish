function omf.cli.remove -a name
  switch (count $argv)
  case 1
    omf.packages.remove $name
    set code $status

    switch $code
    case 0
      echo (omf::em)"$name successfully removed."(omf::off)
      # Opt-in flag for testing
      set -q OMF_AUTO_RELOAD
        and omf.reload
    case 1
      echo (omf::err)"$name could not be removed."(omf::off) >&2
    case 2
      echo (omf::err)"$name could not be found."(omf::off) >&2
    end

    return $code

  case '*'
    echo (omf::err)"Invalid number of arguments"(omf::off) >&2
    echo "Usage: omf remove "(omf::em)"<name>"(omf::off) >&2
    return $OMF_INVALID_ARG
  end
end
