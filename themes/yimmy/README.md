## yimmy

A simple two-line theme best displayed on a terminal configured with Solarized
Dark colors.

&lceil;`user@host ~/c/w/dir (branch+)`  
&lfloor;`%`

Characteristics:

- Uses the fish prompt_pwd, so paths will be abbreviated
- Git branch name will be followed by a red + if dirty
- Indicates Git work-in-progress (gwip/gunwip) if detected
- Tradition bourne prompt characters: $ for user, # for root
- Prompt character is colored red if previous command had a non-zero exit
  status
