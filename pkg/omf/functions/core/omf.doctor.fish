function __omf.doctor.theme
  if not omf.check.fish_prompt
    echo (omf::err)"Warning: "(omf::off)(omf::em)"fish_prompt.fish"(omf::off)" is overridden."
    echo (omf::em)"  fish_config"(omf::off)" command persists the prompt to "(omf::em)"~/.config/fish/functions/fish_prompt.fish"(omf::off)
    echo "  That file takes precedence over Oh My Fish's themes. Remove the file to fix it:"
    echo (omf::em)"  rm ~/.config/fish/functions/fish_prompt.fish"(omf::off)
    echo

    return 1
  end

  return 0
end

function __omf.doctor.fish_version
  set -l min_version 2.2.0
  set -l current_version
  begin
    set -l IFS '-'
    echo $FISH_VERSION | read -la version_parts
    set current_version "$version_parts[1]"
  end

  if not omf.check.version $min_version $current_version
    echo (omf::err)"Warning: "(omf::off)"Oh-My-Fish requires "(omf::em)"fish"(omf::off)" version "(omf::em)"$min_version"(omf::off)" or above"
    echo "Your fish version is "(omf::em)$FISH_VERSION(omf::off)
    echo
    return 1
  end
end

function __omf.doctor.git_version
  set -l min_version 1.9.5
  set -l current_version
  begin
    git --version | read -la version_parts
    set current_version "$version_parts[3]"
  end

  if not omf.check.version $min_version $current_version
    echo (omf::err)"Warning: "(omf::off)"Oh-My-Fish requires "(omf::em)"git"(omf::off)" version "(omf::em)"$min_version"(omf::off)" or above"
    echo "Your git version is "(omf::em)$current_version(omf::off)
    echo
    return 1
  end
end

function __omf.doctor.remote_match_db -a pkg_path
  if test -z "$pkg_path"
    # No package specified, run test for all packages

    omf.index.update

    set -l check_result 0
    for pkg_path in $OMF_PATH/{themes,pkg}/*
      __omf.doctor.remote_match_db $pkg_path
      set check_result (math $check_result + $status)
    end
    return $check_result
  end

  # Check if the package remote matches the package repository
  set -l path_parts
  begin
    set -l IFS '/'
    echo $pkg_path | read -a path_parts
  end
  set -l pkg_name $path_parts[-1]

  set -l index_uri (omf.index.stat $pkg_name repository)
    or begin
      # Built-in 'omf' and 'fish-spec' are exempt from this check
      contains -- $pkg_name omf fish-spec; and return 0

      echo (omf::err)"Warning:"(omf::off) "No index entry for "(omf::em)$pkg_name(omf::off)"."
      echo
      return 1
    end

  set -l repo_uri (omf.repo.remote_uri "$pkg_path")

  set -l db_canonical (omf.repo.uri_components $index_uri)
  set -l repo_canonical (omf.repo.uri_components $repo_uri)
  if test "$db_canonical" != "$repo_canonical"
    echo (omf::err)"Warning:"(omf::off) "The remote URI for "(omf::em)"$pkg_name"(omf::off)" doesn't match the URI in OMF's database."
    echo "Remote URI:  " $repo_uri
    echo "Index URI:" $index_uri
    echo
    return 1
  end
  return 0
end

function omf.doctor
  echo "Oh My Fish version:   "(omf.version)
  echo "OS type:              "(uname)
  echo "Fish version:         "(fish --version)
  echo "Git version:          "(git --version)
  echo "Git core.autocrlf:    "(git config core.autocrlf; or echo no)

  __omf.doctor.fish_version; or set -l doctor_failed
  __omf.doctor.git_version; or set -l doctor_failed
  __omf.doctor.theme; or set -l doctor_failed
  __omf.doctor.remote_match_db; or set -l doctor_failed

  if set -q doctor_failed
    echo "If everything you use Oh My Fish for is working fine, please don't worry and just ignore the warnings. Thanks!"
  else
    echo (omf::em)"Your shell is ready to swim."(omf::off)
  end
end
