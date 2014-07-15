## bobthefish

bobthefish is a Powerline-style, Git-aware fish theme optimized for awesome.

![bobthefish][screenshot]

You will probably need a [Powerline-patched font][patching] for this to work.
[I recommend picking one of these][fonts].

This theme is based loosely on [agnoster][agnoster].


### Features

 * A helpful, but not too distracting, greeting.
 * A subtle timestamp hanging out off to the right.
 * Powerline-style visual hotness.
 * More colors than you know what to do with.
 * An abbreviated path which doesn't abbreviate the name of the current project.
 * All the things you need to know about Git in a glance.
 * Visual indication that you can't write to the current directory.


### The Prompt

 * Flags:
     * Previous command failed (!)
     * Background jobs (%)
     * You currently have superpowers ($)
 * User@Host (unless you're the default user)
 * Abbreviated parent directory
 * Current directory or Git project name
 * Current project's Git branch ( master) or detached head (➦ d0dfd9b)
 * Git status, via colors and flags:
     * Dirty working directory (*)
     * Untracked files (…)
     * Staged changes (~)
     * Stashed changes ($)
     * Unpulled commits (-)
     * Unpushed commits (+)
     * Unpulled *and* unpushed commits (±)
 * Abbreviated project-relative path


[screenshot]: http://i.0x7f.us/bobthefish.png
[patching]:   https://powerline.readthedocs.org/en/latest/fontpatching.html
[fonts]:      https://github.com/Lokaltog/powerline-fonts
[agnoster]:   https://gist.github.com/agnoster/3712874
