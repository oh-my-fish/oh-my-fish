<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <b>English</b> &bull;
  <a href="docs/zh-CN/FAQ.md">简体中文</a>
</p>


# FAQ

Thanks for taking the time to read this FAQ. Feel free to create a new issue if your question is not answered here.


## What is Oh My Fish and why do I want it?

Oh My Fish is a _framework_ for the [fishshell](https://fishshell.org). It helps you manage your configuration, themes and packages.


## What do I need to know to use Oh My Fish?

_Nothing_. You can install Oh My Fish and keep using Fish as usual. When you are ready to learn more just type `omf help`.


## What are Oh My Fish packages?

Oh My Fish packages are themes or plugins written in fish that extend the shell core functionality, run code during initialization, add auto completion for known utilities, etc.


## What kind of Oh My Fish packages are there?

There are roughly 3 kinds of packages:

1. Configuration utilities. For example [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) checks whether `pyenv` exists in your system and runs `(pyenv init - | psub)` for you during startup.

2. Themes. Check our [theme gallery](https://github.com/oh-my-fish).

3. Traditional shell utilities. For example [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy), a clipboard utility compatible across Linux and OSX.


## What does Oh My Fish do exactly?

+ Run `$OMF_CONFIG/before.init.fish` if available.

+ Autoload installed packages and themes under `$OMF_PATH/`.

+ Autoload your config path. `~/.config/omf` by default, but configurable via `$OMF_CONFIG`.

+ Autoload any `functions` directory under `$OMF_PATH` and `$OMF_CONFIG`

+ Run `$OMF_CONFIG/init.fish` if available.


## How can I upgrade from an existing Oh My Fish installation?

> :warning: Remember to backup your dotfiles and other sensitive data first.

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

You can now safely remove `$fish_path`.

```fish
rm -rf "$fish_path"
```


## How do I use fish as my default shell?

Add Fish to `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Make Fish your default shell:

```sh
chsh -s /usr/local/bin/fish
```

To switch your default shell back:
> Substitute `/bin/bash` with `/bin/tcsh` or `/bin/zsh` as appropriate.

```sh
chsh -s /bin/bash
```
