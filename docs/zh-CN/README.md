<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.md) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)

Oh My Fish 提供核心基础设施的配置，允许每个人可以轻松安装插件或随心所欲更换 Shell 外观样式，它的速度敏捷和可扩展性让你**如鱼得水**。

> Also in&nbsp;
> <a href="../../README.md">🇺🇸</a>
> <a href="../ru-RU/README.md">🇷🇺</a>
> <a href="../uk-UA/README.md">🇺🇦</a>
> <a href="../pt-BR/README.md">🇧🇷</a>

<br>

# 安装

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf help
```

或者 _下载脚本_ 后自己执行：

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install
```

# 快速入门

Oh My Fish 自带的辅助命令工具 `omf` 可以帮助你快速获取安装新插件和主题。

#### `omf update`

更新自身和已安装的所有插件和默认主题。

#### `omf install` _`[<name>|<url>]`_

安装 _一个或多个_ 插件。

- 你可以通过输入指定的 URL 直接安装插件 `omf install URL`
- 当没有执行没有传入任何参数，将会从 [bundle](#dotfiles) 文件检索并安装本地尚未安装的插件和主题。

#### `omf list`

显示本地已安装的插件列表。

#### `omf theme` _`<theme>`_

应用一个主题。查看全部可用主题执行 `omf theme`。安装之前你也可以[预览现有主题](../Themes.md)。

#### `omf remove` _`<name>`_

移除主题或插件。

> 包可以使用卸载挂钩，所以资源的自定义清理可以做到卸载时。有关更多信息，请参见 [卸载](Packages.md#uninstall) 。

#### `omf new pkg | theme` _`<name>`_

创建新插件和主题的生成工具。

> 创建的模板会新创建并保存于 `$OMF_CONFIG/{pkg | themes}/` 文件夹下面。

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

添加一个新的插件。提交新主题请使用 `omf submit` _`themes/<name>`_ _`<url>`_。

新插件或新主题需要托管于 Git 仓库，上面命令 url 需要输入 git 仓库的 url 地址。
此命令仅仅是把 git 仓库地址保存与 Oh My Fish 的 db 数据库，同时还需要[提交 PR][omf-pulls-link]让组织把你的插件或主题归于框架。

#### `omf doctor`

使用前[开馆问题][omf-issues-new] 解决。

#### `omf destroy`

卸载 Oh My Fish.

# 高级用法

Oh My Fish 安装脚本会把自身启动代码加载到 fish 的配置文件 (`~/.config/fish/config.fish`).

## 启动脚本

每次你新打开 Shell 都会从 _配置文件_ (默认：`~/.config/omf`) 加载 Oh My Fish 的启动脚本([`init.fish`](../../init.fish)) 进行初始化：
自动加载插件，主题和你自定义的配置文件。更多信息请查看[FAQ](FAQ.md#oh-my-fish-包大概包含哪些类型).

## Dotfiles

`$OMF_CONFIG` 目录存储用户使用 Oh My Fish 的重要配置参数，这是最完美的方式把该目录的所有文件加入你的 dotfiles 或加入到版本控制。
有四个重要文件：

- __`theme`__ - 当前主题
- __`bundle`__ - 显示当前已安装的插件/主题列表
- __`init.fish`__ - 壳开始后执行的自定义脚本
- __`before.init.fish`__ - 壳开始前执行的自定义脚本

它强烈建议您自定义的启动命令进入 `init.fish` 文件而不是 `~/.config/omf/config.fish`，因为这可以让你保持在版本控制整个 `$OMF_CONFIG` 目录。

如果你需要的Starup命令来运行*之前*噢，我的鱼开始加载插件，将它们放置在 `before.init.fish` 代替。如果你不确定，通常最好把东西 `init.fish` 。

### 关于 bundle

每次当有插件和主题被安装或移除都会更新 `bundle` 文件。你也可以手动编辑该文件并执行 `omf install` 保证变更状态。
需要注意的是当有插件、主题被添加到 bundle 文件会自动被安装。但从 bundle 中移除掉它们却不会从用户安装路径移除物理文件。

## 创建插件

Oh My Fish 使用了友好的插件架构能够简化插件的开发，其中包括初始化、卸载事件和函数的自动加载。[查看相关文档](Packages.md) 获取更多信息。

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls

[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
