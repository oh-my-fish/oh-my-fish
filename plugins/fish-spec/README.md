# fish-spec
> Unit testing as simple as fish.

The following guide describes how to use the `fish-spec` plugin bundled with Oh-My-Fish.

## Install
Before you can use `fish-spec`, you need to install [Oh-My-Fish](https://github.com/oh-my-fish/oh-my-fish).

## Usage
Import the library into your fish file via [import](https://github.com/oh-my-fish/oh-my-fish/blob/master/functions/import.fish).

Inside your project's directory create a new `spec` folder and add all your _spec_ files inside. _Spec_ files are regular fish files that shall look like `*.spec.fish` and contain your tests.

You can have multiple `spec.fish` files to organize your tests in a per module basis, or you can squash everything into a single file and use describe blocks to separate groups of tests.

A `spec.file` usually looks like this:

```fish
import plugins/fish-spec
import plugins/the-library

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

As of now, there is only one method you should be aware of, [expect](https://github.com/oh-my-fish/oh-my-fish/blob/master/plugins/fish-spec/expect.fish):

> Assert a list of expected values match an actual value/s.

Under the hood, _expect_ checks an _actual_ value, usually a relevant result from your test unit, is equal to, not equal to, etc., to an _expected_ value, as determined by your test. Below are the list of conditions available to use with `expect`:

* __--to-equal__
`<actual>` value equals the `<expected>` value. For example:
```fish
expect $my_value --to-equal 5
```

* __--to-not-equal__
`<actual>` value does not equal the `<expected>` value
```fish
expect $my_string --to-not-equal "oh-the-fish"
```

* __--to-contain-all__ all `<actual>` values exist in the `<expected>` list
```fish
expect $elements --to-contain-all "earth" "fire" "water" "air"
```

* __--to-not-contain-all__ no `<actual>` values exist in `<expected>` list
```fish
expect $our_planets --to-not-contain-all "golomo" "borg prime" "rigel" "terra"
```

* __--to-be-true__ the exit status should be _truthy_
```fish
__my_plugin_improve_workflow
expect $status --to-be-true
```

* __--to-be-false__ the exit status should be _falsy_
```fish
__my_plugin_erase_drive
expect $status --to-be-false
```

## FAQ
1. __How to use `fish-spec` without Oh-My-Fish?__
`fish-spec` is currently only available bundled with Oh-My-Fish. As the library matures and grows, however, a future guide describing how to export `fish-spec` may be written.

## Authors
+ [Bruno Pinto](https://github.com/bpinto)
+ [Jorge Bucaran](https://bucaran.me)

## License
[MIT](http://opensource.org/licenses/MIT)
