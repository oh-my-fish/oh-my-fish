<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.md) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)


Oh My Fish provides core infrastructure to allow you to install packages which extend or modify the look of your shell. It's fast, extensible and easy to use.

<br><br>

<p align="center">
  <b>English</b> &bull;
  <a href="docs/zh-CN">简体中文</a> &bull;
  <a href="docs/ru-RU">Русский</a>
</p>

## Installation

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf help
```

Or _download_ and run it yourself:

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install
```

# Getting Started

Oh My Fish includes a small utility `omf` to fetch and install new packages and themes.

#### `omf update` _`[omf]`_ _`[<package>...]`_

Update the framework and installed packages.

- When called without arguments, update core and all installed packages.
- You can choose to update only the core, by running `omf update omf`.
- For selective package update, list only the names of packages you wish to
  update. You may still include "omf" in the list to update the core as well.

#### `omf install` _`[<name>|<url>]`_

Install one _or more_ packages.

- You can install packages directly by URL via `omf install URL`
- When called without arguments, install missing packages from [bundle](#dotfiles).

#### `omf list`

List installed packages.

#### `omf theme` _`<theme>`_

Apply a theme. To list available themes, type `omf theme`. You can also [preview available themes](./docs/Themes.md) before installing.

#### `omf remove` _`<name>`_

Remove a theme or package.

> Packages subscribed to `uninstall_<pkg>` events are notified before the package is removed, so custom cleanup of resources can be done. See [Uninstall](/docs/en-US/Packages.md#uninstall) for more information.

#### `omf new pkg | theme` _`<name>`_

Scaffold out a new package or theme.

> This creates a new directory under `$OMF_CONFIG/{pkg | themes}/` with a template.

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

Add a new package. To add a theme, use `omf submit` _`themes/<name>`_ _`<url>`_.

Make sure to [send us a PR][omf-pulls-link] to update the registry.

#### `omf doctor`

Use to troubleshoot before [opening an issue][omf-issues-new].

#### `omf destroy`

Uninstall Oh My Fish.

## Advanced

Oh My Fish installer places its startup code in your fish config file (`~/.config/fish/config.fish`).

### Startup

Every time you open a new shell, the startup code initializes Oh My Fish installation path and the _config_ path (`~/.config/omf` by default), sourcing the [`init.fish`](init.fish) script afterwards, which autoloads packages, themes and your custom init files.

For more information check the [FAQ](docs/en-US/FAQ.md#what-does-oh-my-fish-do-exactly).

### Dotfiles

The `$OMF_CONFIG` directory represents the user state of Oh My Fish. It is the perfect
candidate for being added to your dotfiles and/or checked out to version control. There are four important files:

- __`theme`__ - The current theme
- __`bundle`__ - List of currently installed packages/themes
- __`init.fish`__ - Custom script sourced after shell start
- __`before.init.fish`__ - Custom script sourced before shell start

It's highly recommended that your custom startup commands go into `init.fish` file instead of `~/.config/fish/config.fish`, as this allows you to keep the whole `$OMF_CONFIG` directory under version control.

If you need startup commands to be run *before* Oh My Fish begins loading plugins, place them in `before.init.fish` instead. If you're unsure, it is usually best to put things in `init.fish`.

#### About the bundle

Every time a package/theme is installed or removed, the `bundle` file is updated. You can also edit it manually and run `omf install` afterwards to satisfy the changes. Please note that while packages/themes added to the bundle get automatically installed, a package/theme removed from bundle isn't removed from user installation.

## Creating Packages

Oh My Fish uses an advanced and well defined plugin architecture to ease plugin development, including init/uninstall events and function autoloading. [See the documentation](docs/en-US/Packages.md) for more details.

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls

[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
