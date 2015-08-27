function omf.new_from_template -a path github user name
  for file in $path/*
    if test -d $file
      mkdir (basename $file)
      pushd (basename $file)
      omf.new_from_template $file $github $user $name
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
  popd >/dev/null ^&2
end
