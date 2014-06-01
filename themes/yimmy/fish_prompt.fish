function fish_prompt
  set -l last_status $status
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l white (set_color white)
  set -l gray (set_color -o cyan)
  set -l green (set_color green)
  set -l brwhite (set_color -o white)

  # Color prompt char red if something failed
  set -l pcolor $red
  if test $last_status = 0
    set pcolor $gray
  end

  # Traditional prompt chars
  set -l pchar '$'
  if test (id -u) = '0'
    set pchar = '#'
  end

  # Determine git branch
  set -l git_branch (begin
    git symbolic-ref HEAD; or \
    git rev-parse --short HEAD
  end ^/dev/null | sed -e 's|^refs/heads/||')
  
  # Line 1
  echo -n $red'┌'$cyan$USER$white'@'$cyan(hostname -s)' '$gray(prompt_pwd)$normal
  if test -n "$git_branch"
    echo -n ' '$green'('$git_branch
    set -l dirty (command git status -s --ignore-submodules=dirty ^/dev/null | tail -n1)
    if test -n "$dirty"
      echo -n $red'+'
    end
    echo -n $green')'
    # Check for gwip; does last commit log contain --wip--?
    if begin git log -n 1 ^/dev/null | grep -qc "\-\-wip\-\-"; end
      echo -n $brwhite' WIP!'$normal
    end
  end
  echo

  # Line 2
  echo -n $red'└'$pcolor$pchar' '$normal
end
