<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <a href="../en-US/Packages.md">English</a> &bull;
  <b>简体中文</b>
</p>

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

如果你想在插件被加载时收到[通知](http://fishshell.com/docs/current/commands.html#emit)，你可以在 `hello_world.fish` 添加下面的代码：

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

该事件可以用于修改环境变量、加载资源和自动加载函数等。如果你的插件没有输出任何的函数，你仍然可以使用该事件加载其他的函数。

## 卸载

Oh My Fish 通过 `omf remove <pkg>` 移除已安装的插件前会发送 `uninstall_<pkg>` 事件。订阅者可以使用该事件清理自定义的资源等操作。

```fish
function uninstall --on-event uninstall_hello_world
end
```


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