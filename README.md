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

## Update Instructions

We just moved Oh My Fish repository back to our own organization. Since then, you need to update your Oh My Fish remotes. A clean install is highly recommended for users of old Oh My Fish, and you can follow the steps described below:

1. __BACKUP ALL YOUR CUSTOM STUFF__
2. `mv ~/.config/fish/config{,_old}.fish`
3. `rm -rf ~/.oh-my-fish`
4. Do a [clean Oh My Fish install](#install)
5. Copy all lines starting with `Plugin` and `Theme` from `~/.config/fish/config_old.fish`
6. Paste them it into `$OMF_CONFIG/bundle` file. If it doesn't exist, create it
7. Convert all `Plugin "name"` lines to `package name`
8. Convert all `Theme "name"` lines to `theme name`
9. `omf install`

If you find any trouble in the upgrade process join us in [Gitter](https://gitter.im/oh-my-fish/oh-my-fish) and we will be happy to help.

# Getting Started

Oh My Fish includes a small utility `omf` to fetch and install new packages and themes.

#### `omf update`

Update the framework and installed packages.

#### `omf install` _`[<name>|<url>]`_

Install one _or more_ packages.

- You can install packages directly by URL via `omf install URL`
- When called without arguments, install missing packages from [bundle](#dotfiles).

#### `omf list`

List installed packages.

#### `omf theme` _`<theme>`_

Apply a theme. To list available themes type `omf theme`.

#### `omf remove` _`<name>`_

Remove a theme or package.

> Packages subscribed to `uninstall_<pkg>` events are notified before the package is removed, so custom cleanup of resources can be done. See [Uninstall](/docs/Packages.md#uninstall) for more information.

#### `omf new pkg | theme` _`<name>`_

Scaffold out a new package or theme.

> This creates a new directory under `$OMF_CONFIG/{pkg | themes}/` with a template.

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

Add a new package. To add a theme use `omf submit` _`themes/<name>`_ _`<url>`_.

Make sure to [send us a PR][omf-pulls-link] to update the registry.

#### `omf query` _`<variable name>`_

Use to inspect all session variables. Useful to  dump _path_ variables like `$fish_function_path`, `$fish_complete_path`, `$PATH`, etc.

#### `omf destroy`

Uninstall Oh My Fish.

# Advanced

Oh My Fish installer places its startup code in your fish config file (`~/.config/fish/config.fish`).

## Startup

Everytime you open a new shell the startup code initializes Oh My Fish installation path and the _config_ path (`~/.config/omf` by default), sourcing the [`init.fish`](init.fish) script afterwards, which autoload packages, themes and your custom init file. For more information check the [FAQ](docs/FAQ.md#what-does-oh-my-fish-do-exactly).

## Dotfiles

The `$OMF_CONFIG` directory represents the user state of Oh My Fish, and is the perfect
candidate for being added to your dotfiles and/or checked out to version control. There are two important files:

- __`theme`__ - The current theme
- __`bundle`__ - List of currently installed packages/themes

### About the bundle

Everytime a package/theme is installed or removed the `bundle` file is updated. You can also edit it manually and run `omf install` afterwards to satisfy the changes. Please note that while packages/themes added to the bundle gets automagically installed, a package/theme removed from bundle isn't removed from user installation.

## Creating Packages

Oh My Fish uses an advanced and well defined plugin architecture to ease plugin development, including init/uninstall events and function autoloading. [See the documentation](docs/Packages.md) for more details.

# License

Copyright (c) 2015 Bruno Ferreira Pinto. See [License](LICENSE).

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
