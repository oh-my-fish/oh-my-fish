# Return success for at least one successful install.
function omf.install_package 
  set -l return_code $OMF_UNKNOWN_ERR
  for search in $argv
    omf.install --pkg $search
    set -l install_code $status
    if test $install_code -eq 0
      set return_code $install_code
    end
  end
  return $return_code
end
