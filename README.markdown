# Oh My Fish!

[![Build Status](https://travis-ci.org/bpinto/oh-my-fish.svg?branch=master)](https://travis-ci.org/bpinto/oh-my-fish)

### Why?
  Developing on a shell should be a pleasure. Our goal is to help developers that don't want to spend time configuring their own computer to spend time doing what they want.

### How?
  With the power of our community, we take the already awesome [fish shell][fish] to another level by creating simple-to-use plugins and themes.

[fish]: http://fishshell.com/

### What?
  Oh-my-fish is a user-friendly framework for managing your fish-shell configuration. It includes optional plugins (brew, git, rails, python, node, etc) and themes.


## Installation

Oh-my-fish is built for recent versions of the fish shell, namely "fish 2.0".

    curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

If you want to install it manually, keep reading.

## Usage

Enabling a new plugin or theme is as easy as it should be. Open your fish configuration file
`~/.config/fish/config.fish` and specify the theme and the plugins you want to use.

As an example, to enable rails and git plugins add this line `set fish_plugins git rails` 
to your configuration file.

## Customization

If you have many functions which go well together, you can create custom plugin in the `custom/plugins/PLUGIN_NAME`
directory and add to it as many functions as you want.

If you would like to override the functionality of a plugin distributed with oh-my-fish,
create a plugin of the same name in the `custom/plugins/` directory and it will be loaded
instead of the one shipped with oh-my-fish.

If you would like to use your custom theme, move it with the same name in the `custom/themes/` directory
and it will override the original theme in `themes/`.

If you just want to override any of the default behavior or add some environment variables,
just add a new file (ending in .load) into the `custom/` directory.

## Send us your theme!

I'm hoping to collect a bunch of themes for our command prompts. You can see existing ones in the [themes](themes/) directory.

## Switching to fish

If you wish to use fish as your default shell, use the following command:

    grep -q '^/usr/local/bin/fish$' /etc/shells; or echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish

chsh will prompt you for your password, and change your default shell.

To switch your default shell back, you can run:

    chsh -s /bin/bash

Substitute /bin/bash with /bin/tcsh or /bin/zsh as appropriate.

### Manual installation

1. Clone the repository
```
    git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
```

2. Create a new fish config by copying the fish template we've provided.
```
    cp ~/.oh-my-fish/templates/config.fish ~/.config/fish/config.fish
```

3. Start / restart fish (just open a new terminal)

## Uninstall

    rm -rf ~/.oh-my-fish


## Oh My ZSH

This project is heavily inspired by [oh-my-zsh][oh-my-zsh]

[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh/
