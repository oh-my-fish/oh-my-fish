<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
  <b>English</b> &bull;
  <a href="../zh-CN/Packages.md">简体中文</a> &bull;
  <a href="../ru-RU/Packages.md">Русский</a>
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

Oh My Fish package API offer some lifecycle hooks, which are completely optional. When using `omf new` command some of them are created with sample code.

>Hooks that are called at startup time (`init.fish` and `key_bindings.fish`) can slow down shell startup. Be sure to avoid slow code at startup time! Also, if your package doesn't need a hook file, be sure to remove it.

## Initialization

If you want code to be executed when the package loads, you can add code to `init.fish` file at package's root directory:

```fish
echo "hello_world initialized"
```

Inside this hook runs you can access three package-related variables:

* `$package`: Package name
* `$path`: Package installation path
* `$dependencies` : Package dependencies

Use this hook to modify the environment, load resources, autoload functions, etc. If your package does not export any function, you can still use this event to add functionality to your package, or dynamically create functions.

## Key Bindings

If your package or theme need to use key bindings, be sure to set them up in `key_bindings.fish`.

>Themes can define key bindings too! Oh My Fish will reload key bindings when you switch themes.

## Uninstall

Code inside `uninstall.fish` hook will be called before a package is removed via `omf remove <pkg>`. 

>Packages can use this hook to clean up custom resources, etc.

Inside this hook you can access one package-related variable:

* `$path`: Package installation path

# Make it public

Oh My Fish keeps a registry of public packages under `$OMF_PATH/db/`.

To add your package to the registry you need to:

```fish
# For packages:
omf submit pkg/hello_world https://github.com/oh-my-fish/plugin-hello_world.git

# For themes
omf submit theme/my_theme https://github.com/oh-my-fish/theme-my_theme.git
```

This will add a new entry to your local copy of the registry. Now you just need to [send us a PR][omf-pulls-link] to update the global registry.

>When sending pull requests with package URL under Oh My Fish organization (https://github.com/oh-my-fish) we will allocate a repository inside the organization so you can push your work and join the community! :tada:


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
