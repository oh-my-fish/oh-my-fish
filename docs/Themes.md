# Available themes
- [agnoster](#agnoster)
- [batman](#batman)
- [beloglazov](#beloglazov)
- [bira](#bira)
- [bobthefish](#bobthefish)
- [budspencer](#budspencer)
- [cbjohnson](#cbjohnson)
- [chain](#chain)
- [clearance](#clearance)
- [cmorrell](#cmorrell)
- [coffeeandcode](#coffeeandcode)
- [cor](#cor)
- [cyan](#cyan)
- [dangerous](#dangerous)
- [default](#default)
- [eclm](#eclm)
- [edan](#edan)
- [eden](#eden)
- [es](#es)
- [fishbone](#fishbone)
- [fishface](#fishface)
- [fishy-drupal](#fishy-drupal)
- [fisk](#fisk)
- [flash](#flash)
- [fox](#fox)
- [gianu](#gianu)
- [gitstatus](#gitstatus)
- [gnuykeaj](#gnuykeaj)
- [godfather](#godfather)
- [hulk](#hulk)
- [idan](#idan)
- [integral](#integral)
- [jacaetevha](#jacaetevha)
- [kawasaki](#kawasaki)
- [krisleech](#krisleech)
- [l](#l)
- [lambda](#lambda)
- [lolfish](#lolfish)
- [mars](#mars)
- [mokou](#mokou)
- [mtahmed](#mtahmed)
- [nai](#nai)
- [nelsonjchen](#nelsonjchen)
- [numist](#numist)
- [ocean](#ocean)
- [pastfish](#pastfish)
- [perryh](#perryh)
- [plain](#plain)
- [pure](#pure)
- [red-snapper](#red-snapper)
- [robbyrussell](#robbyrussell)
- [scorphish](#scorphish)
- [shellder](#shellder)
- [simple-ass-prompt](#simple-ass-prompt)
- [simplevi](#simplevi)
- [slavic-cat](#slavic-cat)
- [sushi](#sushi)
- [syl20bnr](#syl20bnr)
- [taktoa](#taktoa)
- [technopagan](#technopagan)
- [toaster](#toaster)
- [tomita](#tomita)
- [trout](#trout)
- [uggedal](#uggedal)
- [will](#will)
- [yimmy](#yimmy)
- [zish](#zish)

# agnoster
#### agnoster

A fish theme optimized for people who use:

* Solarized
* Git
* Mercurial (requires 'hg prompt')
* SVN
* Unicode-compatible fonts and terminals (I use iTerm2 + Menlo)
* Fish Vi-mode

For Mac users, I highly recommend iTerm 2 + Solarized Dark

![agnoster theme](https://f.cloud.github.com/assets/1765209/255379/452c668e-8c0b-11e2-8a8e-d1d13e57d15f.png)


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

Ported from https://gist.github.com/agnoster/3712874.


# batman
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


# beloglazov
####  beloglazov

A theme based on the default robbyrussell theme. This theme adds time, the
number of non-pushed commits, and whether the previous command has failed.

![beloglazov-fish-theme](https://raw.github.com/beloglazov/oh-my-fish/master/themes/beloglazov/beloglazov-fish-theme.png)


###### Characteristics

* Displays git information in the command prompt when available
* Displays the number of non-pushed git commits
* Displays the current time
* Displays ✘ if the previous command failed


# bira
#### bira

Theme imported from Oh my ZSH: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
Contains traces of nuts and code from other Oh my fish themes.

Display username, hostname, current path, ruby version and git status. Display the latest error status in the right prompt.

![bira theme](https://cloud.githubusercontent.com/assets/1214238/5441541/8bd494dc-8491-11e4-9dbe-256b7e558eac.png)

TODO:
 - display Python version


# bobthefish
### bobthefish

`bobthefish` is a Powerline-style, Git-aware [fish][THEMES-NAMESPACE-bobthefish-fish] theme optimized for awesome.

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish) [![MIT License](https://img.shields.io/github/license/oh-my-fish/theme-bobthefish.svg?style=flat)](/LICENSE.md)

![bobthefish][THEMES-NAMESPACE-bobthefish-screencast]


##### Installation

Be sure to have Oh My Fish installed. Then just:

    omf install bobthefish

You will need a [Powerline-patched font][THEMES-NAMESPACE-bobthefish-patching] for this to work, unless you enable the compatibility fallback option:

    set -g theme_powerline_fonts no

[I recommend picking one of these][THEMES-NAMESPACE-bobthefish-fonts]. For more advanced awesome, install a [nerd fonts patched font][nerd-fonts], and enable nerd fonts support:

    set -g theme_nerd_fonts yes

This theme is based loosely on [agnoster][THEMES-NAMESPACE-bobthefish-agnoster].


##### Features

 * A helpful, but not too distracting, greeting.
 * A subtle timestamp hanging out off to the right.
 * Powerline-style visual hotness.
 * More colors than you know what to do with.
 * An abbreviated path which doesn't abbreviate the name of the current project.
 * All the things you need to know about Git in a glance.
 * Visual indication that you can't write to the current directory.


##### The Prompt

 * Flags:
     * Previous command failed (**`!`**)
     * Background jobs (**`%`**)
     * You currently have superpowers (**`$`**)
 * Current vi mode
 * `User@Host` (unless you're the default user)
 * Current RVM, rbenv or chruby (Ruby) version
 * Current virtualenv (Python) version
     * _If you use virtualenv, you will probably need to disable the default virtualenv prompt, since it doesn't play nice with fish: `set -x VIRTUAL_ENV_DISABLE_PROMPT 1`_
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
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
```

**Title options**

- `theme_title_display_process`. By default theme doesn't show current process name in terminal title. If you want to show it, just set to `yes`.
- `theme_title_display_path`. Use `no` to hide current working directory from title.
- `theme_title_use_abbreviated_path`. Default is `yes`. This means your home directory will be displayed as `~` and `/usr/local` as `/u/local`. Set it to `no` if you prefer full paths in title.

**Prompt options**

- `theme_display_ruby`. Use `no` to completely hide all information about Ruby version. By default Ruby version displayed if there is the difference from default settings.
- `theme_display_vagrant`. This feature is disabled by default, use `yes` to display Vagrant status in your prompt. Please note that only the VirtualBox and VMWare providers are supported.
- `theme_show_exit_status`. Set this option to yes to have the prompt show the last exit code if it was non_zero instead of just the exclamation mark.
- `theme_git_worktree_support`. If you do any git worktree shenanigans, setting this to `yes` will fix incorrect project-relative path display. If you don't do any git worktree shenanigans, leave it disabled. It's faster this way :)
- `fish_prompt_pwd_dir_length`. bobthefish respects the Fish `$fish_prompt_pwd_dir_length` setting to abbreviate the prompt path. Set to `0` to show the full path, `1` (default) to show only the first character of each parent directory name, or any other number to show up to that many characters.
- `theme_project_dir_length`. The same as `$fish_prompt_pwd_dir_length`, but for the path relative to the current project root. Defaults to `0`; set to any other number to show an abbreviated path.

**Color scheme options**

| ![dark][dark]           | ![light][THEMES-NAMESPACE-bobthefish-light]                     |
|-------------------------|-------------------------------------|
| ![solarized][THEMES-NAMESPACE-bobthefish-solarized] | ![solarized-light][solarized-light] |
| ![base16][THEMES-NAMESPACE-bobthefish-base16]       | ![base16-light][base16-light]       |
| ![zenburn][THEMES-NAMESPACE-bobthefish-zenburn]     | ![terminal-dark][terminal-dark]     |

You can use the function `__bobthefish_display_colors` to preview the prompts in
the current theme.

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


[THEMES-NAMESPACE-bobthefish-fish]:       https://github.com/fish-shell/fish-shell
[THEMES-NAMESPACE-bobthefish-screencast]: https://cloud.githubusercontent.com/assets/53660/18028510/f16f6b2c-6c35-11e6-8eb9-9f23ea3cce2e.gif
[THEMES-NAMESPACE-bobthefish-patching]:   https://powerline.readthedocs.org/en/master/installation.html#patched-fonts
[THEMES-NAMESPACE-bobthefish-fonts]:      https://github.com/Lokaltog/powerline-fonts
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[THEMES-NAMESPACE-bobthefish-agnoster]:   https://gist.github.com/agnoster/3712874

[THEMES-NAMESPACE-bobthefish-dark]:            https://cloud.githubusercontent.com/assets/53660/16141569/ee2bbe4a-3411-11e6-85dc-3d9b0226e833.png "dark"
[THEMES-NAMESPACE-bobthefish-light]:           https://cloud.githubusercontent.com/assets/53660/16141570/f106afc6-3411-11e6-877d-fc2a8f6d3175.png "light"
[THEMES-NAMESPACE-bobthefish-solarized]:       https://cloud.githubusercontent.com/assets/53660/16141572/f7724032-3411-11e6-8771-b43769e7afec.png "solarized"
[solarized-light]: https://cloud.githubusercontent.com/assets/53660/16141575/fbed8036-3411-11e6-92e9-90da6d45f94b.png "solarized-light"
[THEMES-NAMESPACE-bobthefish-base16]:          https://cloud.githubusercontent.com/assets/53660/16141577/0134763a-3412-11e6-9cca-6040d39c8fd4.png "base16"
[base16-light]:    https://cloud.githubusercontent.com/assets/53660/16141579/02f7245e-3412-11e6-97c6-5f3cecffb73c.png "base16-light"
[THEMES-NAMESPACE-bobthefish-zenburn]:         https://cloud.githubusercontent.com/assets/53660/16141580/06229dd4-3412-11e6-84aa-a48de127b6da.png "zenburn"
[terminal-dark]:   https://cloud.githubusercontent.com/assets/53660/16141583/0b3e8eea-3412-11e6-8068-617c5371f6ea.png "terminal-dark"


# budspencer
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

Execute `brew install --with-default-names gnu-sed` if there are
`Array index out of bounds` messages in your prompt.

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
Bookmarks are universal and thus persistant.
A new shell automatically changes working directory on startup to newest bookmark.
`m` is a function that drops down a menu showing the bookmarks as enumerated list
equivalently to `d`.

The following shortcuts need vi mode:
- Create a bookmark for present working directory with `m` in NORMAL mode.
- Remove a bookmark for present working directory with `M` in NORMAL mode.

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
set -U budspencer_nobell
```

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


# cbjohnson
#### cbjohnson theme

A minimal theme forked from the [yimmy][yimmy-commit] theme (thanks [jhillyerd][yimmy-author]!)

![screenshot](https://cloud.githubusercontent.com/assets/4823640/5327427/6f9e61bc-7d02-11e4-9223-38ddbed176c8.png)

[yimmy-commit]: https://github.com/bpinto/oh-my-fish/tree/3a4b7de689cabf3522227f51177a489d915c8b4d/themes/yimmy
[yimmy-author]: https://github.com/jhillyerd


# chain
### chain
A thin, classy theme composed of a chain of information.

[![asciicast](https://asciinema.org/a/129cyab1j0ou83fhaofg8hs2n.png)](https://asciinema.org/a/129cyab1j0ou83fhaofg8hs2n)


#### Installation
Install with [Oh My Fish][THEMES-NAMESPACE-chain-omf]:

```fish
$ omf install chain
```


#### Features
- Displays current Git branch and dirty state.
- If the last command fails, the exit code is displayed.
- An abbreviated path.


#### Links
Your prompt in chain consists of a series of *links*, with each link displaying a single piece of information. Not all links are always visible and only show up when you need them. Below are all the possible links (in order from left to right):

- Superuser privileges (`⚡`)
- The current working directory
- The current Git branch (`⎇`)
- Git working directory dirty (`±`)
- Exit status of the last command


#### Customization
The glyphs used in the chain can be customized using global variables. Here is a list of the available variables:

- `$chain_prompt_glyph`: The arrow character at the end of the chain, right before the text input.
- `$chain_git_branch_glyph`: Glyph to indicate the Git branch.
- `$chain_git_dirty_glyph`: Glyph to indicate that the working branch has uncommitted changes.
- `$chain_su_glyph`: Glyph to indicate that you have superuser privileges.


#### License
[MIT][mit] © [coderstephen][author] et [al][THEMES-NAMESPACE-chain-contributors]

[THEMES-NAMESPACE-chain-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-chain-author]:         https://github.com/coderstephen
[THEMES-NAMESPACE-chain-contributors]:   https://github.com/coderstephen/theme-chain/graphs/contributors
[THEMES-NAMESPACE-chain-omf]:            https://github.com/oh-my-fish/oh-my-fish


# clearance
### Fish Theme: clearance

A minimalist [fish shell](http://fishshell.com/) theme for people who use git

![clearance theme](https://raw.github.com/cseelus/clearance-fish/master/clearance-fish_preview.png)

#### Like it?

Check out other versions of this theme for OSX Terminal or VIM!


# cmorrell
### Chris Morrell's Fish Theme

This is a theme I designed for myself but have given to a few friends and decided to publish for others' enjoyment.

![Chris Morrell's Fish Theme](https://cloud.githubusercontent.com/assets/21592/4770904/8a58e026-5b89-11e4-927c-42a387b41df0.gif)

#### Features

- Minimal base prompt
- Shows compact git status w/ the number of changed files & current branch
- Gives a visual indication when you're logged in via SSH, or logged in as anyone
    but the default user (set the `$default_user` variable to define your default user)
- Shows indicator if previous command failed
- Shows a bright red "!" if you're logged in as root

(Note: _This theme is designed for a light-on-dark theme like [Solarized](http://ethanschoonover.com/solarized) but should work in a dark-on-light terminal with a few terminal color tweaks_)

# coffeeandcode
### Fish Theme: coffeeandcode

Another theme choice for Oh-My-Fish! originally created by
[Jonathan Knapp](http://jonknapp.com).

![coffeeandcode](https://cloud.githubusercontent.com/assets/1272018/5966170/e846c75e-a7f9-11e4-8aeb-ebec4c974f5b.png)

##### Warning:

This theme will overwrite all of your Fish color and git settings. If you'd like
to customize them, you will have to make changes to the `fish_prompt.fish` file
in this theme. All of the settings are listed at the top of the file.


# cor
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


# cyan
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


# dangerous
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


# default
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


# eclm
#### eclm
Based on the robbyrussell theme.

![eclm theme](https://raw.githubusercontent.com/oh-my-fish/theme-eclm/master/screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* Indicates 'master' branch with a distinctive color, encouraging the use of feature-branches (useful when development is done using pull requests)
* If the last command was failed, the indicator would be red, otherwise it's green


# edan
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


# eden
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
[omf-badge]:      https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square
[fish-badge]:     https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square
[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# es
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

#####__Git folder__
<p align="center">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20Git-es.png?raw=true">
</p>

#####__Normal folder (no Git)__
<p align="center">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20NoGit-es.png?raw=true">
</p>

#####__Normal read-only folder (no Git)__
<p align="left">
<img src="https://github.com/oh-my-fish/theme-es/blob/master/Fish%20Prompt%20NoGit%20Read-only-es.png?raw=true" width="280">
</p>

### License

[MIT][mit] © [eugenesvk][THEMES-NAMESPACE-es-author]


[THEMES-NAMESPACE-es-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-es-author]:         http://github.com/eugenesvk
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# fishbone
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


# fishface
#### FishFace

Shows an ASCII fish which is blue or green when in a git repo.

![fishface theme](https://f.cloud.github.com/assets/66143/1224622/ec9660d8-2750-11e3-9c96-cb7a5a69eada.png)


# fishy-drupal
#### fishy-drupal

![fishy-drupal](https://raw.github.com/greggles/fishy-drupal/master/drups-fish-theme.png)

###### Features

* Shows the present working directory, abbreviated (default fish style)
* Shows the active git branch, if any
* Shows the active drush site alias, if any
* Shows yellow ✗ if the current git directory is "dirty"


# fisk
### Fisk

![theme screenshot](https://cloud.githubusercontent.com/assets/20814/6209746/60949aa6-b5c9-11e4-8edc-5a8e370f4527.png)

A nice dark blue-green theme with support for:

- Last exit code
- Current git HEAD
- Current python virtualenv

By [joar](https://github.com/joar), thanks to
[adisbladis](https://github.com/adisbladis) for the starting point.


# flash
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


# fox
#### fox

cloned from oh-my-zsh.

![fox theme](http://i60.tinypic.com/2myaibn.jpg)


# gianu
#### Gianu

Original theme made by [gianu](https://github.com/gianu) for oh-my-zsh, converted to oh-my-fish by [JBarberU](https://github.com/JBarberU)

![gianu theme](https://cloud.githubusercontent.com/assets/1499062/5955321/114b64d2-a7a2-11e4-8732-e8cf06903314.png)


###### Characteristics

Displays:

* Username and hostname
* Working directory
* Git information when available.


# gitstatus
#### GitStatus

![GitStatus](https://github.com/godfat/fish_prompt-gitstatus/raw/master/gitstatus.png)

###### Characteristics

* Displays host information in the command prompt when connected via ssh.

* Displays git information in the command prompt when inside a git repository.

  - Shows current branch name.
  - Shows * if working copy is dirty.
  - Shows # if everything is staged.
  - Shows no indicators if the working copy is clean.


# gnuykeaj
### Fish Theme: gnuykeaj

Super minimal one line version of [clearance](https://github.com/oh-my-fish/theme-clearance) theme. Balance between need to know information and space. Has git branch and dirty state information based on the color of the branch name.

![gnuykjeatheme](https://raw.githubusercontent.com/andyklimczak/oh-my-fish/gnuykeaj-screenshot/themes/gnuykeaj/gnuykeaj-preview.png)



# godfather
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



# hulk
[![Slack Room][slack-badge]][slack-link]
[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg

### :anger: Hulk

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/8317250/7789765/4638cea8-02a8-11e5-85da-5b8b13d59568.png">
</p>

#### Features

_From left to right:_

+ Display current time.
+ `$HOME` directory abbreviated to an uppercase gamma symbol [`ᴦ`](http://en.wikipedia.org/wiki/Hulk_%28comics%29#Fictional_character_biography)
+ Colors change to _red_ to denote the last `$status` code was `!=` 0.
+ Path to current working directory is abbreviated.
+ Display current branch.
+ A _green_ colored branch name denotes the repository is dirty.
+ `/` root is diplayed as `≡`
+ Colors inspired by The Hulk.


# idan
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


# integral
#### integral

A simple git upstream theme.

###### Characteristics

* Current branch
* Dirty working directory
* Working directory
* Git upstream status

###### Screenshot
![Integral Screenshot](https://cloud.githubusercontent.com/assets/21774/2715353/70af1520-c50a-11e3-9db3-74933fbb8d91.png)


# jacaetevha
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


# kawasaki
### kawasaki

`kawasaki` is a [fish][THEMES-NAMESPACE-kawasaki-fish] theme that emphasizes a simple and useful prompt without useless cluttter.

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)

![kawasaki][THEMES-NAMESPACE-kawasaki-screenshot]


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

#### Disable Git-awareness.
set -g theme_display_git no

#### Don't disable jobs indicator.
set -g theme_display_jobs no

#### Always display the jobs indicator, even if there are no jobs.
set -g theme_display_jobs_always yes

#### Hide the current directory read/write indicator.
set -g theme_display_rwt no

#### Don't display the VirtualEnv prompt.
set -g theme_display_virtualent no
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

set -g theme_prompt_char_normal                    '$'
set -g theme_prompt_char_superuser                 '#'
set -g theme_prompt_char                           "$theme_prompt_char_normal"

set -g theme_prompt_superuser_glyph                \u2605
set -g theme_prompt_userhost_separator             ':'

set -g theme_prompt_segment_separator_char         ' '
set -g theme_prompt_segment_separator_color        normal

set -g theme_prompt_status_jobs_char               '%'
set -g theme_prompt_status_rw_char                 '.'
set -g theme_prompt_status_separator_char          '/'

set -g theme_prompt_virtualenv_char_begin          '('
set -g theme_prompt_virtualenv_char_end            ')'
set -g theme_prompt_virtualenv_color_char_begin    normal
set -g theme_prompt_virtualenv_color_char_end      normal

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

#### License

kawasaki is released under [The MIT License (MIT)][THEMES-NAMESPACE-kawasaki-license]

Copyright (c) 2016 Beau Hastings

[THEMES-NAMESPACE-kawasaki-license]:    /LICENSE
[THEMES-NAMESPACE-kawasaki-fish]:       https://github.com/fish-shell/fish-shell
[THEMES-NAMESPACE-kawasaki-omf]:        https://github.com/oh-my-fish/oh-my-fish
[THEMES-NAMESPACE-kawasaki-screenshot]: https://cloud.githubusercontent.com/assets/195790/20061473/9545bd4c-a4c5-11e6-83da-8b0a954b8a5a.gif
[THEMES-NAMESPACE-kawasaki-bira]:       https://github.com/oh-my-fish/theme-bira
[THEMES-NAMESPACE-kawasaki-dotfiles]:   https://github.com/oh-my-fish/oh-my-fish#dotfiles


# krisleech
#### krisleech

A very simple theme optimized for Git. Less is more.

![krisleech theme](https://f.cloud.github.com/assets/66143/930316/732ea576-0008-11e3-964c-98410709d00c.png)

![krisleech theme](https://f.cloud.github.com/assets/66143/930317/73446046-0008-11e3-8ecb-2abec0058b83.png)

##### Characteristics

* Current working directory
* Branch name
* Dirty working directory (✘)


# l
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



# lambda
##### Lambda

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<br/>

###### Screenshot

<p align="center">
<img src="https://raw.githubusercontent.com/hasanozgan/theme-lambda/master/screenshot.png">
</p>

###### Install

####### Oh-My-Fish

```fish
omf install lambda
```


# lolfish
### lolfish

such rainbow, wow.

![lolfish][THEMES-NAMESPACE-lolfish-screenshot1]
![lolfish][THEMES-NAMESPACE-lolfish-screenshot2]

#### Easy Install

Using [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish):

```Bash
omf install lolfish
```
##### Less Easy Install

Download and source the prompt file

```Bash
mkdir -p $HOME/.config/fish
wget -O $HOME/.config/fish/lol.fish https://github.com/er0/lolfish/raw/master/lol.fish
echo "source $HOME/.config/fish/lol.fish" >> $HOME/.config/fish/config.fish
```

#### Features

  * Only the best rainbow xterm colors!
  * git branch/status info
  * Return value from the last command
  * Right prompt displays number of backgrounded jobs, tmux sessions, and the time.

[THEMES-NAMESPACE-lolfish-screenshot1]: http://i.imgur.com/InJELf3.png
[THEMES-NAMESPACE-lolfish-screenshot2]: http://i.imgur.com/v6aI9AB.png


# mars
#### mars
Based on the eclm theme (which was based on the robbyrussell theme).

![mars theme](https://raw.githubusercontent.com/oh-my-fish/theme-mars/master/screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* Indicates 'master' branch with a distinctive color, encouraging the use of feature-branches (useful when development is done using pull requests)
* If the last command was failed, the indicator would be red, otherwise it's green


# mokou
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


# mtahmed
#### mtahmed

Minimal theme.

![mtahmed](https://cloud.githubusercontent.com/assets/1272018/5965709/13d07f68-a7f6-11e4-9872-7936516ba258.png)

###### Left prompt

- First 10 characters of hostname if `ssh`'ed
- Current directory name (not path)
- ─╼ (cute little unicode characters)

###### Right prompt

- Exit code of the previous command


# nai
#### nai
A minimalist fish theme which displays git branch and status information.

![nai](https://cloud.githubusercontent.com/assets/1272018/5961225/116d0a7a-a7d3-11e4-88a6-43da003ddc6c.png)

###### Characteristics

####### Left Prompt

* Truncated CWD (just the current folder name)
* Git branch and dirty state (if applicable)


# nelsonjchen
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


# numist
See https://github.com/oh-my-fish/theme-numist for details
# ocean
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


# pastfish
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


# perryh
#### perryh

This is similar to godfat's gitstatus theme, but mainly includes red, white, cyan, and yellow.

![perryh](http://perryhuang.com/stuff/perryh_fish.png)


# plain
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


# pure
### pure [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

> Port of the [`pure`](https://github.com/sindresorhus/pure) ZSH theme to Fish

<p align="center">
  <img width="572" src="screenshot.png">
</p>

#### Install

##### Manually

Via [cURL](https://curl.haxx.se):

```sh
$ # Download the installer to `/tmp`
$ curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/installer.fish > /tmp/pure_installer.fish
$ # Source and trigger the installer
$ source /tmp/pure_installer.fish; and install_pure
```

##### [Fisherman](http://fisherman.sh)

```fish
$ fisher rafaelrinaldi/pure
```

##### [Oh My Fish!](https://github.com/oh-my-fish)

```fish
$ omf install pure
```

#### Features

* Display current directory tail
* Display Git branch name
* Display whether or not the working copy is dirty
* Display an up arrow if there are stuff to be pushed
* Display an down arrow if there are stuff to be pulled
* Display prompt symbol in red if previous command has failed
* Display the current folder and command when a process is running
* Display username and host when in an SSH session
* Display duration of failed commands (if timeout is greather than default threshold)

#### Configuration

```
### Change the prompt text
set pure_symbol_prompt "~>"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_down_arrow "^"
set pure_symbol_git_dirty "!"
set pure_symbol_horizontal_bar "_"

### Change the colors
set pure_color_blue (set_color "1e00fd")
set pure_color_cyan (set_color "1e95fd")
set pure_color_gray (set_color "6c6c6c")
set pure_color_green (set_color "66ff66")
set pure_color_normal (set_color "000000")
set pure_color_red (set_color "f820ff")
set pure_color_yellow (set_color "1bc8c8")
```

#### Maintainers

* [Rafael Rinaldi](https://github.com/rafaelrinaldi)
* [Édouard Lopez](https://github.com/edouard-lopez)

Kudos to all our awesome [:yellow_heart: contributors :yellow_heart:](../..//graphs/contributors)

#### License

MIT © [Rafael Rinaldi](http://rinaldi.io)


# red-snapper
### RED SNAPPER
![Red Snapper](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/redsnapper.jpg)

####><}}*> F E A T U R E S
+ Directory path
+ Git branch name
+ Git status
+ YOUR OWN PET FISH!

####><}}*> GIT STATUS
##### Untracked changes
Your pet will detect if you added files, but didn't track them. He will open his mouth, hungry of yummy commits!
![fish shell untracked changes](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/hungry2.png)

After you commit, he will close his mouth, satiated.
![fish shell commited](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/fed.png)

##### Can't find .git
Something is fishy here! If you are not inside a Git working directory, your pet will go to sleep.
![fish shell not using git](https://raw.githubusercontent.com/ZuraGuerra/theme-red-snapper/master/fishy.png)



# robbyrussell
#### robbyrussell
The default theme – cloned from oh-my-zsh.

![robbyrussell theme](https://bachue.github.io/oh-my-fish/images/robbyrussell-screenshot.png)


###### Characteristics

* Displays git information in the command prompt when available.
* If the last command was failed, the indicator would be red, otherwise it's green


# scorphish
#### Scorphish

Compact. Sufficient.

![scorphish](https://cloud.githubusercontent.com/assets/2112697/17072736/e7515e4a-5040-11e6-8f5b-95d8bd51bd20.png)


##### Left prompt
Abbreviated path, ruby version and gemset, python version and virtualenv and git info

###### Additional information:

 * To display Rust version add the following to `~/.config/fish/config/fish`:

```fish
set -g theme_display_rust yes
```

 * To display Node version add the following to `~/.config/fish/config/fish`:

```fish
set -g theme_display_node yes
```


##### Right prompt
Last command's exit code and current time


##### Acknowledgments
This theme is based on Zish and Coffeandcode themes, many thanks to their authors!

Enjoy!


# shellder
<img src="http://cdn.bulbagarden.net/upload/4/40/090Shellder.png"
  align=left width=175px height=175px>

shellder

> Things are beautiful if you love them. ― *[Jean Anouilh]*<br>
[![i-license]](/LICENSE)

<br>

![](http://i.imgur.com/xZJHgq8.png)

1. **Speed** ― Carefully optimized for slow environments like msys2
2. **No solarized** ― xterm256 colors are beautiful enough, inspired by [seoul256.vim]
3. **zsh** + **fish** support

Installation
--------
##### fish
Use [chips]. Add to `~/.config/chips/plugin.yaml`:

```yaml
github:
- simnalamburt/shellder
```

Then run `chips`.

##### zsh
Use [zplug]. Add below to your `.zshrc`:

```zsh
zplug 'simnalamburt/shellder', as:theme
```

#### Fonts
You'll need a powerline patched font. If you don't have one, download one or
patch some fonts on you own.

- https://github.com/powerline/fonts
- https://github.com/ryanoasis/nerd-fonts

--------

[MIT License] © [simnalamburt] et [al]

[Jean Anouilh]:   https://en.wikipedia.org/wiki/Jean_Anouilh
[seoul256.vim]:   https://github.com/junegunn/seoul256.vim
[THEMES-NAMESPACE-shellder-zplug]:          https://github.com/zplug/zplug
[THEMES-NAMESPACE-shellder-chips]:          https://github.com/xtendo-org/chips
[MIT License]:    https://opensource.org/licenses/MIT
[THEMES-NAMESPACE-shellder-simnalamburt]:   https://github.com/simnalamburt
[THEMES-NAMESPACE-shellder-al]:             https://github.com/simnalamburt/shellder/graphs/contributors

[i-license]:      https://img.shields.io/badge/license-MIT-blue.svg


# simple-ass-prompt
<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

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
This is [Mathias Bynens][THEMES-NAMESPACE-simple-ass-prompt-mths] Bash prompt ported to Fish with a few changed icons and added functionalities. As he put it:


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


# simplevi
fish_prompt-simplevi


The stock prompt with the vi indicator appended.
It is meant to be used with the `vi-mode` plugin.

Screenshots:

![normal mode](https://raw.github.com/syl20bnr/fish_prompt-simplevi/master/prompt_fish-simplevi-n.png)

![insert mode](https://raw.github.com/syl20bnr/fish_prompt-simplevi/master/prompt_fish-simplevi-i.png)



# slavic-cat
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


# sushi
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
* Displays number of commits current branch is ahead/behind from origin.
* By default it shows only the name of the current directory but it provides a flag `theme_complete_path` to display abbreviated current working directory instead.
* Displays Time.

#### Screenshot

![Screenshot for Sushi Theme](https://camo.githubusercontent.com/98de9526e48e3ad03e761893c539891563e41276/68747470733a2f2f6769746875622d636c6f75642e73332e616d617a6f6e6177732e636f6d2f6173736574732f333037313934382f31303536353038362f66383463326432632d373565312d313165352d383234382d3364386262623965636565392e706e67)

#### License

[MIT][mit] © [Umayr Shahid][author] et [al][THEMES-NAMESPACE-sushi-contributors]


[THEMES-NAMESPACE-sushi-mit]:            http://opensource.org/licenses/MIT
[THEMES-NAMESPACE-sushi-author]:         http://github.com/umayr
[THEMES-NAMESPACE-sushi-contributors]:   https://github.com/umayr/sushi/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square


# syl20bnr
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


# taktoa
#### taktoa

A theme by taktoa

###### Characteristics

* Shows current git information
* Shows hostname if you are connected via ssh
* Show current terminal multiplexer status (screen/tmux pane name and number)
* Arrow is a lambda

![taktoa theme](http://taktoa.me/oh-my-fish/images/taktoa-screenshot.png)


# technopagan
#### technopagan
A minimalist fish theme forked from theme-nai ([@xorgy](https://github.com/xorgy)) but with added ([@rickycodes](https://github.com/rickycodes)) moonmoji support.

![technopagan](https://raw.githubusercontent.com/oh-my-fish/theme-technopagan/master/technopagan.png)

Display the following bits on the left:
 * Current directory name
 * Git branch and dirty state (if inside a git repo)


# toaster
### Toaster

A fish (shell) theme with a poptart cat and a rainbow that signifies git status.

![Toaster in action](https://github.com/steeeve/toaster/raw/master/screenshot.png)


# tomita
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
* vi mode (requires fish 2.2+)

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



# trout
A simple, but informative, prompt

![example](https://raw.githubusercontent.com/phaedryx/trout/master/prompt.png)


# uggedal
#### uggedal
Minimal theme.

![uggedal theme](https://f.cloud.github.com/assets/71/485623/c84ea45a-b8f7-11e2-8f7c-35a836aa7dbe.png)


###### Characteristics

* Only displays the `$CWD`.
* Displays hostname if you're connected through `ssh(1)`.
* Right prompt displays the last command's exit code if it was non-zero.


# will
#### Will
Minimalist theme.

![Screenshot](https://cloud.githubusercontent.com/assets/143746/6462675/60d171fe-c1ab-11e4-9434-8718a2139c79.png)

###### Characteristics
* The current working directory is displayed on the right-side
* Hostnames are displayed if and only if we're on an SSH connection
* Uses logical entailment as the prompt character


# yimmy
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


# zish
#### Zish

Zhishen Wen's simple fun theme =)

![zish](https://raw.githubusercontent.com/oh-my-fish/theme-zish/master/./zish_preview.png)

###### Left prompt
User, host, abbreviated path, and git branch info

######Right prompt
Time and exit code

Enjoy!


