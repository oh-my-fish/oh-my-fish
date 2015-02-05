# pbcopy
> OSX's pbcopy and pbpaste for Linux

pbcopy paste data from the clipboard to STDOUT.
pbpaste paste data from the clipboard.

## Usage

Copy a list of files in your home directory to the OS X clipboard:
```fish
$ ls ~ | pbcopy
```

Copy the contents of a file to the clipboard:
```fish
$ pbcopy < cookies.txt
```

Copy part of a file to the clipboard
```fish
$ grep 'ip address' serverlist.txt | pbcopy
```

Paste from your clipboard to stdout
echo `pbpaste`
```fish
$ pbpaste
```

Paste from your clipboard to a file
```fish
$ pbpaste > clipboard.txt
```

Paste from your clipboard to a file in a remote host
```fish
$ pbpaste | ssh username@host 'cat > ~/myclipboard.txt'
```