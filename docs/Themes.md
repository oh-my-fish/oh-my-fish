# Available themes

<!-- ATTENTION: This file is auto-generated! Changes will be lost! -->

<details>
<summary><big><strong>Expand for a table of themes</strong></big></summary>
<table><tr><td>
  <a href="#agnoster">agnoster</a><br/>
  <a href="#aight">aight</a><br/>
  <a href="#ays">ays</a><br/>
  <a href="#barracuda">barracuda</a><br/>
  <a href="#batman">batman</a><br/>
  <a href="#beloglazov">beloglazov</a><br/>
  <a href="#bira">bira</a><br/>
  <a href="#bobthefish">bobthefish</a><br/>
  <a href="#bongnoster">bongnoster</a><br/>
  <a href="#boxfish">boxfish</a><br/>
  <a href="#budspencer">budspencer</a><br/>
  <a href="#cbjohnson">cbjohnson</a><br/>
  <a href="#chain">chain</a><br/>
  <a href="#clearance">clearance</a><br/>
</td><td>
  <a href="#cmorrell">cmorrell</a><br/>
  <a href="#coffeeandcode">coffeeandcode</a><br/>
  <a href="#cor">cor</a><br/>
  <a href="#cyan">cyan</a><br/>
  <a href="#dangerous">dangerous</a><br/>
  <a href="#default">default</a><br/>
  <a href="#dmorrell">dmorrell</a><br/>
  <a href="#doughsay">doughsay</a><br/>
  <a href="#eclm">eclm</a><br/>
  <a href="#edan">edan</a><br/>
  <a href="#eden">eden</a><br/>
  <a href="#emoji-powerline">emoji-powerline</a><br/>
  <a href="#es">es</a><br/>
  <a href="#fishbone">fishbone</a><br/>
</td><td>
  <a href="#fishface">fishface</a><br/>
  <a href="#fishy-drupal">fishy-drupal</a><br/>
  <a href="#fisk">fisk</a><br/>
  <a href="#flash">flash</a><br/>
  <a href="#fox">fox</a><br/>
  <a href="#gentoo">gentoo</a><br/>
  <a href="#gianu">gianu</a><br/>
  <a href="#gitstatus">gitstatus</a><br/>
  <a href="#gnuykeaj">gnuykeaj</a><br/>
  <a href="#godfather">godfather</a><br/>
  <a href="#graystatus">graystatus</a><br/>
  <a href="#harleen">harleen</a><br/>
  <a href="#idan">idan</a><br/>
  <a href="#integral">integral</a><br/>
</td><td>
  <a href="#jacaetevha">jacaetevha</a><br/>
  <a href="#johanson">johanson</a><br/>
  <a href="#kawasaki">kawasaki</a><br/>
  <a href="#krisleech">krisleech</a><br/>
  <a href="#l">l</a><br/>
  <a href="#lambda">lambda</a><br/>
  <a href="#lavender">lavender</a><br/>
  <a href="#lolfish">lolfish</a><br/>
  <a href="#mars">mars</a><br/>
  <a href="#mish">mish</a><br/>
  <a href="#mokou">mokou</a><br/>
  <a href="#mtahmed">mtahmed</a><br/>
  <a href="#nai">nai</a><br/>
  <a href="#nelsonjchen">nelsonjchen</a><br/>
</td><td>
  <a href="#neolambda">neolambda</a><br/>
  <a href="#numist">numist</a><br/>
  <a href="#ocean">ocean</a><br/>
  <a href="#one">one</a><br/>
  <a href="#pastfish">pastfish</a><br/>
  <a href="#perryh">perryh</a><br/>
  <a href="#pie">pie</a><br/>
  <a href="#plain">plain</a><br/>
  <a href="#pure">pure</a><br/>
  <a href="#pygmalion">pygmalion</a><br/>
  <a href="#random">random</a><br/>
  <a href="#randomrussel">randomrussel</a><br/>
  <a href="#red-snapper">red-snapper</a><br/>
  <a href="#redfish">redfish</a><br/>
</td><td>
  <a href="#rider">rider</a><br/>
  <a href="#robbyrussell">robbyrussell</a><br/>
  <a href="#sashimi">sashimi</a><br/>
  <a href="#scorphish">scorphish</a><br/>
  <a href="#shellder">shellder</a><br/>
  <a href="#simple-ass-prompt">simple-ass-prompt</a><br/>
  <a href="#simplevi">simplevi</a><br/>
  <a href="#slacker">slacker</a><br/>
  <a href="#slavic-cat">slavic-cat</a><br/>
  <a href="#solarfish">solarfish</a><br/>
  <a href="#spacefish">spacefish</a><br/>
  <a href="#sushi">sushi</a><br/>
  <a href="#syl20bnr">syl20bnr</a><br/>
  <a href="#taktoa">taktoa</a><br/>
</td><td>
  <a href="#technopagan">technopagan</a><br/>
  <a href="#toaster">toaster</a><br/>
  <a href="#tomita">tomita</a><br/>
  <a href="#trout">trout</a><br/>
  <a href="#tweetjay">tweetjay</a><br/>
  <a href="#uggedal">uggedal</a><br/>
  <a href="#will">will</a><br/>
  <a href="#wolf-theme">wolf-theme</a><br/>
  <a href="#yimmy">yimmy</a><br/>
  <a href="#zeit">zeit</a><br/>
  <a href="#zephyr">zephyr</a><br/>
  <a href="#zish">zish</a><br/>
  <br/>
  <br/>
</td></tr></table>
</details>

***

# [agnoster](https://github.com/oh-my-fish/theme-agnoster)
#### agnoster

A fish theme optimized for people who use:

* Solarized
* Git
* Mercurial (requires 'hg prompt')
* SVN
* Unicode-compatible fonts and terminals (Use a Powerline patched font, e.g., from here: https://github.com/powerline/fonts)
* Fish Vi-mode

For Mac users, I highly recommend iTerm 2 + Solarized Dark

![agnoster theme](https://f.cloud.github.com/assets/1765209/255379/452c668e-8c0b-11e2-8a8e-d1d13e57d15f.png)


###### Characteristics

* If the previous command failed (✘)
- If private mode is enabled (🔒)
* User @ Hostname (if user is not DEFAULT_USER, which can be set in your profile)
* Git/HG status
* Subversion status enabled by adding `set -g theme_svn_prompt_enabled yes` to your `config.fish`.
* Branch () or detached head (➦)
* Current branch / SHA1 in detached head state
* Dirty working directory (±, color change)
  * By default, git repos will show as dirty if there are untracked files. This can be changed by adding `set -g fish_git_prompt_untracked_files no` to your `config.fish`. This value is passed into `git status --untracked-files`, so any value git supports is valid for this command
* Current working directory
* Elevated (root) privileges (⚡)
* Current virtual environment (Python virtualenv and Nix Shell)
You will probably want to disable the default virtualenv prompt. Add to your [`init.fish`](https://github.com/oh-my-fish/oh-my-fish#dotfiles):
`set -gx VIRTUAL_ENV_DISABLE_PROMPT 1`
* Indicate vi mode.
* Source control blacklist. To disable source control prompts in certain directories, you can add the following to your `init.fish` or `config.fish`: `set -g scm_prompt_blacklist "/path/to/blacklist"`.

Ported from https://gist.github.com/agnoster/3712874.


# [aight](https://github.com/abingham/aight-fish-theme)
### Aight

A theme for fish that puts most stuff on the right.

#### Installation

```fish
omf update
omf install aight
```

#### Features

* Stuff goes on the right, out of your way.

#### Contributing

Just fork and make PRs.

### License

[MIT](https://opensource.org/licenses/MIT) © Austin Bingham 2017


# [ays](https://github.com/aollio/ays-fish-theme)
##### Ays

Theme imported from oh-my-zsh [ys-theme](http://blog.ysmood.org/my-ys-terminal-theme/)

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<br/>

###### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/aollio/ays-fish-theme/master/screenshot.png">
</p>


###### Install

####### [Oh-My-Fish]

```fish
omf install ays
```

[Oh-My-Fish]: https://github.com/oh-my-fish/oh-my-fish


# [barracuda](https://github.com/meverss/barracuda)
### Barracuda theme (for fish in Termux terminal)

This theme is a fork of [oh-my-fish/theme-budspencer](https://github.com/oh-my-fish/theme-budspencer), which means it keeps almost all it's awesome features.

Some fancy visual changes has been done taking advantage of Powerline Symbols.

Barracuda is in essence:

> A theme for nerds, makes fish even more powerful. It's equipped with a hell of a
lot of nice functions and key bindings to speed up your workflow

![screenshot](https://raw.githubusercontent.com/meverss/barracuda/master/images/screenshot.jpg)

#### Requirements

* An up-to-date fish shell version from [github][fish-git] or a
[nightly build][fish-nightly].
* Patched Powerline fonts installed. \(See how to install [here](https://github.com/powerline/fonts))

Non standard tools:

* APK Termux:API plug-in \(It's recommended to download **Termux** and **Termux:API** from [F-Droid](https://f-droid.org) as both apps most have the same PGP signature\) 
<details>
<summary>termux-api</summary>

```fish
apt install termux-api
```
</details>
<details>
<summary>nodejs</summary>

```fish
apt install nodejs
``` 
</details>
<details>
<summary>pv</summary>

```fish
apt install pv
``` 
</details>

#### Configuration

##### General configuration

The theme behaves similar to vim's airline/powerline plugins. Thus, it needs a
[powerline font][THEMES-NAMESPACE-barracuda-font].
It's also crucial to have vi mode enabled. Thus, execute
```
set -U fish_key_bindings fish_vi_key_bindings
```
before enabling the theme.

##### Languages

This theme can be shown in different languages (three langiages so far): Spanish, English and French

There are two ways to change interface language: one is by using the function `termux-language` followed by the language identifier, and
the other one, just typing the language name on the prompt.

Supported languages and their identifiers are:

* **sp** for **spanish**
* **en** for **english**
* **fr** for **french**

e.g To set french language:
```
termux-language fr
```

Or
```
french
```

##### Colors

Two color schemes for bright and dark environments are predefined. You can
enable them with `day` and `night`, respectively.

##### Command history
Commands that shouldn't appear in the command history are defined by a universal
list `$barracuda_nocmdhist`. Default:
```
set -U barracuda_nocmdhist c d ll ls m s
```

##### Disable/reenable greeting

Disable:
```
set -U barracuda_nogreeting
```

Reenable:
```
set -e barracuda_nogreeting
```

##### Show Node version

To show your current node version, do following in your Fish configs

Enable:
```
set -g barracuda_alt_environment "node -v"
```

Disable:
```
set -U barracuda_alt_environment
```

#### Outer prompt segments

- Vi mode is indicated by color of outer segments, cursor color also changes
  if terminal supports it:
    * green: NORMAL mode
    * yellow: INSERT mode
    * blue: VISUAL mode

#### Left prompt segments

- Present working directory (on top)
- Prompt line number
- Barracuda ASCII logo
- Git repository information
- Status symbols
    * ✻: keep track of this shell session, can be toggled with `#` to show the number of
       the session within the sessions list
    * ⭐: present working directory is in bookmark list, can be toggled with `#` to
        show the number of the bookmark
    * V: vi is parent process
    * R: [ranger][THEMES-NAMESPACE-barracuda-ranger] is parent process
    * ⬜: there are background jobs, can be toggled with `#` to show the amount of
        background jobs
    * 🔒: no write permissions in present working directory
    * ⚔: there are tasks scheduled for this week, can be toggled with `#` to
        show the amount of weekly tasks
    * ⚑: there are appointments for today, can be toggled with `#` to
        show the amount of appointments
    * ✔: last command succeeded, can be toggled with `#` to show the status value
    * ✘: last command failed, can be toggled with `#` to show the status value
    * ⚡: superuser indicator
- Active Python [virtual environment](https://virtualenv.pypa.io/en/latest/). Requires [Virtual Fish](https://github.com/adambrenecki/virtualfish/)

#### Right prompt segments

- Shows current interface language

#### Quickly navigate in history of working directories

The function `d` drops down a menu showing the history as enumerated list. Unlike
fish's builtin `dirh`, `d` does not show any duplicates. Enter a number to jump
to a directory within the list.

The following shortcuts need vi-mode:
- Press `H` in NORMAL mode to change present working directory to previous
  working directory in history.
- Press `L` in NORMAL mode to change present working directory to next working
  directory in history.

#### Quickly navigate in command history

The function `c` drops down a menu showing the command history as enumerated list similarly to
the `d` function. Selections are also pasted into the X clipboard. It's possible
to load a command of a former prompt by giving the prompt line number as
argument.

#### Bookmarks

A bookmark can be created with `mark`. It can be removed with `unmark`. 

`unmark` can take an argument to remove a specific bookmark in the bookmark list. 
Simply add the number of the bookmark you would like to remove as the argument.

Bookmarks are universal and thus persistant.
A new shell automatically changes working directory on startup to newest bookmark.
`m` is a function that drops down a menu showing the bookmarks as enumerated list
equivalently to `d`.

The following shortcuts need vi mode:
- Create a bookmark for present working directory with `m` in NORMAL mode.
- Remove a bookmark for present working directory with `M` in NORMAL mode.

By default the shell will change to the directory of the latest bookmark on a new session. 
This can be disabled by adding the following line:

```
set -U barracuda_no_cd_bookmark
```

#### Edit commandline with your favorite editor

The function `edit-commandline` let you edit the commandline with your editor.
It makes the commandline as powerful as your editor. If `$EDITOR` is not set,
vi is used.

The following shortcut needs vi mode:
- Type `.` in NORMAL mode to edit commandline in editor.

#### Sessions

Shell session can be stored with `s <session name>`. If a session with `session
name` already exists, the session with this name will be attached. If a session with
`session name` is already active within another terminal, this terminal will be
focussed.

A list of available sessions can be shown with `s`.

A session can be erased with `s -e <session name>`.

Type `s -d` to detach current session.

#### Set window title

Just type `wt <title>`.

#### Ring the bell in order to set the urgency hint flag

If you have configured your terminal application to use the visual bell, your
window manager will tell you when a job running in your shell has finished. You
don't need to check manually whether it's done.

If you have still activated the acoustic bell, you probably hate that feature.
Switch it off in that case:
```
set -U barracuda_nobell
```
#### Termux Backup

With this function it's possible to perdorm a full backup of system and user's files.

To create a new backup type:
```
termux-backup -c <or> --create [file_name]
```

To list existing backups use:
```
termux-backup -l <or> --list
```
![screenshot](https://raw.githubusercontent.com/meverss/barracuda/master/images/screenshot_l.jpg)

To delete an existing backup:
```
termux-backup -d <or> --delete
```
![screenshot](https://raw.githubusercontent.com/meverss/barracuda/master/images/screenshot_d.jpg)
To show help:
```
termux-backup -h <or> --help
```

Unfortunately this function can only perform backups. Restores have to be decompressed and copied manually.

<details>
<summary>TODO</summary>

* Add option to restore backups
* Add support for more languages
</details>

[THEMES-NAMESPACE-barracuda-font]: https://github.com/Lokaltog/powerline-fonts
[THEMES-NAMESPACE-barracuda-ranger]: http://ranger.nongnu.org/
[THEMES-NAMESPACE-barracuda-remind]: http://www.roaringpenguin.com/products/remind
[fish-git]: https://github.com/fish-shell/fish-shell.git
[fish-nightly]: https://github.com/fish-shell/fish-shell/wiki/Nightly-builds
[THEMES-NAMESPACE-barracuda-screenshot]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer.jpg
[THEMES-NAMESPACE-barracuda-colors]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer_replace_colors.jpg
[THEMES-NAMESPACE-barracuda-pwdstyle]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer_pwd_style.jpg


# [batman](https://github.com/oh-my-fish/theme-batman)
<img src="https://dl.dropboxusercontent.com/u/56336/omf/omf-logo-optimised.svg" align="left" width="144px" height="144px"/>

###### Batman
> A [Oh My Fish][omf-link] theme inspired by Batman.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

#### Features

_From left to right:_

+ `$HOME` directory abbreviated to `^^`
+ Path to current working directory is abbreviated.
+ Arrow symbol `>>>` becomes red if last `$status` was `!= 0`
+ Display exit status for non zero codes (Not shown in the picture)
+ `^` character denotes the current repository has [_stashed_](https://git-scm.com/book/no-nb/v1/Git-Tools-Stashing) changes.
+ `*` character denotes the current repository is dirty.
+ Display current branch.
+ Display number of commits in relation to the current branch.
+ Display current time.
+ _Batman_ inspired colors.

#### Screenshot

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/8317250/7788702/8ae84014-0281-11e5-9082-f528002e45ed.png">
</p>

### License

[MIT][mit] © [Jorge Bucaran][author] et [al][THEMES-NAMESPACE-batman-contributors]

> __Disclaimer:__ This work is not intended to infringe on any rights by and of the companies and/or individuals involved in the production of any series mentioned here. I don't own Batman.


[THEMES-NAMESPACE-batman-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-batman-author]:         http://about.bucaran.me
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[THEMES-NAMESPACE-batman-contributors]:   https://github.com/oh-my-fish/oh-my-fish/graphs/contributors


# [beloglazov](https://github.com/oh-my-fish/theme-beloglazov)
####  beloglazov

A theme based on the default robbyrussell theme. This theme adds time, the
number of non-pushed commits, and whether the previous command has failed.

![beloglazov-fish-theme](https://raw.github.com/beloglazov/oh-my-fish/master/themes/beloglazov/beloglazov-fish-theme.png)


###### Characteristics

* Displays git information in the command prompt when available
* Displays the number of non-pushed git commits
* Displays the current time
* Displays ✘ if the previous command failed


# [bira](https://github.com/oh-my-fish/theme-bira)
#### bira

Theme imported from Oh my ZSH: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
Contains traces of nuts and code from other Oh my fish themes.

Display username, hostname, current path, ruby version and git status. Display the latest error status in the right prompt.

![bira theme](https://cloud.githubusercontent.com/assets/1214238/5441541/8bd494dc-8491-11e4-9dbe-256b7e558eac.png)

TODO:
 - display Python version


# [bobthefish](https://github.com/oh-my-fish/theme-bobthefish)
### bobthefish

`bobthefish` is a Powerline-style, Git-aware [fish][btf-fish] theme optimized for awesome.

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish) [![MIT License](https://img.shields.io/github/license/oh-my-fish/theme-bobthefish.svg?style=flat)](/LICENSE.md)

![bobthefish][btf-screencast]


##### Installation

Be sure to have Oh My Fish installed. Then just:

    omf install bobthefish

You will need a [Powerline-patched font][btf-patching] for this to work, unless you enable the compatibility fallback option:

    set -g theme_powerline_fonts no

[I recommend picking one of these][btf-fonts]. For more advanced awesome, install a [nerd fonts patched font][btf-nerd-fonts], and enable nerd fonts support:

    set -g theme_nerd_fonts yes

This theme is based loosely on [agnoster][btf-agnoster].


##### Features

 * A helpful, but not too distracting, greeting.
 * A subtle timestamp hanging out off to the right.
 * Powerline-style visual hotness.
 * More colors than you know what to do with.
 * An abbreviated path which doesn't abbreviate the name of the current project.
 * All the things you need to know about Git in a glance.
 * Visual indication that you can't write to the current directory.


##### The Prompt

 * Status flags:
     * Previous command failed (**`!`**)
     * Private mode (**🔒** or **`⦸`**)
     * You currently have superpowers (**`$`**)
     * Background jobs (**`%`**)
 * Current vi mode
 * `User@Host` (unless you're the default user)
 * Current RVM, rbenv or chruby (Ruby) version
 * Current virtualenv (Python) version
     * _If you use virtualenv, you will probably need to disable the default virtualenv prompt, since it doesn't play nice with fish: `set -x VIRTUAL_ENV_DISABLE_PROMPT 1`_
 * Current NVM/FNM version (Nodejs) (inactive by default; see configurations in the next paragraph)
 * Abbreviated parent directory
 * Current directory, or Git or Mercurial project name
 * Current project's repo branch (<img width="16" alt="branch-glyph" src="https://cloud.githubusercontent.com/assets/53660/8768360/53ee9b58-2e32-11e5-9977-cee0063936fa.png"> master) or detached head (`➦` d0dfd9b)
 * Git or Mercurial status, via colors and flags:
     * Dirty working directory (**`*`**)
     * Untracked files (**`…`**)
     * Staged changes (**`~`**)
     * Stashed changes (**`$`**)
     * Unpulled commits (**`-`**)
     * Unpushed commits (**`+`**)
     * Unpulled _and_ unpushed commits (**`±`**)
     * _Note that not all of these have been implemented for hg yet :)_
 * Abbreviated project-relative path


##### Configuration

You can override some of the following default options in your `config.fish`:

```fish
set -g theme_display_git no
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Los_Angeles
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
```
**Git options**

- `theme_display_git_default_branch`. By default theme will hide/collapse the branch name in your prompt when you are using a Git _default branch_ i.e. historically `master` and often `main` now. Set to `yes` to stop these branches from being hidden/collapsed.
- `theme_git_default_branches`. The big cloud repos (GitHub, Bitbucket, GitLab et al.) are moving away from using `master` as the default branch name, and allow you to choose your own. As of version **2.28**, Git also supports custom default branch names via the `init.defaultBranch` config option. If our defaults of `master main` don't suit you, you can add/remove names in thist list i.e. `main trunk`. This ensures correct hiding/collapsing behaviour with custom default branch names (unless option above is activated).

**Title options**

- `theme_title_display_process`. By default theme doesn't show current process name in terminal title. If you want to show it, just set to `yes`.
- `theme_title_display_path`. Use `no` to hide current working directory from title.
- `theme_title_display_user`. Set to `yes` to show the current user in the tab title (unless you're the default user).
- `theme_title_use_abbreviated_path`. Default is `yes`. This means your home directory will be displayed as `~` and `/usr/local` as `/u/local`. Set it to `no` if you prefer full paths in title.

**Prompt options**

- `theme_display_ruby`. Use `no` to completely hide all information about Ruby version. By default Ruby version displayed if there is the difference from default settings.
- `theme_display_node`. If set to `yes`, will display current NVM or FNM node version.
- `theme_display_vagrant`. This feature is disabled by default, use `yes` to display Vagrant status in your prompt. Please note that only the VirtualBox and VMWare providers are supported.
- `theme_display_vi`. By default the vi mode indicator will be shown if vi or hybrid key bindings are enabled. Use `no` to hide the indicator, or `yes` to show the indicator.
- `theme_display_k8s_context`. This feature is disabled by default. Use `yes` to show the current kubernetes context (`> kubectl config current-context`).
- `theme_display_k8s_namespace`. This feature is disabled by default. Use `yes` to show the current kubernetes namespace.
- `theme_display_aws_vault_profile`. This feature is disabled by default. Use `yes` to show the currently executing [AWS Vault](https://github.com/99designs/aws-vault) profile.
- `theme_display_user`. If set to `yes`, display username always, if set to `ssh`, only when an SSH-Session is detected, if set to no, never.
- `theme_display_hostname`. Same behaviour as `theme_display_user`.
- `theme_display_sudo_user`. If set to `yes`, displays the sudo-username in a root shell. For example, when calling `sudo -s` and having this option set to `yes`, the username of the user, who called `sudo -s`, will be displayed.
- `theme_show_exit_status`. Set this option to `yes` to have the prompt show the last exit code if it was non_zero instead of just the exclamation mark.
- `theme_display_jobs_verbose`. If set to `yes` this option displays the number of currently running background jobs next to the percent sign.
- `theme_git_worktree_support`. If you do any git worktree shenanigans, setting this to `yes` will fix incorrect project-relative path display. If you don't do any git worktree shenanigans, leave it disabled. It's faster this way :)
- `theme_use_abbreviated_branch_name`. Set to `yes` to truncate git branch names in the prompt.
- `fish_prompt_pwd_dir_length`. bobthefish respects the Fish `$fish_prompt_pwd_dir_length` setting to abbreviate the prompt path. Set to `0` to show the full path, `1` (default) to show only the first character of each parent directory name, or any other number to show up to that many characters.
- `theme_project_dir_length`. The same as `$fish_prompt_pwd_dir_length`, but for the path relative to the current project root. Defaults to `0`; set to any other number to show an abbreviated path.
- `theme_newline_cursor`. Use `yes` to have cursor start on a new line. By default the prompt is only one line. When working with long directories it may be preferrend to have cursor on the next line. Setting this to `clean` instead of `yes` suppresses the caret on the new line.
- `theme_newline_prompt`. Use a custom prompt with newline cursor. By default this is the chevron right glyph or `>` when powerline fonts are disabled.

**Color scheme options**

| ![dark][btf-dark]           | ![light][btf-light]                     |
| --------------------------- | --------------------------------------- |
| ![solarized][btf-solarized] | ![solarized-light][btf-solarized-light] |
| ![base16][btf-base16]       | ![base16-light][btf-base16-light]       |
| ![zenburn][btf-zenburn]     | ![terminal-dark][btf-terminal-dark]     |
| ![nord][btf-nord]           |                                         |

You can use the function `bobthefish_display_colors` to preview the prompts in
any color scheme.

Set `theme_color_scheme` in a terminal session or in your fish startup files to
one of the following options to change the prompt colors.

- `dark`. The default bobthefish theme.
- `light`. A lighter version of the default theme.
- `solarized` (or `solarized-dark`), `solarized-light`. Dark and light variants
  of Solarized.
- `base16` (or `base16-dark`), `base16-light`. Dark and light variants of the
  default Base16 theme.
- `zenburn`. An adaptation of Zenburn.
- `gruvbox`. An adaptation of gruvbox.
- `dracula`. An adaptation of dracula.
- `nord`. An adaptation of nord.

Some of these may not look right if your terminal does not support 24 bit color,
in which case you can try one of the `terminal` schemes (below). However, if
you're using Solarized, Base16 (default), or Zenburn in your terminal and the
terminal *does* support 24 bit color, the built in schemes will look nicer.

There are several scheme that use whichever colors you currently have loaded
into your terminal. The advantage of using the schemes that fall through to the
terminal colors is that they automatically adapt to something acceptable
whenever you change the 16 colors in your terminal profile.
- `terminal` (or `terminal-dark` or `terminal-dark-black`)
- `terminal-dark-white`. Same as `terminal`, but use white as the foreground
  color on top of colored segments (in case your colors are very dark).
- `terminal-light` (or `terminal-light-white`)
- `terminal-light-black`. Same as `terminal-light`, but use black as the
  foreground color on top of colored segments (in case your colors are very
  bright).

For some terminal themes, like dark base16 themes, the path segments in the
prompt will be indistinguishable from the background. In those cases, try one of
the following variations; they are identical to the `terminal` schemes except
for using bright black (`brgrey`) and dull white (`grey`) in the place of black
and bright white.
- `terminal2` (or `terminal2-dark` or `terminal2-dark-black`)
- `terminal2-dark-white`
- `terminal2-light` (or `terminal2-light-white`)
- `terminal2-light-black`

Finally, you can specify your very own color scheme by setting
`theme_color_scheme` to `user`. In that case, you also need to define some
variables to set the colors of the prompt. See the "Colors" section of
`fish_prompt.fish` for details.


**VCS options**
- `set -g theme_vcs_ignore_paths /some/path /some/other/path{foo,bar}`. Ignore project paths for Git or Mercurial. Supports glob patterns.

##### Overrides

You can disable the theme default greeting, vi mode prompt, right prompt, or title entirely — or override with your own — by adding custom functions to `~/.config/fish/functions`:

- `~/.config/fish/functions/fish_greeting.fish`
- `~/.config/fish/functions/fish_mode_prompt.fish`
- `~/.config/fish/functions/fish_right_prompt.fish`
- `~/.config/fish/functions/fish_title.fish`

To disable them completely, use an empty function:

```fish
function fish_right_prompt; end
```

… Or copy one from your favorite theme, make up something of your own, or copy/paste a bobthefish default function and modify it to your taste!

```fish
function fish_greeting
  set_color $fish_color_autosuggestion
  echo "I'm completely operational, and all my circuits are functioning perfectly."
  set_color normal
end
```


[btf-fish]:       https://github.com/fish-shell/fish-shell
[btf-screencast]: https://cloud.githubusercontent.com/assets/53660/18028510/f16f6b2c-6c35-11e6-8eb9-9f23ea3cce2e.gif
[btf-patching]:   https://powerline.readthedocs.org/en/master/installation.html#patched-fonts
[btf-fonts]:      https://github.com/Lokaltog/powerline-fonts
[btf-nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[btf-agnoster]:   https://gist.github.com/agnoster/3712874

[btf-dark]:            https://cloud.githubusercontent.com/assets/53660/16141569/ee2bbe4a-3411-11e6-85dc-3d9b0226e833.png "dark"
[btf-light]:           https://cloud.githubusercontent.com/assets/53660/16141570/f106afc6-3411-11e6-877d-fc2a8f6d3175.png "light"
[btf-solarized]:       https://cloud.githubusercontent.com/assets/53660/16141572/f7724032-3411-11e6-8771-b43769e7afec.png "solarized"
[btf-solarized-light]: https://cloud.githubusercontent.com/assets/53660/16141575/fbed8036-3411-11e6-92e9-90da6d45f94b.png "solarized-light"
[btf-base16]:          https://cloud.githubusercontent.com/assets/53660/16141577/0134763a-3412-11e6-9cca-6040d39c8fd4.png "base16"
[btf-base16-light]:    https://cloud.githubusercontent.com/assets/53660/16141579/02f7245e-3412-11e6-97c6-5f3cecffb73c.png "base16-light"
[btf-zenburn]:         https://cloud.githubusercontent.com/assets/53660/16141580/06229dd4-3412-11e6-84aa-a48de127b6da.png "zenburn"
[btf-terminal-dark]:   https://cloud.githubusercontent.com/assets/53660/16141583/0b3e8eea-3412-11e6-8068-617c5371f6ea.png "terminal-dark"
[btf-nord]:            https://user-images.githubusercontent.com/39213657/72811435-f64ca800-3c5f-11ea-8711-dcce8cfc50fb.png "nord"


# [bongnoster](https://github.com/kfkonrad/bongnoster-fish-theme)
#### bongnoster

A fish theme optimized for people who use:

* Solarized
* Git
* Mercurial (requires 'hg prompt')
* SVN
* Unicode-compatible fonts and terminals (I use iTerm2 + Menlo)
* Fish Vi-mode

For Mac users, I highly recommend iTerm 2 + Solarized Dark

###### Characteristics

* If the previous command failed (✘)
* User @ Hostname (if user is not DEFAULT_USER, which can then be set in your profile)
* Git/HG/SVN status
* Branch () or detached head (➦)
* Current branch / SHA1 in detached head state
* Dirty working directory (±, color change)
* Working directory
* Elevated (root) privileges (⚡)
* Current virtualenv (Python)
You will probably want to disable the default virtualenv prompt. Add to your [`init.fish`](https://github.com/oh-my-fish/oh-my-fish#dotfiles):
`set --export VIRTUAL_ENV_DISABLE_PROMPT 1`
* Indicate vi mode.

Adapted from https://github.com/oh-my-fish/theme-agnoster.


# [boxfish](https://github.com/joelwanner/theme-boxfish)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### boxfish
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

#### Install

```fish
$ omf install boxfish
```

#### Features

* Minimalist ASCII-only prompt
* The most compact vi mode support possible (only 1 character!)
* Error indicator on return code != 0

#### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/joelwanner/theme-boxfish/master/screenshot.png">
</p>

### License

[MIT][mit] © [joelwanner][author] et [al][THEMES-NAMESPACE-boxfish-contributors]


[THEMES-NAMESPACE-boxfish-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-boxfish-author]:         https://github.com/joelwanner
[THEMES-NAMESPACE-boxfish-contributors]:   https://github.com/joelwanner/theme-boxfish/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [budspencer](https://github.com/oh-my-fish/theme-budspencer)
### Budspencer theme

A theme for nerds, makes fish even more powerful. It's equipped with a hell of a
lot of nice functions and key bindings to speed up your workflow.

The philosophy behind budspencer theme:

* Delimit the prompt lines clearly to the output.
* Produce output only if it contains relevant information.
* Show useful notifications within the prompt.
* Equip the prompt with toggle commands in order to change its style
  interactively.
* Store sessions in order to make frequently used commands quickly accessible.
* Make navigation within the directory tree as easy as possible using
  bookmarks and a directory history without duplicates.
* Make histories quickly accessible with menus.
* Don't stress your eyes. Use different colors in dark and bright environments.

#### Demonstration video

[![video][THEMES-NAMESPACE-budspencer-screenshot]](http://vimeo.com/105546618)

#### Requirements

You need an up-to-date fish shell version from [github][fish-git] or a
[nightly build][fish-nightly].

Non standard tools:

* xsel
* wmctrl
* git
* [taskwarrior][THEMES-NAMESPACE-budspencer-taskwarrior] (optional)
* [remind][THEMES-NAMESPACE-budspencer-remind] (optional)

##### Note for OS X users

The theme uses advanced `sed` and `expr` features. The OS X tools have
restricted functionality.

Try `expr` from `coreutils` package if you see `expr: syntax error` in
budspencer prompt.

Install advanced `sed` and `expr` versions:

```
$ brew install coreutils gnu-sed
```

Add this to your `~/.config/fish/config.fish`:

```
if test (uname -s) = "Darwin"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end
```

#### Configuration

##### General configuration

The theme behaves similar to vim's airline/powerline plugins. Thus, it needs a
[powerline font][THEMES-NAMESPACE-budspencer-font].
It's also crucial to have vi mode enabled. Thus, execute
```
set -U fish_key_bindings fish_vi_key_bindings
```
before enabling the theme.

##### Colors

Redefine `$budspencer_colors` with the `set` command in order to change the
colors of the prompt.

Example:
```
set budspencer_colors 000000 333333 666666 ffffff ffff00 ff6600 ff0000 ff0033 3300ff 0000ff 00ffff
00ff00
```
will result in a prompt like this:
![color replace example][THEMES-NAMESPACE-budspencer-colors]

Two color schemes for bright and dark environments are predefined. You can
enable them with `day` and `night`, respectively.

##### Command history
Commands that shouldn't appear in the command history are defined by a universal
list `$budspencer_nocmdhist`. Default:
```
set -U budspencer_nocmdhist c d ll ls m s
```

##### Disable/reenable greeting

Disable:
```
set -U budspencer_nogreeting
```

Reenable:
```
set -e budspencer_nogreeting
```

##### Show Node version

To show your current node version, do following in your Fish configs
```
set -g budspencer_alt_environment "node -v"
```

#### Ring the bell in order to set the urgency hint flag

If you have configured your terminal application to use the visual bell, your
window manager will tell you when a job running in your shell has finished. You
don't need to check manually whether it's done.

##### Disable the acoustic bell

If you have still activated the acoustic bell, you probably hate that feature.
Switch it off in that case:
```
set -U budspencer_nobell
```

#### Outer prompt segments

- Vi mode is indicated by color of outer segments, cursor color also changes
  if terminal supports it:
    * blue: NORMAL mode
    * yellow: INSERT mode
    * magenta: VISUAL mode

#### Left prompt segments

- Prompt line number
- Git repository information
- Status symbols
    * ✻: keep track of this shell session, can be toggled with `#` to show the number of
       the session within the sessions list
    * ⌘: present working directory is in bookmark list, can be toggled with `#` to
        show the number of the bookmark
    * V: vi is parent process
    * R: [ranger][THEMES-NAMESPACE-budspencer-ranger] is parent process
    * ⚙: there are background jobs, can be toggled with `#` to show the amount of
        background jobs
    * : no write permissions in present working directory
    * ⚔: there are tasks scheduled for this week, can be toggled with `#` to
        show the amount of weekly tasks
    * ⚑: there are appointments for today, can be toggled with `#` to
        show the amount of appointments
    * ✔: last command succeeded, can be toggled with `#` to show the status value
    * ✘: last command failed, can be toggled with `#` to show the status value
    * ⚡: superuser indicator
- Present working directory
- Active Python [virtual environment](https://virtualenv.pypa.io/en/latest/). Requires [Virtual Fish](https://github.com/adambrenecki/virtualfish/)

#### Right prompt segments

- Last command's duration time
- Git status symbols:
    * ↑: git repository is ahead origin
    * ↓: git repository is behind origin
    * +: changes have been added to git index
    * –: files have been deleted in work tree
    * ✱: files have been modified in work tree
    * →: files have been renamed in git index
    * ═: there are unmerged commits
    * ●: there are untracked (new) files
    * ✭: there are stashed commits

#### Toggle prompt segments

The following shortcuts need vi-mode:
- Style of "present working directory"-segment can be toggled in NORMAL and in
  VISUAL mode with space bar
    * styles implemented:
        - `short` (shows username, short hostname and truncated path; recommended in
          most cases)
        - `long` (shows username, full hostname and full path; useful for copy-paste
          in ssh connections)
        - `none` (shows nothing except small delimiter; useful for small terminals)
        - If prompt is toggled with `#`, the IP address is shown instead of the
          hostname.
    * configurable by universal list `$budspencer_pwdstyle` (if not set, defaults to
      `short long none`); note that changes to `$budspencer_pwdstyle` keep persistant as it's
      a universal variable.

![pwd style][THEMES-NAMESPACE-budspencer-pwdstyle]

- Style of symbols can be toggled in NORMAL and in VISUAL mode with `#`
    * styles implemented:
        - `symbols` (shows status symbols)
        - `numbers` (shows numbers instead of symbols in left prompt as well as amount of changes in
          right git prompt)

Note, the format is _username@hostname:pathname_. Thus, you can cut
the whole string with your mouse and paste it into `ssh` commands.

#### Quickly navigate in history of working directories

The function `d` drops down a menu showing the history as enumerated list. Unlike
fish's builtin `dirh`, `d` does not show any duplicates. Enter a number to jump
to a directory within the list.

![dir menu][THEMES-NAMESPACE-budspencer-dirmenu]

The following shortcuts need vi-mode:
- Press `H` in NORMAL mode to change present working directory to previous
  working directory in history.
- Press `L` in NORMAL mode to change present working directory to next working
  directory in history.

#### Quickly navigate in command history

The function `c` drops down a menu showing the command history as enumerated list similarly to
the `d` function. Selections are also pasted into the X clipboard. It's possible
to load a command of a former prompt by giving the prompt line number as
argument.

#### Bookmarks

A bookmark can be created with `mark`. It can be removed with `unmark`. 

`unmark` can take an argument to remove a specific bookmark in the bookmark list. 
Simply add the number of the bookmark you would like to remove as the argument.

Bookmarks are universal and thus persistant.
A new shell automatically changes working directory on startup to newest bookmark.
`m` is a function that drops down a menu showing the bookmarks as enumerated list
equivalently to `d`.

The following shortcuts need vi mode:
- Create a bookmark for present working directory with `m` in NORMAL mode.
- Remove a bookmark for present working directory with `M` in NORMAL mode.

By default the shell will change to the directory of the latest bookmark on a new session. 
This can be disabled by adding the following line:

```
set -U budspencer_no_cd_bookmark
```

#### Edit commandline with your favorite editor

The function `edit-commandline` let you edit the commandline with your editor.
It makes the commandline as powerful as your editor. If `$EDITOR` is not set,
vi is used.

The following shortcut needs vi mode:
- Type `.` in NORMAL mode to edit commandline in editor.

#### Sessions

Shell session can be stored with `s <session name>`. If a session with `session
name` already exists, the session with this name will be attached. If a session with
`session name` is already active within another terminal, this terminal will be
focussed.

A list of available sessions can be shown with `s`.

A session can be erased with `s -e <session name>`.

Type `s -d` to detach current session.

#### Set window title

Just type `wt <title>`.

#### TODO

- vi REPLACE mode, as soon as REPLACE mode is implemented within fish

#### Feedback

Give me feedback if you ...
* ... have ideas how I could improve budspencer.
* ... have problems with budspencer.
* ... have questions concerning budspencer.

[THEMES-NAMESPACE-budspencer-font]: https://github.com/Lokaltog/powerline-fonts
[THEMES-NAMESPACE-budspencer-ranger]: http://ranger.nongnu.org/
[THEMES-NAMESPACE-budspencer-taskwarrior]: http://taskwarrior.org/
[THEMES-NAMESPACE-budspencer-remind]: http://www.roaringpenguin.com/products/remind
[fish-git]: https://github.com/fish-shell/fish-shell.git
[fish-nightly]: https://github.com/fish-shell/fish-shell/wiki/Nightly-builds
[THEMES-NAMESPACE-budspencer-screenshot]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer.jpg
[THEMES-NAMESPACE-budspencer-colors]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer_replace_colors.jpg
[THEMES-NAMESPACE-budspencer-dirmenu]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer_dir_menu.jpg
[THEMES-NAMESPACE-budspencer-pwdstyle]: https://raw.githubusercontent.com/tannhuber/media/master/budspencer_pwd_style.jpg


# [cbjohnson](https://github.com/oh-my-fish/theme-cbjohnson)
#### cbjohnson theme

A minimal theme forked from the [yimmy][yimmy-commit] theme (thanks [jhillyerd][yimmy-author]!)

![screenshot](https://cloud.githubusercontent.com/assets/4823640/5327427/6f9e61bc-7d02-11e4-9223-38ddbed176c8.png)

[yimmy-commit]: https://github.com/bpinto/oh-my-fish/tree/3a4b7de689cabf3522227f51177a489d915c8b4d/themes/yimmy
[yimmy-author]: https://github.com/jhillyerd


# [chain](https://github.com/oh-my-fish/theme-chain)
### chain
A thin, classy theme composed of a chain of information.

[![asciicast](https://asciinema.org/a/129cyab1j0ou83fhaofg8hs2n.png)](https://asciinema.org/a/129cyab1j0ou83fhaofg8hs2n)


#### Installation
Install with [Oh My Fish][THEMES-NAMESPACE-chain-omf]:

```fish
$ omf install chain
```


#### Features
- Customizable prompt elements.
- Default prompt elements such as current Git branch and dirty state.
- If the last command fails, the exit code is displayed.
- An abbreviated path.


#### Links
Your prompt in chain consists of a series of *links*, with each link displaying a single piece of information. Not all links are always visible and only show up when you need them.

Links are entirely customizable, and it is easy to create and customize your own links.

Chain comes with six default links (in order from left to right):

- Superuser privileges (`⚡`)
- Number of running background jobs
- The current working directory
- The current Git branch (`⎇`)
- Git working directory dirty (`±`)
- Exit status of the last command

##### Custom links
Making your own links is as simple as writing a small function. A link is rendered using a _link function_, which is just a Fish function that outputs two lines: the first line is the color of the link; the second line is the link text. For example, if we wanted a yellow link that showed the current time, we could write a function like this:

```fish
function time_link
  echo yellow
  date '+%H:%M:%S'
end
```

Now we can add it to the end of our prompt:

```fish
chain.push time_link
```

Your links are saved automatically, so it is not necessary to add `chain.push` commands to your configuration. Running the command once is enough.


#### Commands
Chain offers several commands you can use to customize and manipulate your prompt. Here is some brief documentation on what these functions do:

##### `chain.compile`
To improve performance, the prompt function is actually generated from the configuration dynamically, or "compiled". Normally this function is called for you when needed.

##### `chain.defaults`
Resets the prompt to the default set of links.

##### `chain.inspect`
A neat-looking debug tool that prints out your chain-related configuration, gives a preview of all your enabled links, and dumps the _compiled prompt_ function.

##### `chain.multiline`
Toggle multi-line prompt display on and off. A multi-line prompt can make more room for typing if you have a lot of links in your prompt chain.

##### `chain.pop`
Remove the last link in the prompt chain.

##### `chain.push <function>`
Add a _link function_ to the end of the prompt chain.

##### `chain.shift`
Remove the first link in the prompt chain.

##### `chain.unshift <function>`
Add a _link function_ to the beginning of the prompt chain.


#### Customization
Chain uses several global variables to customize the prompt appearance. The most important one is `$chain_links`: a list of function names that print out a single link in the prompt.

The glyphs used in the default links can be customized using global variables. Here is a list of glyph-related variables:

- `$chain_prompt_glyph`: The arrow character at the end of the chain, right before the text input.
- `$chain_git_branch_glyph`: Glyph to indicate the Git branch.
- `$chain_git_dirty_glyph`: Glyph to indicate that the working branch has uncommitted changes.
- `$chain_su_glyph`: Glyph to indicate that you have superuser privileges.
- `$chain_link_open_glyph`: Glyph before each individual chain link (default `<`).
- `$chain_link_close_glyph`: Glyph after each individual chain link (default `>`).


#### License
[MIT][mit] © [coderstephen][author] et [al][THEMES-NAMESPACE-chain-contributors]

[THEMES-NAMESPACE-chain-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-chain-author]:         https://github.com/coderstephen
[THEMES-NAMESPACE-chain-contributors]:   https://github.com/coderstephen/theme-chain/graphs/contributors
[THEMES-NAMESPACE-chain-omf]:            https://github.com/oh-my-fish/oh-my-fish


# [clearance](https://github.com/oh-my-fish/theme-clearance)
### Fish Theme: clearance

A minimalist [fish shell](http://fishshell.com/) theme for people who use git

![clearance theme](https://raw.github.com/cseelus/clearance-fish/master/clearance-fish_preview.png)

#### Like it?

Check out other versions of this theme for OSX Terminal or VIM!


# [cmorrell](https://github.com/oh-my-fish/theme-cmorrell.com)
### Chris Morrell's Fish Theme

This is a theme I designed for myself but have given to a few friends and decided to publish for others' enjoyment.

![Chris Morrell's Fish Theme](https://cloud.githubusercontent.com/assets/21592/4770904/8a58e026-5b89-11e4-927c-42a387b41df0.gif)

#### Features

- Minimal base prompt
- Shows compact git status w/ the number of changed files & current branch
- Gives a visual indication when you're logged in via SSH, or logged in as anyone
    but the default user (set the `$default_user` list variable to define your default user)
- Shows indicator if previous command failed
- Shows a bright red "!" if you're logged in as root

(Note: _This theme is designed for a light-on-dark theme like [Solarized](http://ethanschoonover.com/solarized) but should work in a dark-on-light terminal with a few terminal color tweaks_)


# [coffeeandcode](https://github.com/oh-my-fish/theme-coffeeandcode)
### Fish Theme: coffeeandcode

Another theme choice for Oh-My-Fish! originally created by
[Jonathan Knapp](http://jonknapp.com).

![coffeeandcode](https://cloud.githubusercontent.com/assets/1272018/5966170/e846c75e-a7f9-11e4-8aeb-ebec4c974f5b.png)

##### Warning:

This theme will overwrite all of your Fish color and git settings. If you'd like
to customize them, you will have to make changes to the `fish_prompt.fish` file
in this theme. All of the settings are listed at the top of the file.


# [cor](https://github.com/oh-my-fish/theme-cor)
#### cor

The name says it all

![cor theme](https://f.cloud.github.com/assets/516068/692075/a30d9080-dbf6-11e2-8dd3-d07cce41259d.png)

For this theme you need a emoji supporting terminal and the emoji-clock plugin

* emoji-clock
* Git
* Unicode-compatible fonts and terminals (I use iTerm2 on OSX)

###### Characteristics

####### Left side prompt
* If the previous command failed (✘)
* User @ Hostname
* Abbriviated path
* Emoji-clock

####### Right side prompt
* Branch
* Git status clean dirty (*)
* Time of last command


# [cyan](https://github.com/oh-my-fish/theme-qing)
###### cyan

> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)
[![Join the chat at https://gitter.im/oh-my-fish/theme-qing](https://badges.gitter.im/oh-my-fish/theme-qing.svg)](https://gitter.im/oh-my-fish/theme-qing?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![IMG](https://cloud.githubusercontent.com/assets/8684553/14587898/02053638-04ee-11e6-9b6f-f7314f2cb180.png)

#### Install


```fish
$ omf install cyan
```
This theme is based Michele Bologna's theme you can see @[Michele Bologna](http://michelebologna.net) for more informations.
and the `fish_greeting.fish` forked from @[bramblex](https://github.com/bramblex/bubblegum).
Thanks!

#### Features

* Lorem ipsum dolor sit amet.
* Consectetur adipisicing elit.

#### The Prompt
* `User@Hostname`
* Current project's repo branch(master) and Head short hash(d0dfd9b)
* Current project's status, via colors and flags:
    * new file `✚`
    * modified `M`
    * deleted `✖`
    * reanme `➜`
    * unmerge `═` (TODO)
    * untracked `✭`
    * working directory clean `✔`
    * Note that not all of these have been implemented yet \_(:з」∠)_
* Current project's branch status
    * equal to upstream `=`
    * ahead of upstream `>`
    * behind upstream `<`
    * diverged from upstream `<>`

### License

[MIT][mit] © [szwathub][author] et [al][THEMES-NAMESPACE-cyan-contributors]


[THEMES-NAMESPACE-cyan-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-cyan-author]:         http://github.com/szwathub
[THEMES-NAMESPACE-cyan-contributors]:   https://github.com/szwathub/cyan/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [dangerous](https://github.com/oh-my-fish/theme-dangerous)
### Dangerous theme

A theme for the 70s, makes fish even more powerful. It's equipped with a hell
of a lot of nice functions and key bindings to speed up your workflow.

The philosophy behind dangerous theme:

* Delimit the prompt lines clearly to the output.
* Produce output only if it contains relevant information.
* Show useful notifications within the prompt.
* Equip the prompt with toggle commands in order to change its style
  interactively.
* Store sessions in order to make frequently used commands quickly accessible.
* Make navigation within the directory tree as easy as possible using
  bookmarks and a directory history without duplicates.
* Make histories quickly accessible with menus.
* Don't stress your eyes. Use different colors in dark and bright environments.

#### Screenshot

![screenshot][THEMES-NAMESPACE-dangerous-screenshot]

#### Requirements

You need an up-to-date fish shell version from [github][fish-git] or a
[nightly build][fish-nightly].

Non standard tools:

* xsel
* wmctrl
* git
* [taskwarrior][THEMES-NAMESPACE-dangerous-taskwarrior] (optional)
* [remind][THEMES-NAMESPACE-dangerous-remind] (optional)

#### Configuration

##### General configuration

It's crucial to have vi mode enabled. Thus, execute
```
set -U fish_key_bindings fish_vi_key_bindings
```
before enabling the theme.

##### Colors

Redefine `$dangerous_colors` with the `set` command in order to change the
colors of the prompt.

Example:
```
set dangerous_colors 000000 333333 666666 ffffff ffff00 ff6600 ff0000 ff0033 3300ff 0000ff 00ffff
00ff00
```

Two color schemes for bright and dark environments are predefined. You can
enable them with `day` and `night`, respectively.

##### Command history
Commands that shouldn't appear in the command history are defined by a universal
list `$dangerous_nocmdhist`. Default:
```
set -U dangerous_nocmdhist c d ll ls m s
```

##### Disable/reenable greeting

Disable:
```
set -U dangerous_nogreeting
```

Reenable:
```
set -e dangerous_nogreeting
```

#### Outer prompt segments

- Vi mode is indicated by color of outer segments, cursor color also changes
  if terminal supports it:
    * blue: NORMAL mode
    * yellow: INSERT mode
    * magenta: VISUAL mode

#### Left prompt segments

- Prompt line number
- Git repository information
- Status symbols
    * ✻: keep track of this shell session, can be toggled with `#` to show the number of
       the session within the sessions list
    * ⌘: present working directory is in bookmark list, can be toggled with `#` to
        show the number of the bookmark
    * V: vi is parent process
    * R: [ranger][THEMES-NAMESPACE-dangerous-ranger] is parent process
    * ⚙: there are background jobs, can be toggled with `#` to show the amount of
        background jobs
    * : no write permissions in present working directory
    * ⚔: there are tasks scheduled for this week, can be toggled with `#` to
        show the amount of weekly tasks
    * ⚑: there are appointments for today, can be toggled with `#` to
        show the amount of appointments
    * ✔: last command succeeded, can be toggled with `#` to show the status value
    * ✘: last command failed, can be toggled with `#` to show the status value
    * ⚡: superuser indicator
- Present working directory

#### Right prompt segments

- Last command's duration time
- Git status symbols:
    * ↑: git repository is ahead origin
    * ↓: git repository is behind origin
    * +: changes have been added to git index
    * –: files have been deleted in work tree
    * ✱: files have been modified in work tree
    * →: files have been renamed in git index
    * ═: there are unmerged commits
    * ●: there are untracked (new) files
    * ✭: there are stashed commits

#### Toggle prompt segments

The following shortcuts need vi-mode:
- Style of segments can be toggled in NORMAL and in VISUAL mode with space bar
    * styles implemented for present working directory segment:
        - `short` (shows username, short hostname and truncated path; recommended in
          most cases)
        - `long` (shows username, full hostname and full path; useful for copy-paste
          in ssh connections)
        - `none` (shows nothing except small delimiter; useful for small terminals)
        - If prompt is toggled with `#`, the IP address is shown instead of the
          hostname.
    * configurable by universal list `$dangerous_pwdstyle` (if not set, defaults to
      `short long none`); note that changes to `$dangerous_pwdstyle` keep persistant as it's
      a universal variable.
    * The other segments are hidden in case `$pwd_style` is `none`.

- Style of symbols can be toggled in NORMAL and in VISUAL mode with `#`
    * styles implemented:
        - `symbols` (shows status symbols)
        - `numbers` (shows numbers instead of symbols in left prompt as well as amount of changes in
          right git prompt)

Note, the format is _username@hostname:pathname_. Thus, you can cut
the whole string with your mouse and paste it into `ssh` commands.

#### Quickly navigate in history of working directories

The function `d` drops down a menu showing the history as enumerated list. Unlike
fish's builtin `dirh`, `d` does not show any duplicates. Enter a number to jump
to a directory within the list.

The following shortcuts need vi-mode:
- Press `H` in NORMAL mode to change present working directory to previous
  working directory in history.
- Press `L` in NORMAL mode to change present working directory to next working
  directory in history.

#### Quickly navigate in command history

The function `c` drops down a menu showing the command history as enumerated list similarly to
the `d` function. Selections are also pasted into the X clipboard. It's possible
to load a command of a former prompt by giving the prompt line number as
argument.

#### Bookmarks

A bookmark can be created with `mark`. It can be removed with `unmark`.
Bookmarks are universal and thus persistant.
A new shell automatically changes working directory on startup to newest bookmark.
`m` is a function that drops down a menu showing the bookmarks as enumerated list
equivalently to `d`.

The following shortcuts need vi mode:
- Create a bookmark for present working directory with `m` in NORMAL mode.
- Remove a bookmark for present working directory with `M` in NORMAL mode.

#### Edit commandline with your favorite editor

The function `edit-commandline` lets you edit the commandline with your editor.
It makes the commandline as powerful as your editor. If `$EDITOR` is not set,
vi is used.

The following shortcut needs vi mode:
- Type `.` in NORMAL mode to edit commandline in editor.

#### Sessions

Shell session can be stored with `s <session name>`. If a session with `session
name` already exists, the session with this name will be attached. If a session with
`session name` is already active within another terminal, this terminal will be
focussed.

A list of available sessions can be shown with `s`.

A session can be erased with `s -e <session name>`.

Type `s -d` to detach current session.

#### Set window title

Just type `wt <title>`.

#### TODO

- vi REPLACE mode, as soon as REPLACE mode is implemented within fish

#### Feedback

Give me feedback if you ...
* ... have ideas how I could improve dangerous.
* ... have problems with dangerous. 
* ... have questions concerning dangerous.

[THEMES-NAMESPACE-dangerous-ranger]: http://ranger.nongnu.org/
[THEMES-NAMESPACE-dangerous-taskwarrior]: http://taskwarrior.org/
[THEMES-NAMESPACE-dangerous-remind]: http://www.roaringpenguin.com/products/remind
[fish-git]: https://github.com/fish-shell/fish-shell.git
[fish-nightly]: https://github.com/fish-shell/fish-shell/wiki/Nightly-builds
[THEMES-NAMESPACE-dangerous-screenshot]: https://raw.githubusercontent.com/tannhuber/media/master/dangerous.gif


# [default](https://github.com/oh-my-fish/theme-default)
<div align="center">
  <a href="http://github.com/fish-shell/omf">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> Default theme for [Oh My Fish][omf-link].

#### Install

```fish
$ omf theme default
```

#### Features

* All the things you need to know about Git in a glance.
* A subtle timestamp hanging out off to the right.
* Previous command status.

#### Screenshot

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/526122/9604024/ac338638-50ac-11e5-874a-70fa9287db93.png">
</p>

#### Configuration

Only display the folder name:
```
  set -g theme_short_path yes
```

### License

[MIT][mit] © [bpinto][author] et [al][THEMES-NAMESPACE-default-contributors]


[THEMES-NAMESPACE-default-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-default-author]:         http://github.com/bpinto
[THEMES-NAMESPACE-default-contributors]:   https://github.com/oh-my-fish/theme-default/graphs/contributors
[omf-link]:       https://www.github.com/fish-shell/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[travis-badge]:   http://img.shields.io/travis/oh-my-fish/theme-default.svg?style=flat-square
[travis-link]:    https://travis-ci.org/oh-my-fish/theme-default


# [dmorrell](https://github.com/reitzig/theme-dmorrell)
### DMorrell Fish Theme

This is a theme for 
    [fish](https://github.com/fish-shell/fish-shell)
that focuses on staying out of the way while giving helpful information,
in particular when working with Git.

![2018-07-22 00 48 23 screenshot](https://user-images.githubusercontent.com/4246780/43040637-45c207ee-8d49-11e8-9bd4-d6990a665487.png)

#### Features

- Minimal base prompt.
- Indicates if previous command failed.
- Shows compact Git status with
    - the number of added, modified, and removed files, as well as the number of stashes; 
    - the type and name of the current revision; and
    - indication whether a merge or rebase is happening.
- Gives visual indication when you're logged in via SSH, or logged in as anyone
    but the default user. Shows a bright red "!" if you are logged in as root.

_Note:_ This theme is designed for a light-on-dark theme like 
    [Solarized](http://ethanschoonover.com/solarized) 
but should work in a dark-on-light terminal with a few terminal color tweaks.

#### Installation

Install using
    [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish):

```fish
omf install https://github.com/reitzig/theme-dmorrell.git 
omf theme dmorrell
```

Set the list of default users by adding

```fish
set -g default_user "me" "buddy"
```

to your `.config/fish/config.fish`. 
Of course, this only makes sense if you use the same config across multiple accounts.
You can also add the same line to your own fork of the theme.

#### Acknowledgements

 * Derived from Chris Morrell's
    [cmorrell](https://github.com/oh-my-fish/theme-cmorrell.com).
   Hence the name, because `d` comes after `c`.
 * Took some hints from Stefan Maric's
    [bigfish](https://github.com/stefanmaric/bigfish),
   in particular about smart glyph choices for representing Git status.
 * Grabbed some Git-related code from
    [git_util](https://github.com/fisherman/git_util).


# [doughsay](https://github.com/doughsay/omf-theme-doughsay.git)
<a href="/doughsay/omf-theme-doughsay/master/README.md">Moved Permanently</a>.



# [eclm](https://github.com/oh-my-fish/theme-eclm)
#### eclm
Based on the robbyrussell theme.

![eclm theme](https://raw.githubusercontent.com/oh-my-fish/theme-eclm/master/screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* Indicates 'master' branch with a distinctive color, encouraging the use of feature-branches (useful when development is done using pull requests)
* If the last command was failed, the indicator would be red, otherwise it's green


# [edan](https://github.com/oh-my-fish/theme-edan)
#### Theme Edan

Inspired by idan, a functional, uncluttered fish theme with usability perks for git users and python developers.

![Screenshot of theme Edan](https://cloud.githubusercontent.com/assets/215282/6199938/f67e6a54-b49a-11e4-800b-587a638cfb86.png)

###### Characteristics

####### Left Prompt

* User & host (Shown in "remote" mode, hidden by default. Execute `edan-set-remote` or `edan-set-local` to switch.)
* Current python virtualenv (if applicable)
* Truncated CWD (just the current folder name)
* Git branch and dirty state (if applicable)

####### Right Prompt

* Full CWD path
* Last error code (if applicable)

###### Font

Check out [Anonymous Pro](http://www.marksimonson.com/fonts/view/anonymous-pro).


# [eden](https://github.com/oh-my-fish/theme-eden)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### eden
> A theme for [fishshell][fish-link].

[![MIT License][license-badge]](/LICENSE)
[![Fish Shell Version][fish-badge]](http://fishshell.com)
[![Oh My Fish Framework][omf-badge]][omf-link]

<br/>

#### Install

Using [Oh My Fish][omf-link]:
```shell
$ omf install eden

### to uninstall :/
$ omf uninstall eden
```

Using [Fisherman][fisher-link]:
```shell
$ fisher https://github.com/amio/fish-theme-eden

### to uninstall :/
$ fisher rm theme-eden
```

#### Features

* Last command's timestamp & exit status on right.
* `eden_toggle_path` display long or short pwd.
* `eden_toggle_host` show or hide host & user.
* `eden_prompt_char` custom prompt char.
* `eden_toggle_ssh_tag` show or hide `-SSH-` tag.
* A blue (red for root user) `-SSH-` tag on ssh connection.

#### Screenshot

<p align="center">
<img width="883" height="529" alt="Theme Eden Screenshot" src="https://cloud.githubusercontent.com/assets/215282/14846313/c3e211f0-0c95-11e6-8814-93a2b9a78b2c.png">
</p>

Font: [INCONSOLATA](https://www.google.com/fonts/specimen/Inconsolata)

### License

[MIT][mit] © [Amio][THEMES-NAMESPACE-eden-author]


[THEMES-NAMESPACE-eden-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-eden-author]:         http://github.com/amio
[fish-link]:      http://fishshell.com/
[omf-link]:       https://github.com/oh-my-fish/oh-my-fish
[fisher-link]:    https://github.com/fisherman/fisherman
[omf-badge]:      https://flat.badgen.net/badge/Oh%20My%20Fish/Framework
[fish-badge]:     https://flat.badgen.net/badge/fish/v2.2.0
[license-badge]:  https://flat.badgen.net/badge/license/MIT


# [emoji-powerline](https://github.com/wyqydsyq/emoji-powerline)
#### emoji-powerline

Based on Agnoster, extended with emojis representing home and root directories. Paths in the pwd prompt and git branch are split by "/" and joined as powerline segments for a clean aesthetic. Input is broken onto a new line for more consistent positioning.

Colours and emojis used are easily configurable at the top of `./fish_prompt.fish`

Get the full path in your prompt by running:

```sh
set -U fish_prompt_pwd_dir_length 0
```

###### Preview
![emoji-powerline theme](https://i.imgur.com/62aD4l9.png)

###### Characteristics

- If you're under your home directory, "~" is replaced with "🏠"
- If you're outside your home directory, the root-level "/" is replaced with "🌏"
- pwd_prompt is split by "/", each section is turned into a Powerline segment
- Git branch is split by "/", each section is turned into a Powerline segment
- If the previous command failed (⚠️)
- User @ Hostname (if user is not DEFAULT_USER, which can then be set in your profile)
- Git/HG/SVN status
- Branch () or detached head (➦)
- Current branch / SHA1 in detached head state
- Dirty working directory (✱, color change)
- Clean working directory ✔
- Elevated (root) privileges (⚡)
- Current virtualenv (Python)
  You will probably want to disable the default virtualenv prompt. Add to your [`init.fish`](https://github.com/oh-my-fish/oh-my-fish#dotfiles):
  `set --export VIRTUAL_ENV_DISABLE_PROMPT 1`
- Indicate vi mode.

Forked from https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#agnoster-1


# [es](https://github.com/oh-my-fish/theme-es)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### es theme
> A Powerline-style, Git-aware theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

#### Install
Make sure you have [Oh My Fish][omf-link] installed. Then just
```fish
$ omf install es
```

#### Requirements
* Latest fish version with a builtin `string` function (above `2.2.0`, so please get the latest version from  `HEAD`)
* Powerline-patched font

#### Features

* Git-aware theme with detailed __Git status__ in the left prompt (added, removed, modified, renamed, unstaged, stashed)
* __Node/Python/Ruby@gemset__ current version inside a git folder in the right prompt if respective virtual environment manager is installed (nvm, pyenv, rbenv)
* __Error status__ and __duration of last command__ in the right prompt
* Mac-notifications on completion of long commands (10+&nbsp;seconds by default) if terminal (iTerm and Terminal) is out of focus
* Limits path to __two last folders__ for better visibility, with `$HOME` directory abbreviated to `~`

#### Screenshot

##### __Git folder__
<p align="center">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20Git-es.png?raw=true">
</p>

##### __Normal folder (no Git)__
<p align="center">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20NoGit-es.png?raw=true">
</p>

##### __Normal read-only folder (no Git)__
<p align="left">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20NoGit%20Read-only-es.png?raw=true" width="280">
</p>

### License

[MIT][mit] © [eugenesvk][THEMES-NAMESPACE-es-author]


[THEMES-NAMESPACE-es-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-es-author]:         http://github.com/eugenesvk
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [fishbone](https://github.com/oh-my-fish/theme-fishbone)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

### fishbone
A clean theme for [fish shell](https://fishshell.com) managed by [Oh my fish](https://github.com/oh-my-fish/oh-my-fish)

<br />
<br />

#### Example

<img src="https://raw.githubusercontent.com/oh-my-fish/theme-fishbone/animation/fishbone.gif" align="center" />

#### Installation

```fish
omf update  # Just if your omf installation is old. Avoids missing the package
omf install fishbone
```
> omf (Oh my fish) is a package manager for fish shell. Just like pip is for Python and gem is for Ruby

#### Features

* Only displays an abbreviatted path on left side;
* Displays the current time at right;
* On git repositories shows its current branch and modifications on right side;
* For Python users, if there is an active virtualenv, it will be displayed at right between brackets;
* Colon at left side becames red if last command fails;
* At start up, shows user name, date, uptime, informations about OS, CPU, memory and network;
 
#### Project structure

We have two branches:

* master: Where the necessary files for theme is;
* animation: There is two adicional files (animation.cxf, fishbone.gif) that is used for theme example at README.md file.

The theme files are separated as follows:

* fish_prompt.fish: Has the function to print the prompt line;
* fish_right_prompt.fish: Prints the right side of the shell prompt;
* fish_greeting.fish: Prints the welcome message at shell session start up;


#### Contributing

We are not stringent with contributions.
Just fork the project, do some modifications and send us a Pull request : )
Bugs and improvements can be reported/suggested as [issues](https://github.com/oh-my-fish/theme-fishbone/issues).


### License

[MIT][mit] © [pantuza][author] et [al][THEMES-NAMESPACE-fishbone-contributors]


[THEMES-NAMESPACE-fishbone-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-fishbone-author]:         https://github.com/pantuza
[THEMES-NAMESPACE-fishbone-contributors]:   https://github.com/pantuza/fishbone/graphs/contributors


# [fishface](https://github.com/oh-my-fish/theme-fishface)
#### FishFace

Shows an ASCII fish which is blue or green when in a git repo.

![fishface theme](https://f.cloud.github.com/assets/66143/1224622/ec9660d8-2750-11e3-9c96-cb7a5a69eada.png)


# [fishy-drupal](https://github.com/oh-my-fish/theme-fishy-drupal)
#### fishy-drupal

![fishy-drupal](https://raw.github.com/greggles/fishy-drupal/master/drups-fish-theme.png)

###### Features

* Shows the present working directory, abbreviated (default fish style)
* Shows the active git branch, if any
* Shows the active drush site alias, if any
* Shows yellow ✗ if the current git directory is "dirty"


# [fisk](https://github.com/oh-my-fish/theme-fisk)
### Fisk

![theme screenshot](https://cloud.githubusercontent.com/assets/20814/6209746/60949aa6-b5c9-11e4-8edc-5a8e370f4527.png)

A nice dark blue-green theme with support for:

- Last exit code
- Current git HEAD
- Current python virtualenv

By [joar](https://github.com/joar), thanks to
[adisbladis](https://github.com/adisbladis) for the starting point.


# [flash](https://github.com/alecgorge/fish-flash-theme)
[![Slack Room][slack-badge]][slack-link]

### Flash

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/8317250/7787558/fb091794-024d-11e5-815b-cf3b6b2e5217.png">
</p>

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg

#### Features

_From left to right:_

+ `$HOME` directory abbreviated to `( ⌁ )`
+ `/` root is diplayed as `( / )`
+ `$HOME` and `/` characters change color to dim gray if last `$status`  was `!=` 0.
+ Path to current working directory is abbreviated.
+ Path and prompt separator is displayed as `)`.

+ `<` character next to `(branch)` denotes the repository has [_stashed_](https://git-scm.com/book/no-nb/v1/Git-Tools-Stashing) changes.
+ `*` next to the branch name denotes the current repository is dirty.
+ Display current branch.
+ Display current time.
+ Time separator `:` changes color to red if last `$status`  was `!=` 0.
+ Display exit status for non zero codes after `≡` character.
+ Colors inspired by _The Flash_.
+ Display the number of seconds taken by the last command executed.

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/8317250/7787589/431f2efa-024f-11e5-9715-df3e1833e174.png">
</p>


# [fox](https://github.com/oh-my-fish/theme-fox)
#### fox

cloned from oh-my-zsh.

![fox theme](http://i60.tinypic.com/2myaibn.jpg)


# [gentoo](https://github.com/ribugent/theme-gentoo)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### Gentoo fish theme
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install gentoo
```


#### Features

Unofficial Gentoo fish prompt theme which tries to follow Gentoo default bash $PS1.

* Left-hand side:
	* user@host for regular user, green color
	* host for root user, red color
	* full cwd for regular user, short cwd for root, home dir is replaced by ~
	* EXTRA: git branch with state info (if applicable)

* Right-hand side:
	* last error code (if applicable)
	* [timestamp]

#### Screenshot

<p align="center">
<img src="http://i.imgur.com/kNvOfd6.png">
</p>

### Credits:

* Forked from https://github.com/oh-my-fish/theme-godfather and modified to follow Gentoo default bash $PS1
* Colors and git functions taken from [amio](https://github.com/amio)'s [edan](https://github.com/oh-my-fish/oh-my-fish/blob/master/db/themes/edan) theme.
* "Gentoo" is a trademark of Gentoo Foundation, Inc.


### License

[MIT][THEMES-NAMESPACE-gentoo-mit] ©


[THEMES-NAMESPACE-gentoo-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-gentoo-author]:         https://github.com/ribugent
[THEMES-NAMESPACE-gentoo-contributors]:   https://github.com/ribugent/theme-gentoo/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [gianu](https://github.com/oh-my-fish/theme-gianu)
#### Gianu

Original theme made by [gianu](https://github.com/gianu) for oh-my-zsh, converted to oh-my-fish by [JBarberU](https://github.com/JBarberU)

![gianu theme](https://cloud.githubusercontent.com/assets/1499062/5955321/114b64d2-a7a2-11e4-8732-e8cf06903314.png)


###### Characteristics

Displays:

* Username and hostname
* Working directory
* Git information when available.


# [gitstatus](https://github.com/oh-my-fish/theme-gitstatus)
#### GitStatus

![GitStatus](https://github.com/godfat/fish_prompt-gitstatus/raw/master/gitstatus.png)

###### Characteristics

* Displays host information in the command prompt when connected via ssh.

* Displays git information in the command prompt when inside a git repository.

  - Shows current branch name.
  - Shows * if working copy is dirty.
  - Shows # if everything is staged.
  - Shows no indicators if the working copy is clean.


# [gnuykeaj](https://github.com/oh-my-fish/theme-gnuykeaj)
### Fish Theme: gnuykeaj

Super minimal one line version of [clearance](https://github.com/oh-my-fish/theme-clearance) theme. Balance between need to know information and space. Has git branch and dirty state information based on the color of the branch name.

![gnuykjeatheme](https://raw.githubusercontent.com/andyklimczak/oh-my-fish/gnuykeaj-screenshot/themes/gnuykeaj/gnuykeaj-preview.png)



# [godfather](https://github.com/oh-my-fish/theme-godfather)
#### godfather fish theme

Clean git theme with homey feel and git-centric features.

![screenshot](http://i.imgur.com/mh7a39d.png)

###### Prompt structure:

* Left-hand side:
	* user@host:
	* truncated cwd (just the current folder name)
	* git branch with state info (if applicable)

* Right-hand side:
	* last error code (if applicable)
	* [timestamp]

###### Credits:

Colors and git functions taken from [amio](https://github.com/amio)'s
[edan](https://github.com/bpinto/oh-my-fish/tree/master/themes/edan) theme.



# [graystatus](https://github.com/usami-k/graystatus)
### graystatus

Prompt theme for [fish shell](http://fishshell.com).

* modest prompt
* deference to contents

#### Screen Shot

![screenshot](https://raw.githubusercontent.com/usami-k/graystatus/master/screenshot.png)

#### Install

If you use [fisher](https://github.com/jorgebucaran/fisher) :

```
fisher add usami-k/graystatus
```

If you use [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) :

```
omf install graystatus
```

#### Configuration

To configure, you can use environment variables.

* `GRAYSTATUS_COLOR_PROMPT` : prompt color (default: brblack)
* `GRAYSTATUS_COLOR_STATUS` : exit status color (default: red)

The color value is passed to [set_color](https://fishshell.com/docs/current/commands.html#set_color) command.

#### License

Copyright 2017 USAMI Kosuke

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


# [harleen](https://github.com/aneveux/theme-harleen)
<img src="https://avatars1.githubusercontent.com/u/11728505?s=200&v=4" align="left" width="144px" height="144px" style="margin:10px 20px;"/>

###### Harleen

> A [Oh My Fish][omf-link] theme inspired by [Harleen Quinzel](http://dcextendeduniverse.wikia.com/wiki/Harley_Quinn).

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

#### Install

```fish
$ omf install harleen
```

*Please notice the theme requires [git](https://git-scm.com/) to work efficiently.*

#### Description

*Harleen* is a simple yet useful [Oh My Fish][omf-link] theme highly inspired by the [batman theme](https://github.com/gitter-badger/batman) and the [sushi theme](https://github.com/umayr/theme-sushi), but also from the [fish default theme](https://github.com/oh-my-fish/theme-default).

It is meant to remain simple and bring some useful information when browsing a git repository.

Huge thanks as well to [erikachristine](http://www.colourlovers.com/lover/erikachristine) for her beautiful [color palette](http://www.colourlovers.com/palette/4537580/lisa_frank_rainbow~) which I used for that theme.

Also a huge thanks to @sagebind for his really nice and helpful comments :thumbsup:

#### Features

* Minimal prompt,
* Displays status of last command as color,
* Displays useful information when browsing a Git repository,
* Displays number of ahead/behind commits between current and remote branch,
* Displays time on the right.

#### Screenshot

![screenshot](https://raw.githubusercontent.com/aneveux/theme-harleen/master/screen.png)

### License

[MIT][mit] © [Antoine Neveux][author] et [al][THEMES-NAMESPACE-harleen-contributors]

[THEMES-NAMESPACE-harleen-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-harleen-author]:         https://github.com/aneveux
[THEMES-NAMESPACE-harleen-contributors]:   https://github.com/aneveux/theme-harleen/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [idan](https://github.com/oh-my-fish/theme-idan)
#### idan
A functional, uncluttered fish theme with usability perks for git users and python developers.


![Screenshot of idan theme](https://f.cloud.github.com/assets/22723/544512/14b7cd6e-c251-11e2-82c0-d5b4f41581c7.png)


###### Characteristics

####### Left Prompt

* Current python virtualenv (if applicable)
* Truncated CWD (just the current folder name)
* Git branch and dirty state (if applicable)

####### Right Prompt

* Full CWD path
* Last error code (if applicable)


# [integral](https://github.com/oh-my-fish/theme-integral)
#### integral

A simple git upstream theme.

###### Characteristics

* Current branch
* Dirty working directory
* Working directory
* Git upstream status

###### Screenshot
![Integral Screenshot](https://cloud.githubusercontent.com/assets/21774/2715353/70af1520-c50a-11e3-9db3-74933fbb8d91.png)


# [jacaetevha](https://github.com/oh-my-fish/theme-jacaetevha)
#### jacaetevha

A theme optimized for people who use:

* Git
* Unicode-compatible fonts and terminals (I use iTerm2 + Monaco)

For Mac users, I highly recommend iTerm 2.

![jacaetevha
theme](http://jacaetevha.github.io/oh-my-fish/screenshot.png)


###### Characteristics

* Left-hand prompt:
```
    <user> at <host> in <abbreviated path> <total size of files in dir> (<current Git branch>)
    ↪ 
```
* Right-hand prompt:
```
    <current date>
```


# [johanson](https://github.com/johanson/theme-johanson)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### johanson
> A two-line theme for [Oh My Fish][omf-link] with Python virtual environment  and fabfile support. Loosely based on cbjohnson.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

#### Install

```fish
$ omf install johanson
```
#### Screenshot

![Omf johanson theme screenshot](https://raw.githubusercontent.com/johanson/theme-johanson/master/screenshots/omf-theme-johanson-1.png?raw=true)

![Omf johanson theme screenshot](https://raw.githubusercontent.com/johanson/theme-johanson/master/screenshots/omf-theme-johanson-2.png?raw=true)

![Omf johanson theme screenshot](https://raw.githubusercontent.com/johanson/theme-johanson/master/screenshots/omf-theme-johanson-3.png?raw=true)

### License

[MIT][mit] © [Rasmus Johanson][author] et [al][THEMES-NAMESPACE-johanson-contributors]

[THEMES-NAMESPACE-johanson-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-johanson-author]:         https://github.com/johanson
[THEMES-NAMESPACE-johanson-contributors]:   https://github.com/johanson/theme-johanson/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [kawasaki](https://github.com/hastinbe/theme-kawasaki)
### kawasaki

`kawasaki` is a customizable [fish][THEMES-NAMESPACE-kawasaki-fish] theme that emphasizes a simple and useful prompt without useless cluttter.

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)

![kawasaki][THEMES-NAMESPACE-kawasaki-screenshot]

###### Example customizations

| [Minimal Midnight](#customizing) | [Joker](#customizing) |
| -------------------------------- | --------------------- |
| ![midnight](https://user-images.githubusercontent.com/195790/96850333-45429a80-1489-11eb-8b28-043b2999b75d.png) | ![joker](https://user-images.githubusercontent.com/195790/96945002-0820eb80-150f-11eb-91fe-ecfa0e2b9131.png) |

#### Installation


###### Requirements
* [Fish shell][THEMES-NAMESPACE-kawasaki-fish] - a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family
* [Oh My Fish][THEMES-NAMESPACE-kawasaki-omf] - The Fishshell Framework

Once Oh My Fish is installed:

    omf install kawasaki

This theme was inspired by [bira][THEMES-NAMESPACE-kawasaki-bira].

###### Notes

To use kawasaki's virtualenv prompt instead of the default virtualenv prompt append `set -x VIRTUAL_ENV_DISABLE_PROMPT 1` to your [init.fish][THEMES-NAMESPACE-kawasaki-dotfiles]


#### Features

 * Completely customizable.
 * Display status of the working tree for Git projects.
 * Read/write indicator of the current working directory.
 * Background jobs indicator.
 * Virtualenv prompt indicator.


#### Customizing

###### Override defaults

You can override the default display settings by specifying any of the following settings in your [init.fish][THEMES-NAMESPACE-kawasaki-dotfiles]:

```fish
#### Enable the time to be displayed.
set -g theme_display_time yes

#### Disable playing the user's current group.
set -g theme_display_group no

### Display the system hostname.
set -g theme_display_hostname no

#### Disable Git-awareness.
set -g theme_display_git no

#### Don't disable jobs indicator.
set -g theme_display_jobs no

#### Always display the jobs indicator, even if there are no jobs.
set -g theme_display_jobs_always yes

#### Hide the current directory read/write indicator.
set -g theme_display_rw no

#### Don't display the VirtualEnv prompt.
set -g theme_display_virtualenv no

#### Display the battery
set -g theme_display_batt no
set -g theme_display_batt_icon no
```

###### Look and feel

Nearly every aspect of kawasaki can be customized. The following can be set to adjust the look and feel of kawasaki:

```fish
set -g theme_color_error                           red
set -g theme_color_superuser                       red
set -g theme_color_user                            white
set -g theme_color_group                           666666
set -g theme_color_host                            brgreen
set -g theme_color_separator                       brblack
set -g theme_color_bracket                         brblue
set -g theme_color_normal                          normal
set -g theme_color_time                            666666
set -g theme_color_path                            brwhite
set -g theme_color_prompt                          white
set -g theme_color_virtualenv                      bryellow
set -g theme_color_status_prefix                   brblue
set -g theme_color_status_jobs                     brgreen
set -g theme_color_status_rw                       brwhite
set -g theme_color_batt_icon                       white
set -g theme_color_batt_charging                   brgreen
set -g theme_color_batt_discharging                red
set -g theme_color_batt_0                          red
set -g theme_color_batt_25                         red
set -g theme_color_batt_50                         bryellow
set -g theme_color_batt_75                         bryellow
set -g theme_color_batt_100                        brgreen

set -g theme_prompt_char_normal                    '$'
set -g theme_prompt_char_superuser                 '#'
set -g theme_prompt_char                           "$theme_prompt_char_normal"

set -g theme_prompt_superuser_glyph                \u2605
set -g theme_prompt_userhost_separator              '@'
set -g theme_prompt_group_separator                 ':'

set -g theme_prompt_segment_separator_char         ' '
set -g theme_prompt_segment_separator_color        normal

set -g theme_prompt_status_jobs_char               '%'
set -g theme_prompt_status_rw_char                 '.'
set -g theme_prompt_status_separator_char          '/'

set -g theme_prompt_virtualenv_char_begin          '('
set -g theme_prompt_virtualenv_char_end            ')'
set -g theme_prompt_virtualenv_color_char_begin    normal
set -g theme_prompt_virtualenv_color_char_end      normal

set -g theme_prompt_batt_charging_char             '↑'
set -g theme_prompt_batt_discharging_char          '↓'
set -g theme_prompt_batt_0                         ''
set -g theme_prompt_batt_25                        ''
set -g theme_prompt_batt_50                        ''
set -g theme_prompt_batt_75                        ''
set -g theme_prompt_batt_100                       ''

set -g theme_display_time_format                   '+%I:%M'

set -g __fish_git_prompt_color_merging             red
set -g __fish_git_prompt_color_branch              brblue
set -g __fish_git_prompt_showcolorhints            yes
set -g __fish_git_prompt_show_informative_status   yes
set -g __fish_git_prompt_char_stateseparator       ' '

set -g __fish_git_prompt_char_branch_begin         ''
set -g __fish_git_prompt_char_branch_end           ''
set -g __fish_git_prompt_color_branch_begin        bryellow
set -g __fish_git_prompt_color_branch_end          bryellow
```

####### Examples

__Minimal midnight__

![midnight](https://user-images.githubusercontent.com/195790/96850333-45429a80-1489-11eb-8b28-043b2999b75d.png)

```fish
set -gx fish_prompt_pwd_dir_length 0
set -g theme_display_group no
set -g theme_display_hostname no
set -g theme_color_user aa55ff
set -g theme_display_rw no
```

__Joker__

![joker](https://user-images.githubusercontent.com/195790/96945002-0820eb80-150f-11eb-91fe-ecfa0e2b9131.png)

```fish
set theme_primary                                   1eb980
set theme_secondary                                 ffcf44
set theme_primary_variant                           045d56
set theme_secondary_variant                         ff6859
set theme_hilight                                   b15dff

set -g theme_color_user                             $theme_hilight
set -g theme_color_host                             $theme_primary_variant
set -g theme_color_separator                        brblack
set -g theme_color_normal                           normal
set -g theme_color_time                             $theme_secondary_variant
set -g theme_color_path                             $theme_primary
set -g theme_color_prompt                           $theme_secondary_variant
set -g theme_color_virtualenv                       $theme_secondary
set -g theme_color_status_prefix                    $theme_hilight
set -g theme_color_status_jobs                      $theme_primary
set -g theme_color_status_rw                        $theme_primary
set -g theme_display_group                          no
set -g theme_prompt_segment_separator_color         $theme_primary
set -g theme_prompt_userhost_separator              '.'
set -g __fish_git_prompt_char_branch_begin          '['
set -g __fish_git_prompt_char_branch_end            ']'
set -g __fish_git_prompt_color_branch_begin         brblack
set -g __fish_git_prompt_color_branch_end           brblack
set -g __fish_git_prompt_color_branch               $theme_secondary

set -gx fish_prompt_pwd_dir_length                  1
set -g theme_display_jobs_always                    yes
```

#### License

kawasaki is released under [The MIT License (MIT)][THEMES-NAMESPACE-kawasaki-license]

Copyright (c) 2016 Beau Hastings

[THEMES-NAMESPACE-kawasaki-license]:    /LICENSE
[THEMES-NAMESPACE-kawasaki-fish]:       https://github.com/fish-shell/fish-shell
[THEMES-NAMESPACE-kawasaki-omf]:        https://github.com/oh-my-fish/oh-my-fish
[THEMES-NAMESPACE-kawasaki-screenshot]: https://cloud.githubusercontent.com/assets/195790/20061473/9545bd4c-a4c5-11e6-83da-8b0a954b8a5a.gif
[THEMES-NAMESPACE-kawasaki-bira]:       https://github.com/oh-my-fish/theme-bira
[THEMES-NAMESPACE-kawasaki-dotfiles]:   https://github.com/oh-my-fish/oh-my-fish#dotfiles


# [krisleech](https://github.com/oh-my-fish/theme-krisleech)
#### krisleech

A very simple theme optimized for Git. Less is more.

![krisleech theme](https://f.cloud.github.com/assets/66143/930316/732ea576-0008-11e3-964c-98410709d00c.png)

![krisleech theme](https://f.cloud.github.com/assets/66143/930317/73446046-0008-11e3-8ecb-2abec0058b83.png)

##### Characteristics

* Current working directory
* Branch name
* Dirty working directory (✘)


# [l](https://github.com/oh-my-fish/theme-l)
<div align="center">
  <a href="http://github.com/fish-shell/omf">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> A theme inspired by [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/lambda.zsh-theme)'s [lambda](http://zshthem.es/screenshots/lambda.png) theme.

#### Install

```fish
$ omf theme l
```

#### Features

* Current branch
* Dirty working directory
* Working directory

#### Screenshot

<p align="center">
<img src="http://f.cl.ly/items/2J3M0f2X1j3u471y080I/2.png">
<img src="hhttp://f.cl.ly/items/2S25360U1p360E0D2u2g/3.png">
<img src="http://f.cl.ly/items/1w0s0Q3x3r2Z1F1l011k/4.png">
</p>

#### Configuration

Only if fish_theme_l_right_prompt variable is set true within config.fish:
```fish
set theme_display_rbenv 'yes'
set theme_display_rbenv_gemset 'yes'
### if you want to display rbenv ruby version only within directories that contain Gemfile
set theme_display_rbenv_with_gemfile_only 'yes'
```

* Rbenv Ruby Version
* Rbenv Ruby Gemset

<p align="center">
<img src="http://f.cl.ly/items/0f0k3o2L3y2q1L3g1R1X/5.png">
</p>

### License

[MIT][mit] © [bpinto][author] et [al][THEMES-NAMESPACE-l-contributors]


[THEMES-NAMESPACE-l-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-l-author]:         http://github.com/bpinto
[THEMES-NAMESPACE-l-contributors]:   https://github.com/oh-my-fish/theme-default/graphs/contributors
[omf-link]:       https://www.github.com/fish-shell/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[travis-badge]:   http://img.shields.io/travis/oh-my-fish/theme-default.svg?style=flat-square
[travis-link]:    https://travis-ci.org/oh-my-fish/theme-default



# [lambda](https://github.com/hasanozgan/theme-lambda)
##### Lambda

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<br/>

###### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/hasanozgan/theme-lambda/master/screenshot.png">
</p>

######## Added VirtualEnv Support
![preview](http://i.imgur.com/fWurs47.png)


###### Install

###### [Fisherman]

```fish
fisher i lambda
```

####### [Oh-My-Fish]

```fish
omf install lambda
```

[THEMES-NAMESPACE-lambda-Fisherman]: https://github.com/fisherman/fisherman
[Oh-My-Fish]: https://github.com/oh-my-fish/oh-my-fish


# [lavender](https://github.com/tungpun/fish-theme-lavender)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### lavender
> A elegant theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install lavender
```


#### Features

Based on clearance theme. Display the following bits on the left:
* Username
* Hostname
* Current directory name
* Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
* Git branch and dirty state (if inside a git repo)


#### Screenshot

<p align="center">
<img src="https://i.imgur.com/Z4gjCyU.png">
</p>


### License

[MIT][mit] © [tungpun][author] et [al][THEMES-NAMESPACE-lavender-contributors]


[THEMES-NAMESPACE-lavender-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-lavender-author]:         https://github.com/tungpun/
[THEMES-NAMESPACE-lavender-contributors]:   https://github.com/tungpun/fish-theme-lavender/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [lolfish](https://github.com/er0/lolfish)
### lolfish

such rainbow, wow.

![lolfish][THEMES-NAMESPACE-lolfish-screenshot1]
![lolfish][THEMES-NAMESPACE-lolfish-screenshot2]

#### Easy Install

Using [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish):

```Bash
omf install lolfish
```
#### Less Easy Install

Download and source the prompt file

```Bash
curl -L https://github.com/er0/lolfish/raw/master/lol.fish -o $HOME/.config/fish/functions/lol.fish 
```

#### Features

  * Only the best rainbow xterm colors!
  * git branch/status info
  * Return value from the last command
  * Right prompt displays number of backgrounded jobs, tmux sessions, and the time.

[THEMES-NAMESPACE-lolfish-screenshot1]: http://i.imgur.com/InJELf3.png
[THEMES-NAMESPACE-lolfish-screenshot2]: http://i.imgur.com/v6aI9AB.png


# [mars](https://github.com/oh-my-fish/theme-mars)
#### mars
Based on the eclm theme (which was based on the robbyrussell theme).

![mars theme](https://raw.githubusercontent.com/oh-my-fish/theme-mars/master/screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* Indicates 'master' branch with a distinctive color, encouraging the use of feature-branches (useful when development is done using pull requests)
* If the last command was failed, the indicator would be red, otherwise it's green


# [mish](https://github.com/M4rk9696/theme-mish.git)
<a href="/M4rk9696/theme-mish/master/README.md">Moved Permanently</a>.



# [mokou](https://github.com/oh-my-fish/theme-mokou)
### mokou
possibly the dumbest theme for oh-my-fish

<p align="center">
<img src="http://i.imgur.com/lzjEgeO.png">
</p>

how it's structured: `{directory name} > {prompt}`

```fish
$ omf install mokou
```

[MIT][mit] © [tentakel][author] et [al][THEMES-NAMESPACE-mokou-contributors]


[THEMES-NAMESPACE-mokou-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-mokou-author]:         http://github.com/tentakel
[THEMES-NAMESPACE-mokou-contributors]:   https://github.com/tentakel/mokou/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish


# [mtahmed](https://github.com/oh-my-fish/theme-mtahmed)
#### mtahmed

Minimal theme.

![mtahmed](https://cloud.githubusercontent.com/assets/1272018/5965709/13d07f68-a7f6-11e4-9872-7936516ba258.png)

###### Left prompt

- First 10 characters of hostname if `ssh`'ed
- Current directory name (not path)
- ─╼ (cute little unicode characters)

###### Right prompt

- Exit code of the previous command


# [nai](https://github.com/oh-my-fish/theme-nai)
#### nai
A minimalist fish theme which displays git branch and status information.

![nai](https://cloud.githubusercontent.com/assets/1272018/5961225/116d0a7a-a7d3-11e4-88a6-43da003ddc6c.png)

###### Characteristics

####### Left Prompt

* Truncated CWD (just the current folder name)
* Git branch and dirty state (if applicable)


# [nelsonjchen](https://github.com/nelsonjchen/omf-theme-nelsonjchen)
<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> nelsonjchen theme for [Oh My Fish][omf-link]. Based on re5et in Oh-My-Zsh.

#### Install

```fish
$ omf u nelsonjchen
```

#### Features and Differences

* Pretty colors
* Two line prompt
* Git Prompt using off-the-shelf fish functions
  * Note that the symbology, colors, and features are more than the `zsh` version and they don't match up 1-to-1. For example, checking out a tag will show the tag name in `fish` but the re5et version in `zsh` will simply show the commit ID. This was one such freebie amongst many I just left in while porting since the `fish` script was giving it to me for free anyway. It is still pretty close though.
* Red user prompt if `root`
* 12 hour clock
  * re5et: 24 hour clock
* MM DD YY date format
  * re5et: YY MM DD date format
* Title Setting to the `prompt_pwd` function in fish for screen, tmux, and non-terminal multiplexer.
  * This is derived from [@chgu82837's theme](https://github.com/chgu82837/theme-PastFish/blob/39af8e2885e308501bb0afa9dedab193a8722cfe/fish_prompt.fish#L82-L90)

#### Omissions from the re5et version

* Trimming down the working directory display only works on `~`. The original re5et prompt would also trim based on the current environment variables set. For example, if you had the environment variable `FOO` set to `/usr/local` and you did `cd /usr/local`, you would see `$FOO/` in the prompt as the current working directory. I'm not sure how I would get this working. `fish` does appear to have a condensation function but it goes beyond simple environment variable replacement and I can't figure out how to turn it off.

#### Screenshot

<p align="center">
<img
src="https://cloud.githubusercontent.com/assets/5363/12106487/fe8b3c30-b314-11e5-9cbe-8b0e57dde741.png">
</p>

### License

[MIT][mit] © [Nelson Chen][author] et [al][THEMES-NAMESPACE-nelsonjchen-contributors]


[THEMES-NAMESPACE-nelsonjchen-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-nelsonjchen-author]:         http://github.com/nelsonjchen
[THEMES-NAMESPACE-nelsonjchen-contributors]:   https://github.com/nelsonjchen/omf-theme-nelsonjchen/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[travis-badge]:   http://img.shields.io/travis/nelsonjchen/omf-theme-nelsonjchen.svg?style=flat-square


# [neolambda](https://github.com/ipatch/theme-neolambda)
### NeoLambda

> The unofficial fork of the [omf](https://github.com/oh-my-fish/oh-my-fish) [lambda](https://github.com/hasanozgan/theme-lambda) theme

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<a id="featurecast"></a>

#### Featurecast 🎥

[![asciicast](https://asciinema.org/a/211469.svg)](https://asciinema.org/a/211469)

#### Gif

<details>
<summary>An animated GIF deoming some of the features provided by this theme</summary>
<img src="https://i.imgur.com/qgKd2HV.gif" width="640">
</details>
<br>
<br>

> To avoid [double printing](https://raw.githubusercontent.com/ipatch/theme-lambda/master/lib/virtualenv-double-prompt.png) of the virtualenv name in prompt add the below to `config.fish`

```shell
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
```

<a id="install"></a>

#### Install

<a id="install-omf"></a>

##### [Oh-My-Fish](https://github.com/oh-my-fish/oh-my-fish)

```shell
omf install neolambda
```

#### TODOs

- [ ] experiment with creating an animated svg to replace / complement the animaged gif
  - `cat myrecrod.cast | svg-term --out myrecord.svg --window`


# [numist](https://github.com/oh-my-fish/theme-numist)
See https://github.com/oh-my-fish/theme-numist for details
# [ocean](https://github.com/oh-my-fish/theme-ocean)
#### ocean

A fish theme with ocean in mind.


![Preview](https://cloud.githubusercontent.com/assets/129920/3533761/4702cc78-07d9-11e4-826f-e9f797e4bfa8.png)


Unicode-compatible fonts and terminals is required.

I would recommend iTerm2 + Solarized Dark for Mac users.

This theme is based loosely on [agnoster](https://gist.github.com/agnoster/3712874)

###### Characteristics
* Show a radioactive symbol (☢) when gain the root privileges (It's dangerous!)
* Current python virtualenv (if applicable)
* The anchor (⚓) turns red if the previous command failed
* Full path of current working directory
* Show the Git branch and dirty state (if applicable)
* Show **User@Hostname** if user is not the default user. Set the following two lines in your config.fish to turn on this feature:
    
    ```fish
    set -g theme display_user yes
    set -g default_user your_default_username
    ```

###### Troubleshooting in iTerm
If you see a colored anchor icon instead of the white one, this is because your system font is lacking the anchor icon, and iTerm defaults to the Apple Emoji Font. To get the right icon, either add it to your current font, or chose a powerline font that has it (like Meslo for Powerline, available in https://github.com/powerline/fonts), and select it for your Non-ASCII font.


# [one](https://github.com/rdev/omf-theme-one)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### One v2
> A theme for [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish).

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install one
```

##### Note for macOS users
If you're getting a `expr: syntax error` try expr from coreutils package.

If you're getting an `Array index out of bounds` error run `brew install --with-default-names gnu-sed`.

#### Features

* Git ahead/behind indicator with number of commits
* Git status indicators
* Git branch info
* Abreviated working directory
* Node.js version indicator
* SSH user/hostname information
* Prompt sign turns red if previous command failed
* Prompt sign turns double and yellow in superuser mode

#### Screenshot

<p align="center">
  <a href="http://stuffs.fivepointseven.com/i/fish-one-screenshot.png">
    <img src="http://stuffs.fivepointseven.com/i/fish-one-screenshot.png">
  </a>
</p>


Forked from [Toaster](https://github.com/oh-my-fish/theme-toaster)

Aesthetic stolen from [Pure](https://github.com/sindresorhus/pure)

### License

[MIT][THEMES-NAMESPACE-one-mit] © [Max Rovensky](http://github.com/rdev)


[THEMES-NAMESPACE-one-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-one-author]:         https://github.com/rdev

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [pastfish](https://github.com/chgu82837/theme-PastFish)
<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> pastfish theme for [Oh My Fish][omf-link].

#### Install


```fish
$ omf u pastfish
```

#### Features

* Random greeting message
* Command prompts colored based on time (morning is blue, afternoon is green, midnight is red ...)
* The `>` at the end of each prompt will turn yellow if the git repo is dirty, red if current location is not writable

#### Screenshot

<p align="center">
<img src="http://i.imgur.com/YVM1Xo2.png">
</p>

### License

[MIT][mit] © [chgu82837][author] et [al][THEMES-NAMESPACE-pastfish-contributors]


[THEMES-NAMESPACE-pastfish-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-pastfish-author]:         http://github.com/chgu82837
[THEMES-NAMESPACE-pastfish-contributors]:   https://github.com/chgu82837/pastfish/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[travis-badge]:   http://img.shields.io/travis/chgu82837/pastfish.svg?style=flat-square
[travis-link]:    https://travis-ci.org/chgu82837/pastfish


# [perryh](https://github.com/oh-my-fish/theme-perryh)
#### perryh

This is similar to godfat's gitstatus theme, but mainly includes red, white, cyan, and yellow.

![perryh](http://perryhuang.com/stuff/perryh_fish.png)


# [pie](https://github.com/grissius/theme-pie)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### 🥧 πie
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)


<br/>

A minimalist developer-friendly shell prompt for fish shell

#### Install

```fish
$ omf install pie
$ omf theme pie
```

#### Features

* 🎨 Native colors (changes with your preferences)
* ⏰ Human readable execution time of last command
* 📂 Shortened cwd
* ✅ Last status success
* 🔁 Git status
    - Current branch
    - Untracked files `?`
    - Stashed changes `$`
    - Dirty working directory `●`
    - Staged files `⨯`
    - Upstream status `🠋`, `🠉`


#### Screenshot

<p align="center">
<img src="https://i.imgur.com/UQKCSsm.gif">
</p>


### License

[MIT][mit] © [Jaroslav Šmolík][author] et [al][THEMES-NAMESPACE-pie-contributors]


[THEMES-NAMESPACE-pie-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-pie-author]:         https://github.com/grissius
[THEMES-NAMESPACE-pie-contributors]:   https://github.com/grissius/theme-pie/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [plain](https://github.com/changyuheng/theme-plain)
[![Slack Room][slack-badge]][slack-link]

### plain

Colorful git-aware plain text prompt

<p align="center">
<img src="https://raw.githubusercontent.com/changyuheng/fish-theme-plain/master/screenshot.png">
</p>

#### Features

* No need to use a patched font
* Colorful
* Not folding path
* Detecting remote logged in and UID
* Integrates Git

#### Install

With [Fisherman]

```
fisher i plain
```

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://img.shields.io/badge/slack-join%20the%20chat-00B9FF.svg?style=flat-square
[THEMES-NAMESPACE-plain-Fisherman]: https://github.com/fisherman/fisherman


# [pure](https://github.com/rafaelrinaldi/theme-pure)
> ##### ✋ Psst! Migrating from v1.x to v2.x? We got you. Check our [**migration guide**](https://github.com/rafaelrinaldi/pure/releases/tag/v2.0.0) and happy upgrading

### pure [![github-ci-badge]][github-ci-link] ![fish-3]

> Pretty, minimal and fast Fish 🐟 prompt, ported from [`zsh`](https://github.com/sindresorhus/pure).

<div align=center>
  <a href="https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/be014be282ef66e5c5cad19458aa61d7df6865ecbe55bcc882e0d53580f81de9/68747470733a2f2f692e696d6775722e636f6d2f424878556f68522e706e67 alt="Pure with dark colorscheme"></a>
  <a href="https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67" target=blank><img width=440 src=https://camo.githubusercontent.com/5934e8c1d3b5f9218d05d5e1741e23963a7803d6098236d36e586336a6c6a5b7/68747470733a2f2f692e696d6775722e636f6d2f714a646f6e716f2e706e67 alt="Pure with light colorscheme"></a>
</div>

#### :rocket: Install

**:warning: requirements**: fish `≥3.x`

##### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher install rafaelrinaldi/pure
```

##### Manually

Via [cURL](https://curl.haxx.se):

```sh
### Download the installer to `/tmp`
curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
### Source and trigger the installer
source /tmp/pure_installer.fish; and install_pure
```

#### Features

Fully **customizable** (colors, symbols and features):

- Excellent prompt character `❯` :
  - Change `❯` to red when previous command has failed ;
  - Start prompt with _current working directory_ 🏳️ ;
  - Compact-mode (single-line prompt) 🏳️ ;
- Display current directory tail ;
- check for new release on start 🏳️ ;
- Display _username_ and _hostname_ when in an `SSH` session ;
- Display command _duration_ when longer than `5` seconds ;
- Display `Python` _virtualenv_ when activated ;
- Display `VI` mode and custom symbol for non-insert mode 🏳️ ;
- Show system time 🏳️ ;
- Show number of running jobs 🏳️ ;
- Prefix when `root` 🏳️ ;
- Display `git` branch name 🏳️ ;
  - Display `*` when `git` repository is _dirty_ ;
  - Display `≡` when `git` repository is _stashed_ ;
  - Display `⇡` when branch is _ahead_ (commits to push) ;
  - Display `⇣` when branch is _behind_ (commits to pull) ;
- Update terminal title with _current folder_ and _command_ ;

#### :paintbrush: Configuration

You can tweak `pure` behavior and color by changing [universal variables](https://fishshell.com/docs/current/tutorial.html#tut_universal) either directly in the terminal, _e.g._:

    set --universal pure_show_system_time true
    set --universal pure_color_system_time pure_color_mute

or changing the defaults in your `config.fish`, _e.g._:

    _pure_set_default pure_show_system_time false
    _pure_set_default pure_color_system_time grey --reverse

##### Prompt Symbol

| Option                                 | Default | Description                                          |
| :------------------------------------- | :------ | :--------------------------------------------------- |
| **`pure_symbol_git_dirty`**            | `*`     | Repository is Dirty (uncommitted/untracked changes). |
| **`pure_symbol_git_stash`**            | `≡`     | Repository git stash status.                         |
| **`pure_symbol_git_unpulled_commits`** | `⇣`     | Branch is behind upstream (commits to pull).         |
| **`pure_symbol_git_unpushed_commits`** | `⇡`     | Branch is ahead upstream (commits to push).          |
| **`pure_symbol_prefix_root_prompt`**   | `#`     | Prefix prompt when logged in as `root`.              |
| **`pure_symbol_prompt`**               | `❯`     | Prompt symbol.                                       |
| **`pure_symbol_reverse_prompt`**       | `❮`     | VI non-insert mode symbol.                           |
| **`pure_symbol_title_bar_separator`**  | `-`     | Separator in terminal's windows title.               |

> :information_source: Need [safer `git` symbols](https://github.com/sindresorhus/pure/wiki#safer-symbols)?

##### 🔌 Features' Flags

| Option                                         | Default | Description                                                                                     |
| :--------------------------------------------- | :------ | :---------------------------------------------------------------------------------------------- |
| **`pure_begin_prompt_with_current_directory`** | `true`  | `true`: _`pwd` `git`, `SSH`, duration_.<br/>`false`: _`SSH` `pwd` `git`, duration_.             |
| **`pure_check_for_new_release`**               | `false` | `true`: check repo for new release (on every shell start)                                       |
| **`pure_enable_git`**                          | `true`  | Show info about Git repository.                                                                 |
| **`pure_enable_single_line_prompt`**           | `false` | `true`: Compact prompt as a single line                                                         |
| **`pure_reverse_prompt_symbol_in_vimode`**     | `true`  | `true`: `❮` indicate a non-insert mode.<br/>`false`: indicate vi mode with `[I]`, `[N]`, `[V]`. |
| **`pure_separate_prompt_on_error`**            | `false` | Show last command [exit code as a separate character][exit-code].                               |
| **`pure_show_jobs`**                           | `false` | Show Number of running jobs                                                                     |
| **`pure_show_prefix_root_prompt`**             | `false` | `true`: shows prompt prefix when logged in as `root`.                                           |
| **`pure_show_subsecond_command_duration`**     | `false` | Show subsecond (ex. 1.5s) in command duration.                                                  |
| **`pure_show_system_time`**                    | `false` | `true`: shows system time before the prompt symbol (as `%H:%M:%S`).                             |
| **`pure_threshold_command_duration`**          | `5`     | Show command duration when above this value (seconds).                                          |

##### 🎨 Colours

> :information_source: See [`set_color`][fish-set-color] documentation for full possibilities.

> :warning: The absence of `$` sign is expected in `pure_` named colours.

| Base Color               | Inherited by                                                                                                                                                                                                                  | Default   |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------- |
| **`pure_color_danger`**  | **`pure_color_prompt_on_error`**                                                                                                                                                                                              | `red`     |
| **`pure_color_dark`**    |                                                                                                                                                                                                                               | `black`   |
| **`pure_color_info`**    | **`pure_color_git_unpulled_commits`**<br>**`pure_color_git_unpushed_commits`**                                                                                                                                                | `cyan`    |
| **`pure_color_light`**   | **`pure_color_ssh_user_root`**                                                                                                                                                                                                | `white`   |
| **`pure_color_mute`**    | **`pure_color_git_branch`**<br>**`pure_color_git_dirty`**<br>**`pure_color_git_stash`**<br>**`pure_color_ssh_hostname`**<br>**`pure_color_ssh_separator`**<br>**`pure_color_ssh_user_normal`**<br>**`pure_color_virtualenv`** | `brblack` |
| **`pure_color_normal`**  | **`pure_color_jobs`**                                                                                                                                                                                                         | `normal`  |
| **`pure_color_primary`** | **`pure_color_current_directory`**                                                                                                                                                                                            | `blue`    |
| **`pure_color_success`** | **`pure_color_prompt_on_success`**                                                                                                                                                                                            | `magenta` |
| **`pure_color_warning`** | **`pure_color_command_duration`**                                                                                                                                                                                             | `yellow`  |

#### :+1:  Contribute

> **requirements:** [`docker`](https://docs.docker.com/install/) (isolate from your environment)

Specify the [`FISH_VERSION`][fish-releases] you want, and the `CMD` executed by the container:

    make build-pure-on FISH_VERSION=3.1.2
    make dev-pure-on FISH_VERSION=3.1.2 CMD="fishtape tests/*.test.fish"

#### :man_technologist: Maintainer

- [Édouard Lopez](https://github.com/edouard-lopez)

#### :clap: Thanks

* [@andreiborisov](https://github.com/andreiborisov) for the [docker images][docker-images] ;
* [@jorgebucaran](https://github.com/jorgebucaran/) for [fishtape](https://github.com/jorgebucaran/fishtape) ;
* [@rafaelrinaldi](https://github.com/rafaelrinaldi/pure) for starting the project ;

#### :classical_building: License

[MIT][THEMES-NAMESPACE-pure-MIT]

[github-ci-link]: <https://github.com/rafaelrinaldi/pure/actions> "Github CI"
[github-ci-badge]: <https://github.com/rafaelrinaldi/pure/workflows/Run%20tests%20on%20CI/badge.svg>
[fish-3]: <https://img.shields.io/badge/fish-v3-007EC7.svg?style=flat-square> "Support Fish 3"
[exit-code]: <https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character> "See pure-zsh wiki"
[fish-releases]: https://github.com/fish-shell/fish-shell/releases
[docker-images]: https://github.com/andreiborisov/docker-fish/
[THEMES-NAMESPACE-pure-MIT]: LICENSE.md
[fish-set-color]: https://fishshell.com/docs/current/cmds/set_color.html


# [pygmalion](https://github.com/corevo/theme-pygmalion)
#### pygmalion theme

A minimal theme forked from the [cbjohnson](https://github.com/oh-my-fish/theme-cbjohnson) theme

Based on the zsh theme [pygmalion](https://github.com/robbyrussell/oh-my-zsh/wiki/themes#pygmalion)

![screenshot](https://cloud.githubusercontent.com/assets/888886/12481015/051b2096-c04f-11e5-962b-7c1a31c9ff8b.png)


# [random](https://github.com/tycho01/theme-random)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### random
> A 'theme' for [Oh My Fish][omf-link] that loads a random theme.


[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install random
```


### License

[MIT][mit] © [Tycho Grouwstra][author] et [al][THEMES-NAMESPACE-random-contributors]


[THEMES-NAMESPACE-random-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-random-author]:         https://github.com/{{USER}}
[THEMES-NAMESPACE-random-contributors]:   https://github.com/{{USER}}/theme-random/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [randomrussel](https://github.com/lightify97/randomrussel)
#### randomrussell

A colorful robbyrussel clone.


![randomrussell theme](https://github.com/lightify97/randomrussel/blob/master/randomrussel.png)
![randomrussel theme](https://github.com/lightify97/randomrussel/blob/master/randomrussel_2.png)

###### Characteristics

* Displays git information in the command prompt when available.
* If the last command was failed, the indicator would be a red cross, otherwise it's a colored dollar sign.

##### Note

You will need [powerline](https://github.com/powerline/fonts
) or [nerd](https://github.com/ryanoasis/nerd-fonts
) font to display unicode characters correctly.

You can download "D2Coding" powerline+nerdfont patched font [here](http://bit.ly/2pLiQku)


# [red-snapper](https://github.com/oh-my-fish/theme-red-snapper)
### RED SNAPPER
![Red Snapper](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/redsnapper.jpg)

#### ><}}*> F E A T U R E S
+ Directory path
+ Git branch name
+ Git status
+ YOUR OWN PET FISH!

#### ><}}*> GIT STATUS
##### Untracked changes
Your pet will detect if you added files, but didn't track them. He will open his mouth, hungry of yummy commits!
![fish shell untracked changes](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/hungry2.png)

After you commit, he will close his mouth, satiated.
![fish shell commited](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/fed.png)

##### Can't find .git
Something is fishy here! If you are not inside a Git working directory, your pet will go to sleep.
![fish shell not using git](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/fishy.png)



# [redfish](https://github.com/redxtech/redfish)
### [redfish][repo-link]
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)


#### Install

```fish
$ omf install redfish
```

#### Features

* Current Directory shown in prompt.
* Full path shown in right prompt.
* Git branch and status shown.
* Show exit status in right prompt.
* Show current time in right prompt.
* Set title to current prompt.
* More!

#### Screenshot

<p align="center">
<img src="https://i.imgur.com/H9crBDc.png" alt="Image in which I meant to exclude -rf to show the exit code of a failed command">
</p>


#### Author

**redfish** © [redxtech][author], Released under the [MIT][THEMES-NAMESPACE-redfish-mit] License.

[THEMES-NAMESPACE-redfish-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-redfish-author]:         https://github.com/redxtech
[omf-link]:       https://github.com/oh-my-fish/oh-my-fish
[repo-link]:      https://github.com/redxtech/redfish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [rider](https://github.com/rideron89/rider-theme)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### rider
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install rider
```


#### Features

* Current username
* Shortened current working directory
* Last command status code indicator (green arrow on success, red on failure)
* Current git branch (red on master, yellow on develop, green otherwise)
* Execution time of the previous command on the right prompt


#### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/rideron89/rider-theme/master/screenshot.png">
</p>


### License

[MIT][mit] © [Ron Rider][author] et [al][THEMES-NAMESPACE-rider-contributors]


[THEMES-NAMESPACE-rider-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-rider-author]:         https://github.com/rideron89
[THEMES-NAMESPACE-rider-contributors]:   https://github.com/rideron89/rider-theme/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [robbyrussell](https://github.com/oh-my-fish/theme-robbyrussell)
#### robbyrussell
The default theme – cloned from oh-my-zsh.

![robbyrussell theme](https://bachue.github.io/oh-my-fish/images/robbyrussell-screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* If the last command was failed, the indicator would be red, otherwise it's green


# [sashimi](https://github.com/isacikgoz/sashimi)
### Sashimi

[![Releases](https://img.shields.io/github/release/isacikgoz/sashimi.svg?label=latest)](https://github.com/isacikgoz/sashimi/releases)
[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)

A minimal [fish shell](https://github.com/fish-shell/fish-shell) prompt made of raw fish.

Sashimi uses your prompt real estate as low as possible. It focuses on only required information. Along with being minimalist, the error codes are shown to user so that you can start to debug from a better point. See the features list for more detailed information.

<p align="center">
   <img src="images/preview.png" alt="screenshot"/>
</p>

#### Features

- Compatible with fish 3.0+
- Sleek
  - Displays only the parent directory instead of the entire working directory
- Git Support
  - Shows clean/dirty status
  - Shows branch ahead/behind information
  - Discourages working on master branch
- Informative When Required
  - Shows error exit status in red

##### Installation

You can install sashimi by cloning this repository and linking the `fish_prompt.fish` file to your `~/.config/fish/functions` directory or any directory in your fish functions path.

```shell
git clone https://github.com/isacikgoz/sashimi
cd sashimi
ln -s fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
```

If you are using a package manager, you have the following options:

- Using [Fisher](https://github.com/jorgebucaran/fisher):
  ```shell
  fisher add isacikgoz/sashimi
  ```
- Or, if you prefer [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish):
  ```shell
  omf install sashimi
  ```

#### Credits

This prompt was inspired by other promps such as:

- [robbyrussell](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme)
- [sorin](https://github.com/fish-shell/fish-shell/tree/master/share/tools/web_config/sample_prompts)
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish)

#### License

[MIT](LICENSE)


# [scorphish](https://github.com/oh-my-fish/theme-scorphish)
#### Scorphish

Compact. Sufficient.

![scorphish](https://user-images.githubusercontent.com/2112697/60178902-def52b80-97f2-11e9-961d-0f7c115ccc49.png)

##### Left prompt

Abbreviated path, Ruby version and gemset, Python version and virtualenv, Rust
version, NodeJS version, Git information and last command execution time.

###### Configuration:

The following options can be added to `~/.config/fish/conf.d/omf.fish` to change
the appearance and behavior of left prompt.

 * To display current Rust version:

```fish
set -g theme_display_rust yes
```

 * To display current Node version:

```fish
set -g theme_display_node yes
```

> Note: Node version may be lazy loaded depending on which nvm plugin you're
> using

 * To display current working directory on a second line:

```fish
set -g theme_display_pwd_on_second_line yes
```

 * To display Git information on the first line:

```fish
set -g theme_display_git_on_first_line yes
```

 * To omit only dirty status of current local Git repository and have
   a faster prompt:

```fish
set -g theme_display_git_dirty no
```

 * To omit information of current Git repository altogether:

```fish
set -g theme_display_git no

```

 * To omit current Ruby version and gemset:

```fish
set -g theme_display_ruby no

```

 * To omit current Python version and virtualenv:

```fish
set -g theme_display_virtualenv no

```

##### Right prompt

Last command's exit code and current time

##### Acknowledgments

This theme is based on Zish and Coffeandcode themes, many thanks to their
authors!

Enjoy!


# [shellder](https://github.com/simnalamburt/shellder)
<img align=left width=175px height=175px
src="https://raw.githubusercontent.com/simnalamburt/i/master/shellder/shellder.png">

shellder

1. **No solarized** ― xterm256 colors are beautiful enough
2. **zsh** + **fish** support
3. **Speed** ― Carefully optimized for slow environments like MSYS2

![screenshot image of shellder](https://raw.githubusercontent.com/simnalamburt/i/master/shellder/screenshot.png)

Installation
--------
You can install shellder via various plugin managers.

##### Zsh, [zinit]
```zsh
### ~/.zshrc
zinit light simnalamburt/shellder
```

##### Fish, [chips]
```yaml
### ~/.config/chips/plugin.yaml
github:
- simnalamburt/shellder
```

##### Fish, [oh-my-fish]
```yaml
### ~/.config/chips/plugin.yaml
github:
- simnalamburt/shellder
```

&nbsp;

Configuration
-------
You can turn off Fish-like path shrinking by adding the following to your `~/.zshrc`:

```zsh
### ~/.zshrc
export SHELLDER_KEEP_PATH=1
```

&nbsp;

#### Fonts
You'll need a powerline patched font. If you don't have one, download one or
patch some fonts on you own.

- https://github.com/powerline/fonts
- https://github.com/ryanoasis/nerd-fonts

&nbsp;

--------
*shellder* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[THEMES-NAMESPACE-shellder-zinit]: https://github.com/zdharma/zinit
[THEMES-NAMESPACE-shellder-chips]: https://github.com/xtendo-org/chips
[oh-my-fish]: https://github.com/oh-my-fish/oh-my-fish
[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[THEMES-NAMESPACE-shellder-COPYRIGHT]: COPYRIGHT


# [simple-ass-prompt](https://github.com/lfiolhais/theme-simple-ass-prompt)
<img
src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg"
align="left" width="144px" height="144px"/>

###### simple-ass-prompt
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

#### Install

```fish
$ omf install simple-ass-prompt
```

#### Features
This is [Mathias Bynens][THEMES-NAMESPACE-simple-ass-prompt-mths] Bash prompt ported to Fish with a few changed
icons and added functionalities. As he put it:


> Shell prompt based on the Solarized Dark theme.
> Screenshot: http://i.imgur.com/EkEtphC.png

> Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles

> iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

Features:

- A dirty state of the branch is displayed by `!`
- Untracked files are displayed by `☡`
- The existence of a stash is displayed by `↩`
- A clean branch is displayed by `✓`
- The branch is ahead with `+`
- The branch is behind with `-`
- The branch has diverged from upstream `±`
- Support for Pythons virtual environments
- Support Rust active toolchain
- The last command failed is displayed with `↪` in red

#### Screenshot
Git Usage
<p align="center">
<img src="http://cl.ly/1G0Z2j3A0C1Q/Screen%20Recording%202015-12-16%20at%2010.09%20pm.gif">
</p>

[VirtualFish][THEMES-NAMESPACE-simple-ass-prompt-vf] Usage
<p align="center">
<img src="http://cl.ly/image/1Y36043M2U3M/simple_ass_prompt_virtual.png">
</p>

#### Configuration
You can change the greeting message with:
```fish
set -g simple_ass_prompt_greeting MyGreeting
```

### License

[MIT][mit] © [lfiolhais][author] et [al][THEMES-NAMESPACE-simple-ass-prompt-contributors]


[THEMES-NAMESPACE-simple-ass-prompt-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-simple-ass-prompt-author]:         http://github.com/lfiolhais
[THEMES-NAMESPACE-simple-ass-prompt-contributors]:   https://github.com/lfiolhais/simple_ass_prompt/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[THEMES-NAMESPACE-simple-ass-prompt-mths]: https://github.com/mathiasbynens/dotfiles
[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[THEMES-NAMESPACE-simple-ass-prompt-vf]: https://github.com/adambrenecki/virtualfish


# [simplevi](https://github.com/oh-my-fish/theme-simplevi)
fish_prompt-simplevi


The stock prompt with the vi indicator appended.
It is meant to be used with the `vi-mode` plugin.

Screenshots:

![normal mode](https://raw.github.com/syl20bnr/fish_prompt-simplevi/master/prompt_fish-simplevi-n.png)

![insert mode](https://raw.github.com/syl20bnr/fish_prompt-simplevi/master/prompt_fish-simplevi-i.png)



# [slacker](https://github.com/maqboolkhan/omf-theme-slacker)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### slacker
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install slacker
```


#### Features

* Dead simple with git status and date & time!


#### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/maqboolkhan/omf-theme-slacker/master/1.png">
</p>


### License

[MIT][mit] © [Maqbool ur Rahim Khan][THEMES-NAMESPACE-slacker-author]


[THEMES-NAMESPACE-slacker-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-slacker-author]:         https://github.com/{{USER}}
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [slavic-cat](https://github.com/yangwao/omf-theme-slavic-cat)
### Slavic Cat

A fish (shell) theme with a Slavic cat and a rainbow that signifies git status.


[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)

![Slavic cat in action](https://github.com/yangwao/omf-theme-slavic-cat/blob/master/screenshot.png?raw=true)


#### Instalation

###### Requirements
* [Fish shell](https://github.com/fish-shell/fish-shell) - a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family
* [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) - The Fishshell Framework

Once Oh My Fish is installed:

    omf install slavic-cat
    
[forked from Toaster](https://github.com/oh-my-fish/theme-toaster)

#### Features

 * Minimal Look & Prompt
 * Current short version pwd
 * Display branch for Git projects
 * Git project dirty status indicator *meow* **(R,C,A,U,M,?)** *meow*
 * Fish shell vi mode indicator
 * Next line prompt
 * Two unicodes included!


# [solarfish](https://github.com/MrSiliconGuy/theme-solarfish)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### theme-solarfish
> A simple, git-aware, two-line theme for [Oh My Fish][omf-link]. Based off of [simple-ass-prompt](https://github.com/lfiolhais/theme-simple-ass-prompt) and optimized for [solarized](https://ethanschoonover.com/solarized/).

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.0.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
$ omf install theme-solarfish
```


#### Features

- Easy to read prompt, based directly on the bash default prompt
- Long, short, and current folder directory options
- Timestamp option
- Git repository status:
  - ahead "↑"
  - behind "↓"
  - diverged "⥄ "
  - dirty "*"
- Previous command status
- Special greeting prompt if `cowsay` is installed!


#### Screenshot

<p align="center">
<img src="./screenshot.png">
</p>

#### Configuration

Add any of the following lines to
`~/.config/fish/config.fish`

```fish
### Displays the timestamp in the prompt
set -g theme_show_time yes

### Uses a short directory path name
set -g theme_short_path yes

### Displays only the current folder name
set -g theme_current_folder_path yes
```

### License

[MIT][mit] © [thesilican][THEMES-NAMESPACE-solarfish-author]


[THEMES-NAMESPACE-solarfish-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-solarfish-author]:         https://github.com/thesilican
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [spacefish](https://github.com/matchai/spacefish)
<h1 align="center">
  <a href="https://github.com/starship/starship">
    <img alt="Focus has shifted to the development of Starship, the successor to Spacefish. If you are interested in contributing or using it, come take a look!" src="./images/starship-notice.svg" width="100%">
  </a><br><br>
  <a href="https://github.com/matchai/spacefish">
    <img alt="spacefish fish shell theme" src="./images/banner.svg" width="100%">
  </a>
  <br>
  <br> Spacefish 🚀🐟 <br>
</h1>

<h4 align="center">
  <a href="https://fishshell.com" target="_blank"><code>Fish Shell</code></a> prompt for Astronauts.
</h4>

<p align="center">
  <a href="https://travis-ci.org/matchai/spacefish">
    <img src="https://badgen.net/travis/matchai/spacefish/master"
      alt="Mac OSX & Linux CI Status" />
  </a>
  <a href="https://fishshell.com/">
  <img src="https://badgen.net/badge/fish/v3.0.2"
    alt="Fish Version" />
  </a>
  <a href="https://github.com/matchai/spacefish/blob/master/LICENSE">
    <img src="https://badgen.net/github/license/matchai/spacefish" alt="GitHub License">
  </a>
</p>

<div align="center">
  <h4>
    <a href="https://spacefish.matchai.dev/">Website</a> |
    <a href="#installation">Install</a> |
    <a href="#features">Features</a> |
    <a href="./docs/Options.md">Options</a> |
    <a href="./docs/API.md">API</a>
  </h4>
</div>

<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://matchai.dev">Matan Kushner</a> and
  <a href="#contributors">contributors </a></sub>
  <br>
  <sub>A port of <a href="https://github.com/denysdovhan/spaceship-prompt">Spaceship ZSH</a> by
  <a href="https://denysdovhan.com/">Denys Dovhan</a></sub>
</div>

<br>
Spacefish is a minimalistic, powerful and extremely customizable <a href="https://fishshell.com">Fish Shell</a> prompt. It combines everything you may need for convenient work, without unnecessary complications, like a real spacefish.

<p align="center"></p>
  <img alt="Spaceship with Hyper and One Dark" src="./images/preview.gif" width="980px">
</p>

<sub>Vist <a href="./docs/Troubleshooting.md#why-doesnt-my-prompt-look-like-the-preview">Troubleshooting</a> for instructions to recreate this terminal setup.</sub>

#### Features

* Clever hostname and username displaying.
* Indicator if user is root.
* Prompt character turns red if the last command exits with non-zero code.
* Current Git branch and rich repo status:
  * `?` — untracked changes;
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `»` — renamed files;
  * `✘` — deleted files;
  * `$` — stashed changes;
  * `=` — unmerged changes;
  * `⇡` — ahead of remote branch;
  * `⇣` — behind of remote branch;
  * `⇕` — diverged changes.
* Indicator for jobs in the background (`✦`).
* Current Node.js version, through nvm/nodenv/n (`⬢`).
* Current Docker version and connected machine (`🐳`).
* Current Ruby version, through rvm/rbenv/chruby/asdf (`💎`).
* Current Go version (`🐹`).
* Current PHP version (`🐘`).
* Current Rust version (`𝗥`).
* Current version of Haskell GHC Compiler, defined in stack.yaml file (`λ`).
* Current Julia version (`ஃ`).
* Current Amazon Web Services (AWS) profile (`☁️`) ([Using named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)).
* Current Python virtualenv.
* Current Conda version (`🅒`).
* Current Elixir Version (`💧`).
* Current Python pyenv (`🐍`).
* Current .NET SDK version, through dotnet-cli (`.NET`).
* Current Kubectl context (`☸️`).
* Package version, if there is a package in current directory (`📦`).
* Current battery level and status:
  * `⇡` - charging;
  * `⇣` - discharging;
  * `•` - fully charged.
* Current Vi-mode mode.
* Optional exit-code of last command.
* Optional time stamps 12/24hr in format.
* Execution time of the last command if it exceeds 5 seconds.

Want more features? Please [open an issue](https://github.com/matchai/spacefish/issues/new?template=Feature_request.md) or send pull request!

#### Requirements

To get spacefish working correctly, you will need:

* [`fish`][THEMES-NAMESPACE-spacefish-fish] (v2.7.0 or newer)
* [Powerline Font](https://github.com/powerline/fonts) must be installed and enabled in your terminal.

#### Installation

##### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
$ fisher install matchai/spacefish
```

##### [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish)

```fish
$ omf install spacefish
```

#### Customization

Spacefish works really well out of the box, but you can customize your fish to your heart's content!

* [**Options**](./docs/Options.md) — Tweak section's behavior with tons of options.

You have the ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

#### Troubleshooting

Having issues? Take a look at our [Troubleshooting](./docs/Troubleshooting.md) page.

Still struggling? Please [file an issue](https://github.com/matchai/spacefish/issues/new?template=Support_question.md), describe your problem, and we will gladly help you.

#### Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table>
  <tr>
    <td align="center"><a href="https://twitter.com/matchai"><img src="https://avatars0.githubusercontent.com/u/4658208?v=4" width="100px;" alt="Matan Kushner"/><br /><sub><b>Matan Kushner</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Amatchai" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Documentation">📖</a> <a href="#review-matchai" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Tests">⚠️</a> <a href="#tool-matchai" title="Tools">🔧</a> <a href="#design-matchai" title="Design">🎨</a></td>
    <td align="center"><a href="https://github.com/sirMerr"><img src="https://avatars2.githubusercontent.com/u/11183523?v=4" width="100px;" alt="Tiffany Le-Nguyen"/><br /><sub><b>Tiffany Le-Nguyen</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3AsirMerr" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Documentation">📖</a> <a href="#review-sirMerr" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/Snuggle"><img src="https://avatars0.githubusercontent.com/u/26250962?v=4" width="100px;" alt="Snuggle"/><br /><sub><b>Snuggle</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3ASnuggle" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Documentation">📖</a> <a href="#review-Snuggle" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/jskrnbindra"><img src="https://avatars2.githubusercontent.com/u/11844760?v=4" width="100px;" alt="Jaskaran Bindra"/><br /><sub><b>Jaskaran Bindra</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://labun.me"><img src="https://avatars3.githubusercontent.com/u/6306918?v=4" width="100px;" alt="Konstantin Labun"/><br /><sub><b>Konstantin Labun</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://medium.com/@kyleholzinger"><img src="https://avatars0.githubusercontent.com/u/2652762?v=4" width="100px;" alt="Kyle Holzinger"/><br /><sub><b>Kyle Holzinger</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=kyleholzinger" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=kyleholzinger" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/salmanulfarzy"><img src="https://avatars0.githubusercontent.com/u/10276208?v=4" width="100px;" alt="Salmanul Farzy"/><br /><sub><b>Salmanul Farzy</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=salmanulfarzy" title="Code">💻</a> <a href="#review-salmanulfarzy" title="Reviewed Pull Requests">👀</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://owais.lone.pw"><img src="https://avatars0.githubusercontent.com/u/46186?v=4" width="100px;" alt="owais"/><br /><sub><b>owais</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=owais" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=owais" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=owais" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/ladysamantha"><img src="https://avatars3.githubusercontent.com/u/35412203?v=4" width="100px;" alt="Samantha Enders"/><br /><sub><b>Samantha Enders</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://evanrelf.com"><img src="https://avatars2.githubusercontent.com/u/887196?v=4" width="100px;" alt="Evan Relf"/><br /><sub><b>Evan Relf</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=evanrelf" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=evanrelf" title="Documentation">📖</a></td>
    <td align="center"><a href="https://jasonet.co"><img src="https://avatars1.githubusercontent.com/u/10660468?v=4" width="100px;" alt="Jason Etcovitch"/><br /><sub><b>Jason Etcovitch</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=JasonEtco" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=JasonEtco" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/hrvoj3e"><img src="https://avatars0.githubusercontent.com/u/4988133?v=4" width="100px;" alt="hrvoj3e"/><br /><sub><b>hrvoj3e</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Ahrvoj3e" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=hrvoj3e" title="Code">💻</a></td>
    <td align="center"><a href="http://newmaniese.com"><img src="https://avatars1.githubusercontent.com/u/64894?v=4" width="100px;" alt="Michael Newman"/><br /><sub><b>Michael Newman</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Anewmaniese" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/k-lyda"><img src="https://avatars0.githubusercontent.com/u/6491400?v=4" width="100px;" alt="Konrad"/><br /><sub><b>Konrad</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Ak-lyda" title="Bug reports">🐛</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/dubnev"><img src="https://avatars1.githubusercontent.com/u/3227558?v=4" width="100px;" alt="Will Neville"/><br /><sub><b>Will Neville</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Adubnev" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/danieltrautmann"><img src="https://avatars1.githubusercontent.com/u/4022138?v=4" width="100px;" alt="Daniel Trautmann"/><br /><sub><b>Daniel Trautmann</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=danieltrautmann" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Menturan"><img src="https://avatars0.githubusercontent.com/u/16061385?v=4" width="100px;" alt="Jonas Öhlander"/><br /><sub><b>Jonas Öhlander</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3AMenturan" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://twitter.com/lynzt"><img src="https://avatars1.githubusercontent.com/u/3099491?v=4" width="100px;" alt="lindsay"/><br /><sub><b>lindsay</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=lynzt" title="Documentation">📖</a></td>
    <td align="center"><a href="http://www.bradcypert.com"><img src="https://avatars0.githubusercontent.com/u/1455979?v=4" width="100px;" alt="Brad"/><br /><sub><b>Brad</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=bradcypert" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/nammn"><img src="https://avatars3.githubusercontent.com/u/23652004?v=4" width="100px;" alt="Nam Nguyen"/><br /><sub><b>Nam Nguyen</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=nammn" title="Code">💻</a></td>
    <td align="center"><a href="http://www.halostatue.ca/"><img src="https://avatars3.githubusercontent.com/u/11361?v=4" width="100px;" alt="Austin Ziegler"/><br /><sub><b>Austin Ziegler</b></sub></a><br /><a href="#review-halostatue" title="Reviewed Pull Requests">👀</a></td>
  </tr>
  <tr>
    <td align="center"><a href="http://kouk.surukle.me"><img src="https://avatars1.githubusercontent.com/u/456007?v=4" width="100px;" alt="Konstantinos Koukopoulos"/><br /><sub><b>Konstantinos Koukopoulos</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=kouk" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=kouk" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

#### License

MIT © [Matan Kushner](http://matchai.dev)

<!-- Links -->

[THEMES-NAMESPACE-spacefish-spaceship]: https://github.com/denysdovhan/spaceship-prompt
[THEMES-NAMESPACE-spacefish-fish]: https://fishshell.com
[THEMES-NAMESPACE-spacefish-zsh]: http://zsh.org


# [sushi](https://github.com/umayr/theme-sushi)
<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> 🍣 Sushi theme for [Oh My Fish][omf-link].

#### Install

```fish
$ omf install sushi
```

#### Features

* Minimal Prompt.
* Git Support.
* Displays `^` when there are stashed changes.
* Displays `*` when there are any changes to files already being tracked in the repo.
* Displays current branch name.
* Branch name color changes when there are staged changes.
* Displays selected or default terraform workspace.
* Displays number of commits current branch is ahead/behind in each remote.
* By default it shows only the name of the current directory but it provides a flag `theme_complete_path` to display abbreviated current working directory instead.
* Displays Time.
* Support for Terraform
* Support for Kubernetes

#### Screenshot

![Screenshot for Sushi Theme](https://camo.githubusercontent.com/98de9526e48e3ad03e761893c539891563e41276/68747470733a2f2f6769746875622d636c6f75642e73332e616d617a6f6e6177732e636f6d2f6173736574732f333037313934382f31303536353038362f66383463326432632d373565312d313165352d383234382d3364386262623965636565392e706e67)

![Screenshot of Sushi Theme with Terraform Workspaces](https://user-images.githubusercontent.com/7011993/43540375-907eeca8-9595-11e8-8af9-92183a3ad997.png)

![Screenshot of Sushi Theme with Kubernetes](https://user-images.githubusercontent.com/1866448/56770256-c09f8f00-67b3-11e9-9bcf-d654243e881c.png)

![Screenshot of Sushi Theme with SSH](https://user-images.githubusercontent.com/14050128/64432134-54278b80-d0d5-11e9-93f0-f3ef451af906.png)

#### License

[MIT][mit] © [Umayr Shahid][author] et [al][THEMES-NAMESPACE-sushi-contributors]


[THEMES-NAMESPACE-sushi-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-sushi-author]:         http://github.com/umayr
[THEMES-NAMESPACE-sushi-contributors]:   https://github.com/umayr/sushi/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [syl20bnr](https://github.com/oh-my-fish/theme-syl20bnr)
### syl20bnr theme

A semi-compact oh-my-fish theme with [nice support for git](#git).

The theme has been tested on `Ubuntu 14.04 (Trusty)` and `Mac OS X 10.10 (Yosemite)`.
It is also compatible with [Cygwin with the appropriate packages](#cygwin-compatibility).

**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Segments](#segments)
	- [pwd: Compact current working directory](#pwd-compact-current-working-directory)
		- [Examples](#examples)
	- [git](#git)
		- [Examples](#examples-1)
	- [vi-mode](#vi-mode)
	- [end](#end)
	- [where](#where)
- [Functions](#functions)
- [Mac compatibility](#mac-compatibility)
- [Cygwin compatibility](#cygwin-compatibility)

#### Segments

##### pwd: Compact current working directory

The `pwd` segment format is `X:P(N)` where:
- `X` is either `home` or `/`
- `P` is the current working path base name (name of the current directory)
- `N` is the depth of the path starting from `X`

If the `pwd` is `home` or `/` then the prompt format is simplified to `home`
and `/` respectively without the current directory and depth.

###### Examples

In home directory:
![home](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-home2.png)

Inside a directory in home:
![inside_home](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-inside-home.png)

Outside the home directory:
![outside_home](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-outside-home.png)

##### git

If the current directory is a [git][THEMES-NAMESPACE-syl20bnr-git] repository then the `pwd` segment is
replaced by the `git` segment (I should know where I am).

The `git` segment format is `X:YI@Z:P(N)` where:
- `X` is `git`
- `Y` is the current branch name
- `I` is some information about the current repository state
- `Z` is the name of the repository
- `P` is the current working path basename (name of the current directory)
If `P` = `Z` then `P(N)` is not displayed
- `N` is the depth of the path starting from base directory of the repository

The displayed information `I` is:
- Unpushed commits are indicated with an up arrow like this `[↑1]`
- Unmerged fetched commits are indicated with a down arrow like this `[↓1]`

**Note:** The dirtiness of the current branch is indicated by its color:
- red: it is dirty
- green: it is up to date

**Note:** The unmerged commits count appears only if the changes in the
upstream branch as been fetched.

###### Examples

Dirty (changes not committed):

![dirty](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-dirty2.png)

Unpushed commits:

![unpushed_commits](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-unpushed.png)

Unmerged commits:

![unmerged_commits](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-unmerged.png)

Both unpushed and unmerged commits:

![unmerged_commits](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-unpushed_unmerged.png)

In a sub-directory of the repository:

![repo_subdir](https://raw.githubusercontent.com/syl20bnr/oh-my-fish-theme-syl20bnr/master/screenshots/prompt_fish-syl20bnr-git-subdir2.png)

##### vi-mode

This segment display the current `vi-mode` if the fish native vi mode or
the oh-my-fish vi-mode plugin is used.
See the `[n]` in the previous screenshots.

##### end

The color of the end of the prompt depends on the `$status` value of the
last executed command. It is `green` or `red` depending on the success or
failure of the last command.

Since I often use [ranger][THEMES-NAMESPACE-syl20bnr-ranger] and its `shift+s` key binding to bring
a new child shell session, there is a discreet indicator when the parent
process of the current shell is a `ranger` process: the end of the prompt
is written twice (ie: `>>` instead of just `>`).
With this indicator I quickly see if I can `ctrl+d` to end the current shell
process and go back to the parent `ranger` process.

##### where

The `where` segment format is `X@Y` where:
- `X` is the user name
- `Y` is the host name

This segment is displayed in the right prompt.

#### Functions

Some functions come with the theme:
- `toggle_right_prompt` will... toggle the right prompt! (alias: `trp`)

#### Mac compatibility

In order to make this theme work correctly with all the features make sure to
install the following packages via MacPorts or Homebrew:
-`pstree` (used in ranger detection)

#### Cygwin compatibility

In order to make this theme work on [Cygwin][THEMES-NAMESPACE-syl20bnr-cygwin], make sure to install the following
packages:
- `bc` for `math` fish function
- `psmisc` for `pstree` (used in ranger detection)
- `git` if you want to use the `git` segment.

[THEMES-NAMESPACE-syl20bnr-git]: http://git-scm.com/
[THEMES-NAMESPACE-syl20bnr-ranger]: http://ranger.nongnu.org/
[THEMES-NAMESPACE-syl20bnr-cygwin]: http://cygwin.com/


# [taktoa](https://github.com/oh-my-fish/theme-taktoa)
#### taktoa

A theme by taktoa

###### Characteristics

* Shows current git information
* Shows hostname if you are connected via ssh
* Show current terminal multiplexer status (screen/tmux pane name and number)
* Arrow is a lambda

![taktoa theme](http://taktoa.me/oh-my-fish/images/taktoa-screenshot.png)


# [technopagan](https://github.com/oh-my-fish/theme-technopagan)
#### technopagan
A minimalist fish theme forked from theme-nai ([@xorgy](https://github.com/xorgy)) but with added ([@rickycodes](https://github.com/rickycodes)) moonmoji support.

![technopagan](https://raw.githubusercontent.com/oh-my-fish/theme-technopagan/master/technopagan.png)

Display the following bits on the left:
 * Current directory name
 * Git branch and dirty state (if inside a git repo)


# [toaster](https://github.com/oh-my-fish/theme-toaster)
### Toaster

A fish (shell) theme with a poptart cat and a rainbow that signifies git status.

![Toaster in action](https://github.com/steeeve/toaster/raw/master/screenshot.png)


# [tomita](https://github.com/daveyarwood/tomita)
<p align="center">
  <img src="https://github.com/daveyarwood/tomita/blob/master/img/tomita.jpg?raw=true" alt="source: http://www.isaotomita.net/images/photo/tomi01.jpg" title="isao tomita" />
</p>

### tomita

A minimal, aesthetically pleasing fish theme.

> Note: Make sure you're using a Unicode-enabled terminal and font.

#### Prompt

    <abbreviated path> (<current git branch>) [<vi mode>] ⋊>

* Working directory
* Current git branch
* vi mode (requires fish 2.2+ and can be disabled with `set -x TOMITA_VI no`)

> This theme includes a custom vi mode indicator which is built into `fish_prompt`. If you'd like to use vi mode, I recommend adding the following lines to your config.fish:
>
>     # note: this erases the default fish_mode_prompt, which adds a vi mode
>     # indicator to the left of your prompt
>     function fish_mode_prompt; end
>
>     # turn on vi mode when the shell starts
>     fish_vi_mode

#### Screenshots

<center>

Without vi-mode:

<a href="https://github.com/daveyarwood/tomita/blob/master/img/1.png?raw=true">
  <img src="https://github.com/daveyarwood/tomita/blob/master/img/1.png?raw=true" alt="without vi-mode" />
</a>

With vi-mode:

<a href="https://github.com/daveyarwood/tomita/blob/master/img/2.png?raw=true">
  <img src="https://github.com/daveyarwood/tomita/blob/master/img/2.png?raw=true" alt="with vi-mode" />
</a>

In a git repo:

<a href="https://github.com/daveyarwood/tomita/blob/master/img/3.png?raw=true">
  <img src="https://github.com/daveyarwood/tomita/blob/master/img/3.png?raw=true" alt="git branch" />
</a>

</center>



# [trout](https://github.com/oh-my-fish/theme-trout)
A simple, but informative, prompt

![example](https://raw.githubusercontent.com/phaedryx/trout/master/prompt.png)


# [tweetjay](https://github.com/tweetjay/theme-tweetjay.git)
<a href="/tweetjay/theme-tweetjay/master/README.md">Moved Permanently</a>.



# [uggedal](https://github.com/oh-my-fish/theme-uggedal)
#### uggedal
Minimal theme.

![uggedal theme](https://f.cloud.github.com/assets/71/485623/c84ea45a-b8f7-11e2-8f7c-35a836aa7dbe.png)


###### Characteristics

* Only displays the `$CWD`.
* Displays hostname if you're connected through `ssh(1)`.
* Right prompt displays the last command's exit code if it was non-zero.


# [will](https://github.com/oh-my-fish/theme-will)
#### Will
Minimalist theme.

![Screenshot](https://cloud.githubusercontent.com/assets/143746/6462675/60d171fe-c1ab-11e4-9434-8718a2139c79.png)

###### Characteristics
* The current working directory is displayed on the right-side
* Hostnames are displayed if and only if we're on an SSH connection
* Uses logical entailment as the prompt character


# [wolf-theme](https://github.com/wolf-theme/fish-shell)
### Wolf Theme for [Fish Shell](https://fishshell.com/)
Theme based in [eclm](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#eclm)

<img src="http://i.imgur.com/1ZjM4j5.png" style="text-align: center;">

##### Install
``` omf install wolf-theme ```

``` omf theme wolf-theme ```

##### Team
[![Igor Oliveira](https://avatars0.githubusercontent.com/u/14060827?v=3&s=70)](https://github.com/devigor) |
--- |
[Igor Oliveira](https://github.com/devigor) |


# [yimmy](https://github.com/oh-my-fish/theme-yimmy)
#### yimmy theme

A simple two-line theme with support for terminals configured with Solarized
Dark colors.

    user@host ~/c/w/dir (branch *)
    >

![Screenshot](https://cloud.githubusercontent.com/assets/2502736/3245408/32c42cde-f172-11e3-8ba3-912191222a11.png)

##### Characteristics:

- Standard fish prompt characters: > for user, # for root
- Uses the fish `prompt_pwd`, so paths will be abbreviated
- Uses built-in `__fish_git_prompt` functionality
- Indicates Git work-in-progress (gwip/gunwip) if detected
- Prompt character is colored red if previous command had a non-zero exit
  status
- Includes complementary `LS_COLORS`

##### Configuration:

- Disable Solarized colors in prompt with: `set -U yimmy_solarized false`


# [zeit](https://github.com/mcansh/zeit-fish-theme)
See https://github.com/mcansh/zeit-fish-theme for details
# [zephyr](https://github.com/komarnitskyi/theme-zephyr)
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

###### zephyr
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


#### Install

```fish
omf install https://github.com/komarnitskyi/theme-zephyr
omf theme zephyr
```

#### Requirements
* [fishshell](https://fishshell.com/) > v2.3
* [oh-my-fish](https://fishshell.com/) > v5

#### Update

```fish
omf update zephyr
```


#### Features

* Displays git information in the command prompt when available.
* Displays node version when available
* Indicate is User has superpower:
  * ```➜``` - default prompt
  * ```$``` - with SU power



#### Screenshot

<p align="center">
<img src="/screenshot.png">
</p>


### License

[MIT][mit] © [Andrii Komarnitskyi][author] et [al][THEMES-NAMESPACE-zephyr-contributors]


[THEMES-NAMESPACE-zephyr-mit]:            https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-zephyr-author]:         https://github.com/komarnitskyi
[THEMES-NAMESPACE-zephyr-contributors]:   https://github.com/komarnitskyi/theme-zephyr/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# [zish](https://github.com/oh-my-fish/theme-zish)
### Zish

Zhishen Wen's simple fun theme =)

![zish](https://raw.githubusercontent.com/oh-my-fish/theme-zish/master/./zish_preview.png)

#### Left prompt
User, host, abbreviated path, and git branch info

#### Right prompt
Exit code and time

Enjoy!


