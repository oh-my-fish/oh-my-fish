<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Packages

> Oh My Fish Documentation&nbsp;&bull;&nbsp;Also in
> <a href="../ru-RU/Packages.md">🇷🇺</a>
> <a href="../zh-CN/Packages.md">🇨🇳</a>
> <a href="../uk-UA/Packages.md">🇺🇦</a>
> <a href="../pt-BR/Packages.md">🇧🇷</a>
<br>

# Creating

To learn package creation let's create a new package that will provide a `hello_world` command for your shell. Package names may only contain lowercase letters and hyphens to separate words.

Oh My Fish can scaffold a package structure for you. Use the command `omf new`:

```fish
$ omf new pkg hello_world
```

> Use `omf new theme my_theme_name` for themes.

The utility changes the current directory to the newly created package:

```
$ ls -l
  README.md
  init.fish
  functions/hello_world.fish
  completions/hello_world.fish
```

>Always describe how your package works in the `README.md`.


>Also read more about [auto completion](http://fishshell.com/docs/current/commands.html#complete) and take care to provide it for your utilities when applicable.

`functions/hello_world.fish` defines a single function:

```fish
function hello_world -d "Prints hello world"
  echo "Hello World!"
end
```

Each function in your package must be declared in its own file under `functions` directory. This is required by fish autoloading mechanism, which loads functions on demand, avoiding loading unused functions at startup time.

Bear in mind that fish lacks a private scope, so if you need to split your package into functions,  avoid name clashes prefixing your functions with something unique -- like your package name (e.g. `hello_world_print_help`). To avoid polluting command namespace, consider prefixing private functions with two underscores (e.g. `__function_name_print_help`).

# Hooks

Oh My Fish provides a "hooks" system that allows you to write scripts for your package that run when other interesting events occur. Packages can use these hooks to provide advanced installation, custom resource management, etc. Hooks are ordinary Fish scripts named after the event they are triggered by. Most hooks reside in a `hooks` directory inside a package's project directory.

>Hooks that are called at startup time (`init.fish` and `key_bindings.fish`) can slow down shell startup. Be sure to avoid slow code at startup time! Also, if your package doesn't need a hook file, be sure to remove it.

The working directory inside a hook is always set to the root directory of the package. The hooks Oh My Fish currently supports are listed below:

## `init`

The `init` hook is run once when the shell first loads. Scripts to handle this hook should be located at `init.fish` at package's root directory.

Inside this hook, you can access three package-related variables:

* `$package`: Package name
* `$path`: Package installation path
* `$dependencies`: Package dependencies

For example, with an `init.fish` script containing the following code:

```fish
echo "hello_world initialized"
```

you will see the line `hello_world initialized` at the top of the terminal when it is first opened.

Use this hook to modify the environment, load resources, autoload functions, etc. If your package does not export any function, you can still use this event to add functionality to your package, or dynamically create functions.

## `key_bindings`

If your package or theme need to use key bindings, be sure to set them up in the `key_bindings` hook. Key binding scripts must be located at `key_bindings.fish` at package's root directory. In this hook you can freely use the [`bind`][fish-bind] command to define custom key bindings.

>Themes can define key bindings too! Oh My Fish will reload key bindings when you switch themes.

## `install`

The `install` hook is triggered when a package is first installed. Scripts for this hook must be located at `hooks/install.fish`.

Inside this hook, you can access two package-related variables:

* `$package`: Package name
* `$path`: Package installation path

This hook is useful for downloading additional resources, setting up Git submodules, or installing third-party dependencies like Bash scripts.

## `update`

As you might have guessed, the `update` hook is triggered for a package after it is updated. Scripts for this hook must be located at `hooks/update.fish`.

Inside this hook, you can access two package-related variables:

* `$package`: Package name
* `$path`: Package installation path

This hook is useful for updating Git submodules or checking for new versions of third-party dependencies.

## `uninstall`

The `uninstall` hook will be triggered before a package is removed via `omf remove <pkg>`. Scripts for this hook must be located at `hooks/uninstall.fish`.

Inside this hook, you can access two package-related variables:

* `$package`: Package name
* `$path`: Package installation path

Packages can use this hook to clean up custom resources, etc.

> Note: for backwards-compatibility, uninstall hooks will also be run if they are located at `uninstall.fish` in the package root.

# Make it public

The official registry of public packages is managed in the [oh-my-fish/packages-main](https://github.com/oh-my-fish/packages-main) repository. See the README of that repository for instructions on how to add your package to the official package database.


[fish-bind]: http://fishshell.com/docs/current/commands.html#bind
[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
