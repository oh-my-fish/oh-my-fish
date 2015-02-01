# Contributing

We love pull requests. Here's a quick guide.

Fork and make your change. Make sure the tests pass:

    ./script/run-tests.fish -v

Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/bpinto/oh-my-fish/compare/

At this point you're waiting on us. We usually comment on pull requests
within a few hours. We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests.
* Follow our [style guide][style].
* Write a [good commit message][commit].

## Style Guide

* Indentation should follow the "2-space convention".
* Keep line length to a maximum of 100 characters.

### Plugins

If your plugin is complex, make sure to include tests, we suggest using [fish-spec](fish-spec).

### Themes

Make sure to include a screenshot in your pull request, but don't commit the file to git. A nifty way is too post a comment with the image and link directly to it.

[fish-spec]: https://github.com/bpinto/oh-my-fish/tree/master/plugins/fish-spec
[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[style]: #style-guide
