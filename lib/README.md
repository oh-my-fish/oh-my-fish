<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Core Library

> Oh My Fish Documentation

<br>

#### `require` _`[--no-bundle] <name>...`_
#### `require` _`[--no-bundle] --path <path>...`_

Does initialization of Oh My Fish compatible packages:

* Autoload function and completion paths
* Source key bindings
* Require dependencies from `bundle`
* Source `init.fish` file

`require` support packages in the following directory structure:

```
functions/
completions/
bundle
init.fish
key_bindings.fish
```

When using the form `require <name>...`, the search path for packages is
`$OMF_CONFIG` and `$OMF_PATH`. It's also possible to require directories
using `--path` switch. To ignore dependency loading you can also use
`--no-bundle` switch

This function is the base of Oh My Fish framework, being responsible for
the major part of framework's own startup code.

#### `autoload` _`[-e] <path>...`_

Manipulate [autoloading] path components.

All paths ending with `completions` are correctly added to or erased from
`$fish_complete_path`.

To add paths to autoload:

```fish
autoload $mypath $mypath/completions
```

To erase paths from autoload:

```fish
autoload -e $mypath $mypath/completions
```

[autoloading]: http://fishshell.com/docs/current/index.html#syntax-function-autoloading