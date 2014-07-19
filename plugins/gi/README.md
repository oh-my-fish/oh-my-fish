gitignore (gi) plugin
=====================

This plugin provides a simple command line interface to gitignore.io - a
website that generates .gitignore files based on your project requirements.

## Completions

The first step is to download the latest language list from gitignore.io so
that the fish completions can be updated.  Run `gi update-completions` to
download the completions, they will be stored in
`~/.config/fish/completions/gi.fish`

You should repeat this occasionally to keep up to date.

## Usage

Type `gi` followed by TAB to view the list of languages available.  To generate
a .gitignore file, specify the list of languages you are interested in and pipe
the output into the destination file.  Example for a go-lang project:

    gi go tags vagrant > .gitignore
    git add .gitignore
