#!fish
#
# git-flow-completion
# ===================
#
# Fish completion support for [git-flow](http://github.com/nvie/gitflow)
#
# The contained completion routines provide support for completing:
#
#  * git-flow init and version
#  * feature, hotfix and release branches
#  * remote feature, hotfix and release branch names
#
#
#
# The Fine Print
# --------------
#
# Copyright (c) 2012 [Justin Hileman](http://justinhileman.com)
#
# Distributed under the [MIT License](http://creativecommons.org/licenses/MIT/)


for prefix in /usr /usr/local
  if test -f $prefix/share/fish/completions/git.fish
    . $prefix/share/fish/completions/git.fish
    break
  end
end

if not functions -q __fish_git_branches
  echo \nError: git completion not found >&2
  exit
end

## Support functions

function __fish_git_flow_using_command
  set cmd (commandline -opc)
  set subcommands 'flow' $argv
  if [ (count $cmd) = (math (count $subcommands) + 1) ]
    for i in (seq (count $subcommands))
      if not test $subcommands[$i] = $cmd[(math $i + 1)]
        return 1
      end
    end
    return 0
  end
  return 1
end

function __fish_git_flow_prefix
  git config "gitflow.prefix.$argv[1]" 2> /dev/null; or echo "$argv[1]/"
end

function __fish_git_flow_branches
  set prefix (__fish_git_flow_prefix $argv[1])
  __fish_git_branches | grep "^$prefix" | sed "s,^$prefix,," | sort
end

function __fish_git_flow_remote_branches
  set prefix (__fish_git_flow_prefix $argv[1])
  set origin (git config gitflow.origin 2> /dev/null; or echo "origin")
  git branch -r 2> /dev/null | sed "s/^ *//g" | grep "^$origin/$prefix" | sed "s,^$origin/$prefix,," | sort
end

function __fish_git_flow_untracked_branches
  set branches (__fish_git_flow_branches $argv[1])
  for branch in (__fish_git_flow_remote_branches $argv[1])
    if not contains $branch $branches
      echo $branch
    end
  end
end

function __fish_git_flow_unpublished_branches
  set branches (__fish_git_flow_remote_branches $argv[1])
  for branch in (__fish_git_flow_branches $argv[1])
    if not contains $branch $branches
      echo $branch
    end
  end
end


## git-flow

complete -f -c git -n '__fish_git_needs_command' -a flow -d 'Manage a git-flow enabled repository'
complete -f -c git -n '__fish_git_flow_using_command' -a version -d 'Show version information'



## git-flow init

complete -f -c git -n '__fish_git_flow_using_command' -a init    -d 'Initialize a new git repo with support for the branching model'
complete -f -c git -n '__fish_git_flow_using_command init' -s f  -d 'Force reinitialization'
complete -f -c git -n '__fish_git_flow_using_command init' -s d  -d 'Use default branch names'



## git-flow feature

complete -f -c git -n '__fish_git_flow_using_command' -a feature      -d 'Manage feature branches'
complete -f -c git -n '__fish_git_flow_using_command feature' -a list -d 'List feature branches'
complete -f -c git -n '__fish_git_flow_using_command feature' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command feature' -a start    -d 'Start a new feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command feature' -a finish   -d 'Finish a feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -s r -d 'Rebase instead of merging'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -a '(__fish_git_flow_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a publish  -d 'Publish a feature branch to remote'
complete -f -c git -n '__fish_git_flow_using_command feature publish' -a '(__fish_git_flow_unpublished_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a track    -d 'Checkout remote feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature track' -a '(__fish_git_flow_untracked_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a diff     -d 'Show all changes'

complete -f -c git -n '__fish_git_flow_using_command feature' -a rebase   -d 'Rebase against integration branch'
complete -f -c git -n '__fish_git_flow_using_command feature rebase' -s i -d 'Do an interactive rebase'

complete -f -c git -n '__fish_git_flow_using_command feature' -a checkout -d 'Checkout local feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature checkout' -a '(__fish_git_flow_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a pull     -d 'Pull changes from remote'
complete -f -c git -n '__fish_git_flow_using_command feature pull' -a '(__fish_git_remotes)' -d 'Remote'



## git-flow release

complete -f -c git -n '__fish_git_flow_using_command' -a release      -d 'Manage release branches'
complete -f -c git -n '__fish_git_flow_using_command release' -a list -d 'List release branches'
complete -f -c git -n '__fish_git_flow_using_command release' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command release' -a start -d 'Start a new release branch'
complete -f -c git -n '__fish_git_flow_using_command release start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command release' -a finish   -d 'Finish a release branch'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s s -d 'Sign the release tag cryptographically'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s u -d 'Use the given GPG-key for the digital signature (implies -s)'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s m -d 'Use the given tag message'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s p -d 'Push to $ORIGIN after performing finish'
complete -f -c git -n '__fish_git_flow_using_command release finish' -a '(__fish_git_flow_branches release)' -d 'Release branch'

complete -f -c git -n '__fish_git_flow_using_command release' -a publish  -d 'Publish a release branch to remote'
complete -f -c git -n '__fish_git_flow_using_command release publish' -a '(__fish_git_flow_unpublished_branches release)' -d 'Release branch'

complete -f -c git -n '__fish_git_flow_using_command release' -a track    -d 'Checkout remote release branch'
complete -f -c git -n '__fish_git_flow_using_command release track' -a '(__fish_git_flow_untracked_branches release)' -d 'Release branch'



## git-flow hotfix

complete -f -c git -n '__fish_git_flow_using_command' -a hotfix      -d 'Manage hotfix branches'
complete -f -c git -n '__fish_git_flow_using_command hotfix' -a list -d 'List hotfix branches'
complete -f -c git -n '__fish_git_flow_using_command hotfix' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command hotfix' -a start -d 'Start a new hotfix branch'
complete -f -c git -n '__fish_git_flow_using_command hotfix start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command hotfix' -a finish   -d 'Finish a hotfix branch'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s s -d 'Sign the hotfix tag cryptographically'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s u -d 'Use the given GPG-key for the digital signature (implies -s)'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s m -d 'Use the given tag message'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s p -d 'Push to $ORIGIN after performing finish'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -a '(__fish_git_flow_branches hotfix)' -d 'Hotfix branch'



## git-flow support

complete -f -c git -n '__fish_git_flow_using_command' -a support      -d 'Manage support branches'
complete -f -c git -n '__fish_git_flow_using_command support' -a list -d 'List support branches'
complete -f -c git -n '__fish_git_flow_using_command support' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command support' -a start -d 'Start a new support branch'
complete -f -c git -n '__fish_git_flow_using_command support start' -s F  -d 'Fetch from origin first'
