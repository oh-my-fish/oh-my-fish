function __omf.packages.sort
  for package in (echo $argv | tr ' ' '\n' | sort); echo $package; end
end

function __omf.packages.builtin
  echo "omf"
end

function __omf.packages.list -a type
  set -l list

  test "$type" = "--theme"; or for package in (basename -a {$OMF_CONFIG,$OMF_PATH/db}/pkg/*)
    contains $package (__omf.packages.builtin); or set list $list $package
  end

  test "$type" = "--plugin"; or for package in (basename -a {$OMF_CONFIG,$OMF_PATH/db}/themes/*)
    set list $list $package
  end

  __omf.packages.sort $list
end

function __omf.packages.list.available -a type
  set -l list

  test "$type" = "--theme"; or for package in (basename -a $OMF_PATH/db/pkg/*)
    contains $package (basename -a {$OMF_CONFIG,$OMF_PATH}/pkg/*); or set list $list $package
  end

  test "$type" = "--plugin"; or for package in (basename -a $OMF_PATH/db/themes/*)
    contains $package (basename -a {$OMF_CONFIG,$OMF_PATH}/themes/*); or set list $list $package
  end

  __omf.packages.sort $list
end

function __omf.packages.list.database -a type
  set -l list

  test "$type" = "--theme"; or for package in (basename -a $OMF_PATH/db/pkg/*)
    set list $list $package
  end

  test "$type" = "--plugin"; or for package in (basename -a $OMF_PATH/db/themes/*)
    set list $list $package
  end

  __omf.packages.sort $list
end

function __omf.packages.list.installed -a type
  set -l list

  test "$type" = "--theme"; or for package in (basename -a {$OMF_CONFIG,$OMF_PATH}/pkg/*)
    contains $package (__omf.packages.builtin); or set list $list $package
  end

  test "$type" = "--plugin"; or for package in (basename -a {$OMF_CONFIG,$OMF_PATH}/themes/* 2>/dev/null)
    set list $list $package
  end

  __omf.packages.sort $list
end

function omf.packages.list -a option type
  switch "$option"
  case "--available"
    __omf.packages.list.available $type
  case "--database"
    __omf.packages.list.database $type
  case "--installed"
    __omf.packages.list.installed $type
  case "*"
    __omf.packages.list $type
  end
end
