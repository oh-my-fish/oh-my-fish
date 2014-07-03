# name: ocean
# A fish theme with ocean in mind.


## Set this options in your config.fish (if you want to)
# set -g theme_display_user yes
# set -g default_user default_username

set __oceanfish_glyph_anchor \u2693
set __oceanfish_glyph_flag \u2691
set __oceanfish_glyph_radioactive \u2622

function _git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end


function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end


function fish_prompt
    set -l last_status $status
    set -l magenta (set_color magenta)
    set -l red (set_color red)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l black (set_color black)
    set -l bg_blue (set_color -b blue)
    set -l bg_cyan (set_color -b cyan)
    set -l bg_white (set_color -b white)
    set -l bg_red (set_color -b red)
    set -l bg_yellow (set_color -b yellow)
    set -l normal (set_color normal)
    set -l cwd $white(prompt_pwd)
    set -l uid (id -u $USER)


    # Show a yellow radioactive symbol for root privileges
    if [ $uid -eq 0 ]
        echo -n -s $bg_yellow $black " $__oceanfish_glyph_radioactive " $normal
    end


    # Display virtualenv name if in a virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s $bg_cyan $black " " (basename "$VIRTUAL_ENV") " " $normal
    end


    # Show a nice anchor (turns red if previous command failed)
    if test $last_status -ne 0
        echo -n -s $bg_red $white " $__oceanfish_glyph_anchor "  $normal
    else
        echo -n -s $bg_blue $white " $__oceanfish_glyph_anchor " $normal
    end

    if [ "$theme_display_user" = "yes" ]
        if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
            echo -n -s $bg_white $cyan " " (whoami) "@" (hostname -s) " " $normal
        end
    end

    # Display current path
    echo -n -s $bg_cyan " $cwd " $normal


    # Show git branch and dirty state
    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)
        if [ (_is_git_dirty) ]
            echo -n -s $bg_white $magenta " $git_branch " $red "$__oceanfish_glyph_flag " $normal
        else
            echo -n -s $bg_white $magenta " $git_branch " $normal
        end
    end


    # Terminate with a space
    echo -n -s ' ' $normal
end
