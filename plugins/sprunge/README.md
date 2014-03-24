# fish-sprunge

## Usage

Place (or link) the *.fish* file under your **fish-shell** directory (typically `~/.config/fish/`) in the `functions` subdir.  

You can then sprunge:

 * a file from a redirection: `sprunge < README.md`
 * a file from an argument: `sprunge README.md`
 * the result of a command through a pipe: `cat README.md | sprunge`
 * some arbitrary text: `sprunge "I <3 paulloz"`
