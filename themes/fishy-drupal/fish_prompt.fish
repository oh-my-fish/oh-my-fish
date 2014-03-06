# name: fishy-drupal
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _drush_alias_name
  set -l pid %self
  if test -f "$TMPDIR/drush-env/drush-drupal-site-$pid"
    echo (command cat $TMPDIR/drush-env/drush-drupal-site-$pid)
  end
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$blue➜ "
  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_dirty "$dirty"
    end
  end

  if [ (_drush_alias_name) ]
    set -l drush_alias $blue(_drush_alias_name)
    set drush_info "$green drush:($drush_alias$green)"
  end

  echo -n -s $arrow $cwd $git_info $drush_info $git_dirty $normal ' '
end
