## ocean

A fish theme with ocean in mind.


![Preview](https://cloud.githubusercontent.com/assets/129920/3533761/4702cc78-07d9-11e4-826f-e9f797e4bfa8.png)


Unicode-compatible fonts and terminals is required.

I would recommend iTerm2 + Solarized Dark for Mac users.

This theme is based loosely on [agnoster](https://gist.github.com/agnoster/3712874)

#### Characteristics
* Show a radioactive symbol (☢) when gain the root privileges (It's dangerous!)
* Current python virtualenv (if applicable)
* The anchor (⚓) turns red if the previous command failed
* Full path of current working directory
* Show the Git branch and dirty state (if applicable)
* Show **User@Hostname** if user is not the default user. Set the following two lines in your config.fish to turn on this feature:
    
    ```fish
    set -g theme display_user yes
    set -g default_user your_default_username
    ```

#### Troubleshooting in iTerm
If you see a colored anchor icon instead of the white one, this is because your system font is lacking the anchor icon, and iTerm defaults to the Apple Emoji Font. To get the right icon, either add it to your current font, or chose a powerline font that has it (like Meslo for Powerline, available in https://github.com/powerline/fonts), and select it for your Non-ASCII font.
