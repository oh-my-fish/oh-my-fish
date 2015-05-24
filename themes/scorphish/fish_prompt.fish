# name: scorphish

function _prompt_rubies -a sep_color -a ruby_color -d 'Display current Ruby (rvm/rbenv)'
  [ "$theme_display_ruby" = 'no' ]; and return
  set -l ruby_version
  if type rvm-prompt >/dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type rbenv >/dev/null 2>&1
    set ruby_version (rbenv version-name)
    # Don't show global ruby version...
    [ "$ruby_version" = (rbenv global) ]; and return
  end
  [ -z "$ruby_version" ]; and return

  echo -n -s $sep_color '|' $ruby_color $ruby_version
end

function _prompt_virtualfish -a sep_color -a venv_color -d "Display activated virtual environment (only for virtualfish, virtualenv's activate.fish changes prompt by itself)"
  [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" ]; and return
  echo -n -s $sep_color '|' $venv_color (basename "$VIRTUAL_ENV")
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_ahead_count -a remote -a branch_name
  echo (command git log $remote/$branch_name..HEAD ^/dev/null | \
    grep '^commit' | wc -l | tr -d ' ')
end

function _git_dirty_remotes -a remote_color -a ahead_color
  set current_branch (command git rev-parse --abbrev-ref HEAD ^/dev/null)
  set current_ref (command git rev-parse HEAD ^/dev/null)

  for remote in (git remote)

    set -l git_ahead_count (_git_ahead_count $remote $current_branch)

    set remote_branch "refs/remotes/$remote/$current_branch"
    set remote_ref (git for-each-ref --format='%(objectname)' $remote_branch)
    if test "$remote_ref" != ''
      if test "$remote_ref" != $current_ref
        echo -n "$remote_color!"
        if [ $git_ahead_count != 0 ]
          echo -n "$ahead_color+$git_ahead_count$normal"
        end
      end
    end
  end
end

function fish_prompt
  set -l exit_code $status

  set -l gray (set_color 666)
  set -l cyan (set_color cyan)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color ffcc00)
  set -l orange (set_color ffb300)
  set -l green (set_color green)
  set -l pink (set_color ff99ff)
  set -l dark_pink (set_color cc99ff)

  set_color -o 666
  printf '['
  set_color -o blue
  printf '%s' (prompt_pwd)

  _prompt_rubies $gray $red

  _prompt_virtualfish $gray $green

  set_color -o 666
  if set -q SCORPHISH_GIT_INFO_ON_FIRST_LINE
    printf ']'
  else
    printf ']\n'
  end

  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    set dirty_remotes (_git_dirty_remotes $red $orange)

    if [ (_is_git_dirty) ]
      echo -n -s $gray '‹' $yellow $git_branch $red '*' $dirty_remotes $gray '›' $normal
    else
      echo -n -s $gray '‹' $yellow $git_branch $red $dirty_remotes $gray '›' $normal
    end
  end

  if test $exit_code -ne 0
    set arrow_colors 600 900 c00 f00
  else
    set arrow_colors 060 090 0c0 0f0
  end

  if set -q SCORPHISH_GIT_INFO_ON_FIRST_LINE
    printf '\n'
  else
    printf ' '
  end

  for arrow_color in $arrow_colors
    set_color $arrow_color
    printf '»'
  end

  printf ' '

  set_color normal
end
