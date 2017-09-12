<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My Fish provides core infrastructure to allow you to install packages which extend or modify the look of your shell. It's fast, extensible and easy to use.

> Also in&nbsp;
> <a href="docs/ru-RU/README.md">🇷🇺</a>
> <a href="docs/zh-CN/README.md">🇨🇳</a>
> <a href="docs/uk-UA/README.md">🇺🇦</a>
> <a href="docs/pt-BR/README.md">🇧🇷</a>

<br>

## Installation

You can get started right away with the default setup by running this in your terminal:

```fish
curl -L https://get.oh-my.fish | fish
```

This will download the installer script and start the installation. Alternatively, you can download the installer and customize your install:

```fish
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

You can verify the integrity of the downloaded installer by verifying the script against [this checksum](bin/install.sha256):

```
92ca680df48640e744b361d376194c5f5f8d6b4f1ac775d22417a0d8a8108767  install
```

You can also install Oh My Fish with Git or with an offline source tarball downloaded from the [releases page][releases]:

```fish
# with git
$ git clone https://github.com/oh-my-fish/oh-my-fish
$ cd oh-my-fish
$ bin/install --offline
# with a tarball
$ curl -L https://get.oh-my.fish > install
$ fish install --offline=omf.tar.gz
```

Run `install --help` for a complete list of install options you can customize.

#### Requirements

- **fish** shell, version 2.2 or later
- **git**, version 1.9.5 or later

#### Known Issues

- Due to a regression bug in fish 2.6 with some terminal emulators, right prompts make the shell unusable.  
  OMF's `default` theme features a right prompt, so it's necessary to use an alternative theme until a fix is released.  
  (see [#541](https://github.com/oh-my-fish/oh-my-fish/issues/541))


## Getting Started

Oh My Fish includes a small utility `omf` to fetch and install new packages and themes.

#### `omf update` _`[omf]`_ _`[<package>...]`_

Update Oh My Fish, all package repositories, and all installed packages.

- When called without arguments, update core and all installed packages.
- You can choose to update only the core, by running `omf update omf`.
- For selective package update, list only the names of packages you wish to
  update. You may still include "omf" in the list to update the core as well.

#### `omf install` _`[<name>|<url>]`_

Install one _or more_ packages.

- You can install packages directly by URL via `omf install URL`
- When called without arguments, install missing packages from [bundle](#dotfiles).

#### `omf repositories` _`[list|add|remove]`_

Manage user-installed package repositories. Package repositories are where packages come from used by commands like `omf install`. By default the [official repository](https://github.com/oh-my-fish/packages-main) is always installed and available.

#### `omf list`

List installed packages.

#### `omf theme` _`<theme>`_

Apply a theme. To list available themes, type `omf theme`. You can also [preview available themes](./docs/Themes.md) before installing.

#### `omf remove` _`<name>`_

Remove a theme or package.

> Packages can use uninstall hooks, so custom cleanup of resources can be done when uninstalling it. See [Uninstall](/docs/en-US/Packages.md#uninstall) for more information.

#### `omf reload`

Reload Oh My Fish and all plugins by using `exec` to replace current shell process with a brand new.

> This command tries to be as safe as possible, mitigating side-effects caused by `exec` and preventing the reload in case of background processes.

#### `omf new pkg | theme` _`<name>`_

Scaffold out a new package or theme.

> This creates a new directory under `$OMF_CONFIG/{pkg | themes}/` with a template.

#### `omf search` _`-t|--theme / -p|--package`_ _`<name>`_

Searches Oh My Fish's database for a given package, theme or both. It also supports fuzzy search, so if you are not sure of the name you can simply `omf search simple`.

#### `omf channel`

Gets or changes the update channel.

Two channels are available by default: the `stable` channel provides stable updates with the latest tagged version of Oh My Fish, and `dev` which provides the latest changes under development. The update channel currently set determines what version `omf update` will upgrade to.

#### `omf doctor`

Use to troubleshoot before [opening an issue][omf-issues-new].

#### `omf destroy`

Uninstall Oh My Fish.

## Advanced

Oh My Fish installer adds a snippet to fish's user config files (`~/.config/fish/conf.d/`) which calls OMF's startup code.

Notice that the scripts in that directory are sourced in the order that the filesystem sees them,
and so it may be necessary to prefix your script files with ordering numbers.

For example: `a_script.fish` will take precedence over the `omf.fish` snippet.
So if `a_script.fish` depends on plugins managed by OMF, consider renaming the script file to `xx_a_script.fish`.

Similiarly, to make sure that a script runs before `omf.fish`, you may prefix it with `00_`.
Alternatively, `~/.config/omf/before.init.fish` may be used.

### Startup

Every time you open a new shell, the startup code initializes Oh My Fish installation path and the _config_ path (`~/.config/omf` by default),
sourcing the [`init.fish`](init.fish) script afterwards, which autoloads packages, themes and your custom init files.

For more information check the [FAQ](docs/en-US/FAQ.md#what-does-oh-my-fish-do-exactly).

### Dotfiles

The `$OMF_CONFIG` directory represents the user state of Oh My Fish. It is the perfect
candidate for being added to your dotfiles and/or checked out to version control. There you can find three important files:

- __`theme`__ - The current theme
- __`bundle`__ - List of currently installed packages/themes
- __`channel`__ - The channel from which OMF gets updates (stable / dev)

And you may create and customize these special files:

- __`init.fish`__ - Custom script sourced after shell start
- __`before.init.fish`__ - Custom script sourced before shell start
- __`key_bindings.fish`__ - Custom key bindings where you can use the `bind` command freely

#### Setting variables in `init.fish`

One of the most common startup commands used in `init.fish` is variables definition. Quite likely, such variables need to be available in any shell session. To achieve this, define them globally. For example:

```fish
# Golang developers might need this one
set -xg GOPATH $HOME/gocode

# Python developers otherwise
set -xg PYTHONDONTWRITEBYTECODE 1
```

#### About the bundle

Every time a package/theme is installed or removed, the `bundle` file is updated. You can also edit it manually and run `omf install` afterwards to satisfy the changes. Please note that while packages/themes added to the bundle get automatically installed, a package/theme removed from bundle isn't removed from user installation.

#### Older fish versions

In fish 2.2, there is no `conf.d` directory, so the startup code has to be placed in the fish config file (`~/.config/fish/config.fish`).

It's highly recommended that your custom startup commands go into `init.fish` file instead of `~/.config/fish/config.fish`, as this allows you to keep the whole `$OMF_CONFIG` directory under version control.

If you need startup commands to be run *before* Oh My Fish begins loading plugins, place them in `before.init.fish` instead. If you're unsure, it is usually best to put things in `init.fish`.

## Creating Packages

Oh My Fish uses an advanced and well defined plugin architecture to ease plugin development, including init/uninstall hooks, function and completion autoloading. [See the packages documentation](docs/en-US/Packages.md) for more details.


[fishshell]: http://fishshell.com
[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
[releases]: https://github.com/oh-my-fish/oh-my-fish/releases
