<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### git-aliases
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Enables short git aliases

ga="git add"
gc="git commit -m"
gitit='git add -A && git commit -m'
gs='git status -sb'
gpo="git push origin"
gpg="git push github"
gpb="git push bitbucket"
gpa="git push gogs"
gf="git fetch"
gco="git checkout"
gcb="git checkout -b"
gbd="git branch -D" # definitely delete. no fucking around.
gbl="git branch --list"
gm="git merge"
greb="git rebase"


## Install

```fish
$ omf install git-aliases
```


## Usage

```fish
$ git-aliases
```


# License

[MIT][mit] © [{{USER}}][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[contributors]:   https://github.com/{{USER}}/plugin-git-aliases/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
