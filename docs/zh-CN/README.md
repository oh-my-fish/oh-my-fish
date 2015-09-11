<img src="docs/logo.png" align="left" width="192px" height="192px"/>
<img src="" align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE.md) [![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Travis Build Status](https://img.shields.io/badge/gitter-join_chat-brightgreen.svg?style=flat-square)](https://gitter.im/oh-my-fish/oh-my-fish?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Oh My Fish 提供核心基础设施的配置，允许每个人可以轻松安装插件或随心所欲更换 Shell 外观样式，它的速度敏捷和可扩展性让你**如鱼得水**。

<br><br>

# 安装

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
omf help
```

或者 _下载脚本_ 后自己执行：

```fish
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
chmod +x install
./install
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

应用一个主题。查看全部可用主题执行 `omf theme`.

#### `omf remove` _`<name>`_

移除主题或插件。

> 插件如果注册(subscribed)过 `uninstall_<pkg>` 事件将会在插件移除前触发，因此你可以自定义自身清理和扫尾的工作以保证插件干净移除。
详见[卸载部分](Packages.md#uninstall)获取更多信息。

#### `omf new pkg | theme` _`<name>`_

创建新插件和主题的生成工具。

> 创建的模板会新创建并保存于 `$OMF_CONFIG/{pkg | themes}/` 文件夹下面。

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

添加一个新的插件。提交新主题请使用 `omf submit` _`themes/<name>`_ _`<url>`_。

新插件或新主题需要托管于 Git 仓库，上面命令 url 需要输入 git 仓库的 url 地址。
此命令仅仅是把 git 仓库地址保存与 Oh My Fish 的 db 数据库，同时还需要[提交 PR][omf-pulls-link]让组织把你的插件或主题归于框架。

#### `omf query` _`<variable name>`_

用于查看所有会话的变量。用于查看调试类似 _PATH_ 变量，比如 `$fish_function_path`，`$fish_complete_path` 等。

#### `omf destroy`

卸载 Oh My Fish.

# 高级用法

Oh My Fish 安装脚本会把自身启动代码加载到 fish 的配置文件 (`~/.config/fish/config.fish`).

## 启动脚本

每次你新打开 Shell 都会从 _配置文件_ (默认：`~/.config/omf`) 加载 Oh My Fish 的启动脚本([`init.fish`](../init.fish)) 进行初始化：
自动加载插件，主题和你自定义的配置文件。更多信息请查看[FAQ](docs/FAQ.md#what-does-oh-my-fish-do-exactly).

## Dotfiles

`$OMF_CONFIG` 目录存储用户使用 Oh My Fish 的重要配置参数，这是最完美的方式把该目录的所有文件加入你的 dotfiles 或加入到版本控制。
这里有两个重要的文件：

- __`theme`__ - 当前主题
- __`bundle`__ - 显示当前已安装的插件/主题列表

### 关于 bundle

每次当有插件和主题被安装或移除都会更新 `bundle` 文件。你也可以手动编辑该文件并执行 `omf install` 保证变更状态。
需要注意的是当有插件、主题被添加到 bundle 文件会自动被安装。但从 bundle 中移除掉它们却不会从用户安装路径移除物理文件。

## 创建插件

Oh My Fish 使用了友好的插件架构能够简化插件的开发，其中包括初始化、卸载事件和函数的自动加载。[查看相关文档](docs/Packages.md) 获取更多信息。

# 开源协议

Copyright (c) 2015 Bruno Ferreira Pinto. 详见 [开源协议文件](LICENSE).

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls