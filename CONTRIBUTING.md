<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="128px" height="128px"/>
<img align="left" width="0" height="128px"/>

# Contributing

> Oh My Fish Documentation

<br>

## Summary

* [Issues](#issues)
* [Packages](#package-repositories)
* [Commit Messages](#commit-messages)
* [Code Style](#code-style)

Thanks for taking the time to read this guide! Oh My Fish is an open initiative and everyone is welcome to contribute!

## Bugs and discussions

Feel free to [open an issue](https://github.com/oh-my-fish/oh-my-fish/issues) for bug reports and discussing ideas.

When reporting bugs be sure to always fill the checklist below with data from your environment to help us debug your issue:

* Operating System: Arch Linux
* Fish Version: 2.3 (get using `fish --version`)
* Oh My Fish Version: 2  (get using `omf --version`)
* Git version: 1.9.5 (get using `git --version`)

When you have a new feature or large change in mind, please open a new issue with your suggestion to discuss the idea together.

## Package Repositories

This is the repository for the core Oh My Fish framework and bootstrap installer.

If your issue is related to a specific package, we still may be able to help, but consider visiting that package's issue tracker first.

## Commit Messages

+ Use [present tense](https://simple.wikipedia.org/wiki/Present_tense): "add awesome-package", not "added ..."
+ Use preceding subsystem when applicable: "registry: add theme foobar"
+ 50 characters or less for the first line of your commit
+ Use of [emoji](http://www.emoji-cheat-sheet.com/) is free

## Code Style

Different from Fish's code style, Oh My Fish uses 2 spaces for indentation. As fish language is very clean it's possible to use 2 spaces without making hard work with the code. Here goes some other styles we are using:

### Control Flow

When using `and` / `or` statements be sure to always break and indent.

```fish
set -q VAR
  or set -g VAR 42
```

### Functions

Use named arguments `-a`:

```fish
function greet -a message
  echo "$message"
end
```

Use `-d` description fields:

```fish
function greet -a message -d "Display a greeting message"
  echo "$message"
end
```

In order to avoid name collisions, use a prefix based on the name of your package. For example, if you are writing a `ninja` package, use `ninja.function_name`.


### Private Functions

`fish` does not have private functions, so in order to avoid polluting the global namespace you have a few options:


+ Use double underscore before your function name. For example, if you are writing a `ninja` package using `__ninja.function_name`.

+ Delete the function before returning using `functions -e function_name`

  ```fish
  function public_func
    function private_func
      # ...
      functions -e private_func
    end
  end
  ```
  
