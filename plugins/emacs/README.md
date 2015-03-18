# Emacs Plugin

This plugin replicates the functionality of the [emacs](https://www.gnu.org/software/emacs/) plugin for [oh-my-zsh](http://ohmyz.sh/).
It is essentially a wrapper around the very useful [emacs daemon](http://www.emacswiki.org/emacs/EmacsAsDaemon) capability.

Below is an extract from the original plugin source file:

"Emacs 23 daemon capability is a killing feature.
One emacs process handles all your frames whether
you use a frame opened in a terminal via a ssh connection or X frames
opened on the same host.
Benefits are multiple

  * You don't have the cost of starting Emacs all the time anymore
  * Opening a file is as fast as Emacs does not have anything else to do.
  * You can share opened buffered across opened frames.
  * Configuration changes made at runtime are applied to all frames."


### Usage

To use this plugin add `emacs` to `fish_plugins` in you fish config file:

```bash
set fish_plugins emacs
```

### Requirements

Emacs 23 or later is required for this plugin.