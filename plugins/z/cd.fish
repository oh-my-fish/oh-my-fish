#
# Source a .rvmrc file in a directory after changing to it, if it exists.
# To disable this feature, set rvm_project_rvmrc=0 in $HOME/.rvmrc
#
function cd --description "Change directory"
  redefine_function 'cd' "$__fish_datadir/functions/cd.fish" '
    function cd --description "Change working directory"
      old_cd "$argv"

      bash -c "source /usr/local/etc/profile.d/z.sh; _z --add `pwd -P`"
    end
'

  cd "$argv"
end
