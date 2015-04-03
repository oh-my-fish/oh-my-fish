<p align="center">
<a href="https://github.com/bpinto/oh-my-fish">
<img width=20% src="https://cloud.githubusercontent.com/assets/958723/6883431/9beb62b0-d58b-11e4-902c-2f716859a7ad.png">
</a>
</p>

<a name="omf"></a>

<p align="center">

<b><a href="#oh-my-fish">About</a></b>
|
<b><a href="#installation">Installation</a></b>
|
<b><a href="#usage">Usage</a></b>
|
<b><a href="#send-us-your-theme">Contribute</a></b>
|
<b><a href="#uninstall">Uninstall</a></b>
|
<b><a href="#license">License</a></b>
</p>

[![Build Status](https://travis-ci.org/bpinto/oh-my-fish.svg?branch=master)](https://travis-ci.org/bpinto/oh-my-fish) ![](https://img.shields.io/badge/Framework-Oh My Fish-blue.svg?style=flat) ![](https://img.shields.io/cocoapods/l/AFNetworking.svg) [![Join the chat at https://gitter.im/bpinto/oh-my-fish](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/bpinto/oh-my-fish?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


# Oh My Fish!

### Why?
  Developing on a shell should be a pleasure. Our goal is to help developers that do not want to spend time configuring their own computer to spend time doing what they want.

### How?
  With the power of our community, we take the already awesome [fish shell][fish] to another level by creating simple-to-use plugins and themes.

[fish]: http://fishshell.com/

### What?
  Oh-my-fish is a user-friendly framework for managing your fish-shell configuration. It includes optional plugins (brew, git-flow, rails, python, node, etc) and themes.

<br>
## Installation

Oh-my-fish is built for recent versions of the fish shell, namely "fish 2.0".

```fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
```

If you want to install it manually, [keep reading](#manual-installation).

## Usage

Enabling a new plugin or theme is as easy as it should be. Open your fish configuration file `~/.config/fish/config.fish` and specify the theme and the plugins you want to use.

As an example, to enable rails and git-flow plugins add this line `set fish_plugins git-flow rails` to your configuration file.

Before setting down on a theme, you might want to have a go with all themes using our quick [theme switcher](https://github.com/bpinto/oh-my-fish/blob/master/plugins/theme/README.md) by typing `theme --help` on your shell.

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

We are hoping to collect a bunch of themes for our command prompts. You can see existing ones in the [themes](themes/) directory.

> __Note__: Theme authors, make sure to include a screenshot in your pull request.

### Manual installation

1. Clone the repository
   ```fish
   git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
   ```

2. Create a new fish config by copying the fish template we've provided.
   ```fish
   cp ~/.oh-my-fish/templates/config.fish ~/.config/fish/config.fish
   ```

3. Start / restart fish (just open a new terminal)

## Uninstall

    rm -rf ~/.oh-my-fish
    
## License

[MIT](http://mit-license.org) © [Contributors](https://github.com/bpinto/oh-my-fish/graphs/contributors)

[Logo](https://cloud.githubusercontent.com/assets/958723/6847746/8d1b95b0-d3a7-11e4-866a-6bdc1eea0fe6.png) by [marcker](https://github.com/marcker):small_blue_diamond: [Attribution CC 4.0](http://creativecommons.org/licenses/by/4.0/)
