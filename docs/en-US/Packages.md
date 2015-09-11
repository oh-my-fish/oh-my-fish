<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <b>English</b> &bull;
  <a href="docs/zh-CN/Packages.md">简体中文</a>
</p>

# Creating

To learn package creation let's create a new package that will provide a `hello_world` command for your shell. Package names may only contain lowercase letters and hyphens to separate words.

Oh My Fish can scaffold a package structure for you. Use the command `omf new`:

```fish
$ omf new pkg hello_world
```

> Use `omf new theme my_theme_name` for themes.

The utily changes the current directory to the newly created package:

```
$ ls -l
  README.md
  hello_world.fish
  completions/hello_world.fish
```

Always describe how your package works in the `README.md`. Also read more about [auto completion](http://fishshell.com/docs/current/commands.html#complete) and also take care to provide it for your utilities when applicable.

`hello_world.fish` defines a single function:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Each function in your package must be declared in its own file. This is required by fish autoloading mechanism, which loads functions on demand, avoiding loading unused functions.

Bear in mind that fish lacks a private scope, so if you need to split your package into functions, consider prefixing private functions like this: `__hello_world.my_extra_function`, to avoid both name clashes and global namespace pollution.

# Events

Packages were designed to take advantages of fish events. There are currently two events that Oh My Fish will emit to your package:

## Initialization

If you want to be [notified](http://fishshell.com/docs/current/commands.html#emit) when your package loads, declare the following function in your `hello_world.fish`:

```fish
function init -a path --on-event init_hello_world
  echo "hello_world initialized"
end
```

Use this event to modify the environment, load resources, autoload functions, etc. If your package does not export any functions, you can still use this event to add functionality to your package.

## Uninstall

Oh My Fish emits `uninstall_<pkg>` events before a package is removed via `omf remove <pkg>`. Subscribers can use the event to clean up custom resources, etc.

```fish
function uninstall --on-event uninstall_hello_world
end
```


# Make it public

Oh My Fish keeps a registry of public packages under `$OMF_PATH/db/`.

To add your package to the registry you need to:

```fish
# For packages:
omf submit pkg/hello_world .../hello_world.git

# For themes
omf submit theme/my_theme .../my_theme_name.git
```

This will add a new entry to your local copy of the registry. Now you just need to [send us a PR][omf-pulls-link] to update the global registry.


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
