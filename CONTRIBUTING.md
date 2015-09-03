<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
    <img width=120px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>

<br>

<p align="center">
<b><a href="#issues">Issues</a></b>
|
<b><a href="#package-repositories">Packages</a></b>
|
<b><a href="#commit-messages">Commit Messages</a></b>
|
<b><a href="#code-style">Code Style</a></b>
</p>

# Contributing

Thanks for taking the time to read this guide and please _do_ contribute to Oh My Fish. This is an open initiative and _everyone_ is welcome. :metal:

## Issues

Please [open an issue](https://github.com/oh-my-fish/oh-my-fish/issues) for bug reports / patches. Include your OS version, code examples, stack traces and everything you can to help you debug your problem.

If you have a new feature or large change in mind, please open a new issue with your suggestion to discuss the idea together.

## Package Repositories

This is the repository for the core Oh My Fish framework and bootstrap installer.

If your issue is related to a specific package, we still may be able to help, but consider visiting that package's issue tracker first.

## Commit Messages

+ Use the [present tense](https://simple.wikipedia.org/wiki/Present_tense) ("add awesome-package" not "added ...")

+ Less than 72 characters or less for the first line of your commit.

+ Use of [emoji](http://www.emoji-cheat-sheet.com/) is definitely encouraged. :lollipop:

## Code Style

> These rules are not set in stone. Feel free to open an issue with suggestions and/or feedback.

### Control Flow

Using `if..else..end` blocks is preferred.

```fish
if not set -q ENV_VARIABLE
  set -g ENV_VARIABLE 42
end
```

The following syntax is more concise, but arguably less transparent.

> You still may use `and` / `or` statements if you consider `if..else..then` to be overkill.

```fish
set -q VAR; or set -g VAR 42
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

In order to avoid name collisions, use a prefix based on the name of your package. For example, if you are writing a `ninja` package use `ninja.function_name`.


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

+ Use blocks

### Blocks

Blocks allow you to write code resembling macro expressions composed of smaller blocks without relying on variables.

Compare the following _without_ blocks:

```fish
set -l colors green1 green2 green3
if test $error -ne 0
  set colors red1 red2 red3
end

for color in $colors
  printf "%s"(set_color $color)">"
end
```

and _using_ blocks:

```fish
for color in (begin
  if test $error -ne 0
    and printf "%s\n" red1 red2 red3
    or printf "%s\n" green1 green2 green3
  end)
  printf "%s"(set_color $color)">"
end
```

The second example does not use a `colors` variable.
