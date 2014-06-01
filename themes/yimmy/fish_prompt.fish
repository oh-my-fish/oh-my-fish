function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char '>'
    end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l white (set_color white)
  set -l gray (set_color -o cyan)
  set -l brwhite (set_color -o white)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_color green
  set -g __fish_git_prompt_color_flags red

  # Color prompt char red for non-zero exit status
  set -l pcolor $gray
  if test $last_status -ne 0
    set pcolor $red
  end

  # Line 1
  echo -n $red'┌'$cyan$USER$white'@'$cyan$__fish_prompt_hostname $gray(prompt_pwd)$normal
  __fish_git_prompt
  # Check for gwip; does last commit log contain --wip--?
  if begin git log -n 1 ^/dev/null | grep -qc "\-\-wip\-\-"; end
    echo -n $brwhite' WIP!'$normal
  end
  echo

  # Line 2
  echo -n $red'└'$pcolor$__fish_prompt_char $normal
end
