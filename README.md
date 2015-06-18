<p align="center">
<a href="https://github.com/oh-my-fish/oh-my-fish">
<img width=20% src="https://cloud.githubusercontent.com/assets/958723/6883431/9beb62b0-d58b-11e4-902c-2f716859a7ad.png">
</a>
</p>

<a name="omf"></a>

[![Build Status](https://travis-ci.org/oh-my-fish/oh-my-fish.svg?branch=master)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![](https://img.shields.io/badge/Framework-Oh My Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish) ![](https://img.shields.io/cocoapods/l/AFNetworking.svg) [![Join the chat at https://gitter.im/oh-my-fish/oh-my-fish](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/oh-my-fish/oh-my-fish?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


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

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
```

**NOTE**: The installation script renames your existing `config.fish` to `config.orig`, and replaces it with [the default oh-my-fish config](https://github.com/oh-my-fish/oh-my-fish/blob/master/templates/config.fish). If you have existing customizations to your fish config, you will need to manually include those customizations after the install.

If you want to install it manually, [click here](https://github.com/oh-my-fish/oh-my-fish/wiki/Manual-Installation).

## Usage

Open your fish configuration file `~/.config/fish/config.fish` and specify the theme and the plugins you want to use. And then run `omf install` on your terminal to install them.

Before setting down on a theme, you might want to have a go with all themes using our quick [theme switcher](https://github.com/oh-my-fish/plugin-theme) by typing `theme --help` on your shell.

## Upgrading from previous version

[![asciicast](https://asciinema.org/a/20802.png)](https://asciinema.org/a/20802)

## Customization

If you have many functions which go well together, you can create custom plugin in the `custom/plugins/PLUGIN_NAME` directory and add to it as many functions as you want.

If you would like to use your custom theme, move it with the same name in the `custom/themes/` directory and it will override the original theme in `themes/`.

If you just want to override any of the default behavior or add some environment variables, just add a new file (ending in .load) into the `custom/` directory.

## Contributing

Create an [issue](https://github.com/oh-my-fish/oh-my-fish/issues) linking to your repository and we will move it to the [oh-my-fish](https://github.com/oh-my-fish) organization.

## Uninstall

    rm -rf ~/.oh-my-fish
    
## License

[MIT](http://mit-license.org) © [Contributors](https://github.com/oh-my-fish/oh-my-fish/graphs/contributors)

[Logo](https://cloud.githubusercontent.com/assets/958723/6847746/8d1b95b0-d3a7-11e4-866a-6bdc1eea0fe6.png) by [marcker](https://github.com/marcker):small_blue_diamond: [Attribution CC 4.0](http://creativecommons.org/licenses/by/4.0/)
