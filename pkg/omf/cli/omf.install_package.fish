function omf.install_package -d "Return success for at least one successful install."
  set -l return_code 1
  for search in $argv
    omf.install --pkg $search
    set -l code $status
    if test $code -eq 0
      set return_code $code
    end
  end
  return $return_code
end
