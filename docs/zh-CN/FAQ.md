<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/FAQ.md">English</a> &bull;
  <b>简体中文</b>
</p>

# FAQ

感谢您花一些时间来阅读 FAQ。如果没有从下面找到你想问的问题欢迎给我们提交新的问题(Issue)。


## 什么是 Oh My Fish，我为什么会使用它？

Oh My Fish 是基于 [fishshell](https://fishshell.org) 封装的高级 _框架_。它可以帮你管理你的配置，主题和插件。


## 使用 Oh My Fish 我需要注意什么？

_什么都不需要注意_。安装 Oh My Fish 并想平时使用 Fish Shell 一样。当你需要获取更多帮助仅需要执行 `omf help`。


## 什么是 Oh My Fish 包（Packages）？

Oh My Fish 包是使用 fish 编写的一系列主题和插件用于扩展 Shell 的核心功能，比如初始化时执行自定义代码，添加自动补全等。


## Oh My Fish 包大概包含哪些类型?

目前粗略分类可以定义 3 中类型：

1. 配置增强。比如 [`pkg-pyenv`](https://github.com/oh-my-fish/pkg-pyenv) 检测 `pyenv` 是否安装并运行 `(pyenv init - | psub)`。

2. 主题. 查看我们的[主题目录](https://github.com/oh-my-fish).

3. 系统增强。比如 [`pkg-copy`](https://github.com/oh-my-fish/pkg-copy)，可同时支持 Linux 和 Mac OS X 的剪切工具。


## Oh My Fish 主要都干了什么?

+ 如果存在 `$OMF_CONFIG/before.init.fish`。

+ 自动加载 `$OMF_PATH/` 目录下已安装的插件和主题。

+ 自动加载你的配置。默认路径 `~/.config/omf`，除非你自定义了 `$OMF_CONFIG` 变量。

+ 自动加载 `$OMF_PATH` 和 `$OMF_CONFIG` 目录下面的所有的 `functions`

+ 如果存在加载 `$OMF_CONFIG/init.fish`。


## 如何升级之前已安装的 Oh My Fish?

> :warning: 务必先备份你的 dotfiles 和其他自定义的数据。

```
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

现在你可以安全的移除 `$fish_path`.

```fish
rm -rf "$fish_path"
```


## 如何把 fish 设置为我默认的 shell?

添加 Fish 到  `/etc/shells`:

```sh
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

切换并保存默认 shell:

```sh
chsh -s /usr/local/bin/fish
```

切换之前的 shell:
> 一般来说是 `/bin/bash`、`/bin/tcsh` 或者 `/bin/zsh`.

```sh
chsh -s /bin/bash
```
