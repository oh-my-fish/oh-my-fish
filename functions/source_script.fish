# Cloned from https://github.com/fish-shell/fish-shell/issues/522

function source_script --description 'Source sh/csh file'
  set -l ext
  set -l type

  while true
    switch $argv[1]
      case '--sh'
      set type sh
      case '--csh'
      set type csh
      case '--bash'
      set type bash
      case '--ext'
      set ext 1
      case '*'
      break
    end
    set -e argv[1]
  end

  if not test "$type"
    for f in $argv
      switch $f
        case '*.sh'
        set type bash
        break
        case '*.csh' '*.tcsh'
        set type csh
        break
      end
    end
  end

  set -l exe
  set -l source

  switch "$type"
    case bash
    set exe /bin/bash
    set source .
    case sh
    set exe /bin/sh
    set source .
    case csh
    set exe /bin/tcsh
    set source source
    case '*'
    echo Unknown source type for "'$argv'"
  end

  if test "$ext"
    eval "exec $exe -c '$source $argv; exec fish'"
  else
    set -l f1 (command mktemp -t tmp.XXXXXXXXXX)
    set -l f2 (command mktemp -t tmp.XXXXXXXXXX)
    eval $exe -c "'env | sort > $f1; $source $argv; env | sort > $f2'"

    set -l filter "(^[^\+-]|^\+\+\+|^---|^[\+-]_|^[\+-]PIPESTATUS|^[\+-]COLUMNS)"
    set -l pattern 's/[:]\{0,1\}\([^:]\+\)/"\1" /g'

    set -l IFS '='
    set -l diffopts --old-line-format '-=%L' --new-line-format '+=%L' --unchanged-line-format ''
    command diff $diffopts $f1 $f2 | command grep -vE $filter | while read -l state var value
      switch $state$var
        case -PATH
        continue

        case +PATH
        eval set value (echo $value | tr : ' ')
        for pt in $value
            contains $pt $PATH; and continue
            if not test -d $pt
                echo "Unable to add '$pt' to \$PATH. Check existance."
                continue
            end
            set -gx PATH $PATH $pt >  /dev/null
        end

        case '-*'
        set -e $var

        case '+*'
        eval set -gx $var (echo $value | command sed $pattern)

        case '*'
        echo Source error! Invalid case "'$state$var'"
      end
    end

    command rm $f1 $f2 > /dev/null
  end
end
