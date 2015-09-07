## Creating

Package names may only contain lowercase letters and hyphens to separate words. To scaffold out a new package:

```fish
$ omf new pkg my_package

my_package/
  README.md
  my_package.fish
  completions/my_package.fish
```

> Use `omf new theme my_theme` for themes.

Please provide [auto completion](http://fishshell.com/docs/current/commands.html#complete) for your utilities if applicable and describe how your package works in the `README.md`.


`my_package.fish` defines a single function:

```fish
function my_package -d "My package"
end
```

> Bear in mind that fish lacks a private scope so consider the following options to avoid polluting the global namespace:

+ Prefix functions: `my_package_my_func`.
+ Using [blocks](http://fishshell.com/docs/current/commands.html#block).


## Submitting

Oh My Fish keeps a registry of packages under `$OMF_PATH/db/`.

To create a new entry run:

```fish
omf submit pkg/my_package .../my_package.git
```

Similarly for themes use:

```fish
omf submit theme/my_theme .../my_theme.git
```

This will add a new entry to your local copy of the registry. Please [send us a PR][omf-pulls-link] to update the global registry.


## Initialization

If you want to be [notified](http://fishshell.com/docs/current/commands.html#emit) when your package loads, declare the following function in your `my_package.fish`:

```fish
function init -a path --on-event init_mypkg
end
```

Use this event to modify the environment, load resources, autoload functions, etc. If your package does not export any functions, you can still use this event to add functionality to your package.

## Uninstall

Oh My Fish emits `uninstall_<pkg>` events before a package is removed via `omf remove <pkg>`. Subscribers can use the event to clean up custom resources, etc.

```fish
function uninstall --on-event uninstall_pkg
end
```


[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls
