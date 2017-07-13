function __omf.packages.new.mkdir -a name
  set -l name "$argv[1]"
  if test -d "$OMF_CONFIG"
    set name "$OMF_CONFIG/$name"
  else if test -d "$OMF_PATH"
    set name "$OMF_PATH/$name"
  end
  mkdir -p "$name"
  echo $name
end

function __omf.packages.new.from_template -a path github user name
  for file in $path/*
    if test -d $file
      mkdir (basename $file)
      pushd (basename $file)
      __omf.packages.new.from_template $file $github $user $name
    else
      set -l target (begin
        if test (basename $file) = "{{NAME}}.fish"
          echo "$name.fish"
        else
          echo (basename "$file")
        end
      end)
      sed "s/{{USER_NAME}}/$user/;s/{{GITHUB_USER}}/$github/;s/{{NAME}}/$name/" \
        $file > $target
      echo (omf::em)" create "(omf::off)" "(begin
        if test (basename $PWD) = $name
          echo ""
        else
          echo (basename "$PWD")"/"
        end
      end)$target
    end
  end
  popd >/dev/null ^&1
end


function omf.packages.new -a option name
  switch $option
    case "p" "plugin"
      set option "pkg"
    case "t" "th" "the" "thm" "theme" "themes"
      set option "themes"
    case "*"
      echo (omf::err)"$option is not a valid option."(omf::off) >&2
      return $OMF_INVALID_ARG
  end

  if not omf.packages.valid_name "$name"
    echo (omf::err)"$name is not a valid package/theme name"(omf::off) >&2
    return $OMF_INVALID_ARG
  end

  if set -l dir (__omf.packages.new.mkdir "$option/$name")
    cd $dir

    set -l github (git config github.user)
    test -z "$github"; and set github "{{USER}}"

    set -l user (git config user.name)
    test -z "$user"; and set user "{{USER}}"

    __omf.packages.new.from_template "$OMF_PATH/pkg/omf/templates/$option" \
      $github $user $name

    echo (omf::em)"Switched to $dir"(omf::off)
  else
    echo (omf::err)"\$OMF_CONFIG and/or \$OMF_PATH undefined."(omf::off) >&2
    exit $OMF_UNKNOWN_ERR
  end
end
