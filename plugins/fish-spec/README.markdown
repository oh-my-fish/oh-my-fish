# fish-spec
> Unit testing as simple as fish.

The following guide describes how to use the `fish-spec` plugin that is bundled with Oh-My-Fish.

## Install
Before you can use `fish-spec`, you need to install [Oh-My-Fish](https://github.com/bpinto/oh-my-fish).

## Usage
Just like any other plugin in Oh-My-Fish, you can start using `fish-spec` in two ways:

1. Adding the plugin to the `$fish_plugins` global variable declared in your fish configuration file, usually in  `~/.config/fish/config.fish`.
2. Directly importing the library into your fish file via [import](https://github.com/bpinto/oh-my-fish/blob/master/functions/import.fish).

As of now, the most common use case is the second method, as you will probably want to test your own plugins or libraries.

Inside your project's directory create a new `spec` folder (recommended) and add all your _spec_ files inside. _Spec_ files are regular fish files that must look like `*.spec.fish` and contain your tests.

You can have multiple `spec.fish` files to organize your tests in a per module basis, or you can squash everything into a single file and use describe blocks to separate groups of tests.

A `spec.file` usually looks like this:

```fish
import plugins/fish-spec
import path/to/the-library # plugins/the-library

# Use -d to enter a friendly description (optional)
function describe_library -d "the grand library"

  function before_all
  # Optional. Runs only once before all the tests.
  end

  function after_all
  # Optional. Runs only once after all the tests.
  end

  function before_each
  # Optional. Runs once before each test.
  end

  function after_each
  # Optional. Runs once after each test.
  end

  function it_does_this
    # ...
    expect $what_I_got --to-equal $what_I_wanted
  end

  function it_does_that
    # ...
    expect $a_list --to-contain-all $expected_items
  end

  # ...
end

# Run tests when this file is sourced.
spec.run $argv
```

## API

As of now, there is only one method you should be aware of, [expect](https://github.com/bpinto/oh-my-fish/blob/master/plugins/fish-spec/expect.fish):

> Assert a list of expected values match an actual value/s.

Under the hood, _expect_ checks an _actual_ value, usually a relevant result from your test unit, is equal to, not equal to, etc., to an _expected_ value, as determined by your test. Below are the list of conditions available to use with `expect`:

* __--to-equal__             `<actual>` value equals `<expected>` value
* __--to-not-equal__         `<actual>` value does not equals `<expected>` value
* __--to-contain-all__       all `<actual>` values exist in `<expected>` list
* __--to-not-contain-all__   all `<actual>` values does not exist in `<expected>` list
* __--to-be-true__           exit status should be _truthy_
* __--to-be-false__          exit status should be _falsy_

## FAQ
1. __How to use `fish-spec` without Oh-My-Fish?__
`fish-spec` is still a work in progress and as it currently stands, it is only available bundled with Oh-My-Fish. As the library matures and grows, however, it is possible a future guide describing how to export `fish-spec` will be written.

## Authors
+ [Bruno Pinto](https://github.com/bpinto)
+ [Jorge Bucaran](https://bucaran.me)

## License
[MIT](http://opensource.org/licenses/MIT)
