<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Packages

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../en-US/Packages.md">🇺🇸</a>
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
<br>

# 创建插件或主题

本教程通过创建一个简单的 `hello_world` 让我们一起来学习，插件名通常仅接受小写英文字母和连字符分割每个单词。

Oh My Fish 提供一个脚手架工具帮助生成插件或主题的模板结构。通过执行命令 `omf new` 生成：

```fish
$ omf new pkg hello_world
```

> 使用 `omf new theme my_theme_name` 创建主题模板。

该操作会创建插件的目录并切换到该路径下面：

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

通常在 `README.md` 描述插件的工作原理，依据插件情况可以提供一些 [auto completion](http://fishshell.com/docs/current/commands.html#complete)

`hello_world.fish` 定义一个简单的 function：

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

在你的插件中，每个函数的声明定义必须存放在独立的文件中，这是 fish 自动加载机制强制的，旨在加载功能所需要的，避免无用函数的过渡加载。

请记住，fish 缺乏一个私有范围，所以如果你需要分离你的插件到函数，考虑私有函数增加前缀类似 `__hello_world.my_extra_function` 以避免类名冲突和全局命名控件的污染。


# 事件

利用 fish 事件的优势，目前 Oh My Fish 定义了两个事件提供给开发者使用：

## 初始化

如果要执行的代码包时加载，可以为`init.fish`文件在包的根目录下添加代码：

```fish
echo "hello_world initialized"
```

这里面挂机运行，您可以访问包相关的变量：

* `$package`：包名称
* `$path`：软件包的安装路径
* `$dependencies`：软件包依赖

使用这个钩子来修改环境，资源负载，自动加载的功能，等等。如果你的包不出口任何功能，您仍可以使用此事件将功能添加到您的包，还是动态创建功能。

## 卸载

哦，我的鱼还设有`uninstall.fish`挂钩，通过 `omf remove <pkg>`被删除软件包之前被调用。包可以使用这个钩子清理自定义的资源，等等。

本书中，你可以访问一个包相关的变量：
* `$path`：软件包的安装路径


# 发布插件

Oh My Fish 在 `$OMF_PATH/db/` 目录注册已发布的插件或主题。

添加你的插件或主题到注册目录需要执行:

```fish
# 插件：
omf submit pkg/hello_world .../hello_world.git

# 主题：
omf submit theme/my_theme .../my_theme_name.git
```

此操作仅在本地会添加一个新的注册索引，最后你还需要[提交 PR][omf-pulls-link]并入官方的注册索引。


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
