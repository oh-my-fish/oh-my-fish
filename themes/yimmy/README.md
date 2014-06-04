## yimmy theme

A simple two-line theme best displayed on a terminal configured with Solarized
Dark colors.

    user@host ~/c/w/dir (branch *)
    >

Characteristics:

- Standard fish prompt characters: > for user, # for root
- Uses the fish prompt_pwd, so paths will be abbreviated
- Uses built-in `__fish_git_prompt` functionality
- Indicates Git work-in-progress (gwip/gunwip) if detected
- Prompt character is colored red if previous command had a non-zero exit
  status
- Includes completmentary `LS_COLORS`
