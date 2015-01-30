# getopts
> friendly [`getopts`](http://en.wikipedia.org/wiki/Getopts) for [fish](https://fishshell.com) :fish:

## Usage

```fish
Add `getopts` to your `$fish_plugins` or import directly into your library via `import plugins/getopts`.
```

## Premise
Every utility / function needs to handle arguments. What usually happens is that every function does all the grunt work to parse `$argv` itself, and while some patterns do tend to recur, it's different almost every time. Enter fish `getopts`.

## Synopsis
  `getopts <option string> [ARGV...]`

## Options
#### `<option string> [:][<letter>][[:]<word>[:[^]]]`

A string containing the option characters recognized by the utility calling `getopts`. If a `<letter>` or `<word>` ends in `:`, the option is expected to have an argument, which may be supplied separately or next to the option without spaces in the same string.

To indicate long options: `<letter>:<word>` and `<word>` are both valid option strings that will attempt to match `-<letter>` and `--<word>`.

To indicate _only_ short options, do not specify a `:<word>` after `<letter>`. For example, `a b` will match `-a` or `-b`.

To indicate optional arguments, use a `^` character after a `:` at the end of the option in the option string. For example `<letter>:^` and `<letter>:<word>:^` are both valid. Optional arguments should be supplied in the same string as the option and without spaces, e.g, `-<letter>value` will correctly assign `value` as the argument to the the option `<letter>`, but `-<letter>` value, will parse `value` as the next argument in `<ARGV>`.

To specify optional arguments using the option's long form, use a `=` character after the option: `--<word>=value`.

Use a `:` at the beginning of the option string to enable strict mode. If enabled, `getopts` will exit with a status __> 0__ if or when an unknown option is found. See [Diagnostics](#diagnostics).

#### `<ARGV>`

List of options and operands to parse. `getopts` prints any matched options as well as available argument separated by a \n to stdout and returns with a status of __0__ if there are still arguments; else returns with a status __> 0__ if the end of the options is reached or an error occurs. See [Diagnostics](#diagnostics).

#### Summary

| Option String          |  Argument     | Short Style     | Long Style   |
|:---------------:|:--------------:|------------------|:--------------------:|
   `"q:qqq:"`          | Required   | `-q1` `-q 1`    | `--qqq 1`           |
   `"q:qqq:^"`         | Optional    | `-q1`              | `--qqq=3`              |


## Description
`getopts` obtains options and their arguments from a list of parameters that, as indicated by <option string>, are single letters preceded by a `-` or words preceded by `--` and possibly followed by an argument value.

fish `getopts` follows the specifications described in the [Utility Syntax Guidelines](http://pubs.opengroup.org/onlinepubs/7908799/xbd/utilconv.html). The following is a summary of the features:

+ Short options; single letters preceded by `-`, and long options; words preceded by `--`, are both supported.

+ Single letters may be grouped. `-abc` → `-a -b -c`

+ Options required to take an argument can specify the argument either in the same string as the option or separated from the by a space. (1) `-a argument`, (2) `-aargument`

+ Options that can take an argument optionally shall specify the argument in the same string as the option argument if in short option style: `-aargument`, or separated by a `=` if in long form: `--long-form=argument`. If a blank space is used, the following argument will be treated independently.

+ Options can appear multiple times in the same argument list. `getopts` will print every match sequentally on each call, and should default to the short form of the option if available.

+ The option delimiter `:` and optional argument character `^` shall not be used as an option.

+ `getopts` will return the remaining operands when the end of the options is reached, i.e, a `--` argument that is not an option is found, or an argument that does not begin with `-` is found.

## Environment Variables
The following environment variables are used internally by `getopts`. These variables are erased from memory when the function returns 1.

+ `__getopts_optstr` _Whitespace trimmed option string._

+ `__getopts_argv` _Preprocessed copy of arguments._

+ `__getopts_index` _Index of the next argument to handle._

+ `__getopts_required` _List of options with required arguments._

+ `__getopts_optional` _List of options with optional arguments._


## <a name="diagnostics"></a>Diagnostics
Possible exit status values are:

+ __0__: An argument formed like an option was found. This causes getopts to print the option short-style and its argument if avaiable. If strict-mode is enabled setting the first character of the option to `:`, an unknown option will cause `getopts` to fail. See below.

+ __1__: The end of the options was reached. Remaining operands are also sent to stdout.

+ __2__: An option argument was missing.

+ __3__: An unknown option was found. Only if strict-mode is enabled.

## Examples
```fish
  function my_utility
    while set optarg (getopts "l:long x: o:optional:^" $argv)
      switch $optarg[1]
        case l
          echo handle `-l --long`
        case x
          echo handle `-x` w/ argument `$optarg[2]`
        case o
          echo handle `-o --optional` w/ optional argument `$optarg[2]`
        case \*
          echo unknown option `$optarg[1]`
      end
    end
    echo -n operands: "`$optarg`"
  end
```

## Links
+ [UNIX Utility Conventions](http://pubs.opengroup.org/onlinepubs/7908799/xbd/utilconv.html)

## License
[MIT](http://opensource.org/licenses/MIT) © [Jorge Bucaran](http://bucaran.me)
