<img src="docs/logo.png" align="left" width="192px" height="192px"/>
<img src="" align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.md) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Travis Build Status](https://img.shields.io/badge/gitter-join_chat-brightgreen.svg?style=flat-square)](https://gitter.im/oh-my-fish/oh-my-fish?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Oh My Fish provides core infrastructure to allow you to install packages which extend or modify the look of your shell. It's  fast, extensible and easy to use.

<br><br>

# Install

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
omf help
```

Or _download_ and run it yourself:

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
chmod +x install
./install
```

# :beginner: Getting Started

Oh My Fish includes a small utility `omf` to fetch and install new packages and themes.

## `omf update`

Update framework and installed packages.

## `omf install` _`[package|url ...]`_

Install one _or more_ packages.

- You can install packages directly by URL via `omf install URL`
- When called without arguments, install missing packages from [bundles](#dotfiles).

## `omf list`

List installed packages.

## `omf theme` _`<theme>`_

Apply a theme. To list available themes type `omf theme`.

## `omf remove` _`<name>`_

Remove a theme or package.

> Packages subscribed to `uninstall_<pkg>` events are notified before the package is removed to allow custom cleanup of resources. See [Uninstall](#uninstall).

## `omf new pkg | theme` _`<name>`_

Scaffold out a new package or theme.

> This creates a new directory under `$OMF_CONFIG/{pkg | themes}/` with a template.

## `omf submit` _`pkg/<name>`_ _`[<url>]`_

Add a new package. To add a theme use `omf submit` _`themes/<name>`_ _`<url>`_.

Make sure to [send us a PR][omf-pulls-link] to update the registry.

## `omf query` _`<variable name>`_

Use to inspect all session variables. Useful to  dump _path_ variables like `$fish_function_path`, `$fish_complete_path`, `$PATH`, etc.

## `omf destroy`

Uninstall Oh My Fish. See [uninstall](#uninstall) for more information.

# Advanced

## Startup

This script runs each time a new session begins, autoloading packages, themes and your _config_ path in that order.

The _config_ path (`~/.config/omf` by default) is defined by `$OMF_CONFIG` in `~/.config/fish/config.fish`. Modify this to load your own configuration, if you have any, as discussed in the [FAQ](FAQ.md#what-does-oh-my-fish-do-exactly).

## Dotfiles

The `$OMF_CONFIG` directory represents the user state of Oh My Fish, and is the perfect
candidate for being added to your dotfiles and/or checked out to version control. There are two important files:

- __`theme`__ - The current theme
- __`bundle`__ - List of currently installed packages/themes

### About the bundle

Everytime a package/theme is installed or removed the `bundle` file is updated. You can also edit it manually and run `omf install` afterwards to satisfy the changes. Please note that while packages/themes added to the bundle gets automagically installed, a package/theme removed from bundle isn't removed from user installation.

# License

MIT © [Oh My Fish][contributors] :metal:

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors



[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
