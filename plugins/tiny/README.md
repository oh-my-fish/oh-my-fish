# _tiny_
> git.io for the lazy

## Synopsis

```
tiny [-u --user <username>]
     [-r --repo <repository>]
     [-c --code <vanity code>]
     [-o --open]
     [-h --help]

tiny [-c --code] [-o --open] owned-repo/url
```

## Description
Tap into [git.io](http://git.io), github's URL shortener service, to easily _shorten_ any github URL. The generated URL is printed to `stdout` and copied to the clipboard. You can optionally specify the `-o` flag to open it up on your browser too.

## Options

#### `-u --user`  
Username. If omitted, the git global config is queried.

#### `-r --repo`  
Repository name.

#### `-c --code`  
Own code to setup a personal `vanity` URL. A regular short URL is generated if the specified code is not available.

#### `-o --open`  
Open the short URL in the browser.

#### `-h --help`
Display usage help.

## Default Options

It's possible to omit the `-u` option and just specify the `url` to shorten.

```fish
tiny my-awesome-repo
```

In this case, the username will be retrieved from your git configuration file. You can add your github username to git's configuration like this:

```fish
git config github.user <your username>
```

Another common use case is to simply copy paste an existing URL into the terminal:

```fish
tiny [-o --open] http://github.com/facebook/react
```

## Diagnostics

  The following error codes are generated:

+ _1_  git.io failed to shorten the URL

+ _2_  invalid input or no input.


## Links

  + [git.io](http://git.io)
  + [Github's URL shortener](https://github.com/blog/985-git-io-github-url-shortener)


## License

[MIT](http://opensource.org/licenses/MIT) © [Jorge Bucaran](https://bucaran.me)
