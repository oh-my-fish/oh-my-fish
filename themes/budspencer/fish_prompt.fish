###############################################################################
#
# Prompt theme name:
#   budspencer
#
# Description:
#   a sophisticated airline/powerline theme
#
# Author:
#   Joseph Tannhuber <sepp.tannhuber@yahoo.de>
#
# Sections:
#   -> Color definitions
#   -> Key bindings
#   -> Files
#   -> Functions
#     -> Directory history
#     -> Command history
#     -> Bookmarks
#     -> Commandline editing with $EDITOR
#     -> Git segment
#     -> Bind-mode segment
#     -> Symbols segment
#   -> Prompt initialization
#   -> Left prompt
#     -> Segments
#
###############################################################################

###############################################################################
# => Color definitions
###############################################################################

# Define colors
# Values are: black dark_gray light_gray white yellow orange red magenta violet blue cyan green
set -g budspencer_colors 000000 083743 445659 fdf6e3 b58900 cb4b16 dc121f af005f 6c71c4 268bd2 2aa198 859900

# Cursor color changes according to vi-mode
# Define values for: normal_mode insert_mode visual_mode
set -g budspencer_cursors "\033]12;#$budspencer_colors[10]\007" "\033]12;#$budspencer_colors[5]\007" "\033]12;#$budspencer_colors[8]\007"

# Some terminals cannot change the cursor color
set -l unsupported_terminals "fbterm" "st" "linux" "screen"
if contains $TERM $unsupported_terminals
	set -e budspencer_cursors
end

###############################################################################
# => Key bindings
###############################################################################

if test "$fish_key_bindings" = "fish_vi_key_bindings"
	bind '#' fish_symbols_toggle_cm
	bind -M visual '#' fish_symbols_toggle_cm
	bind ' ' fish_pwd_toggle_cm
	bind -M visual ' ' fish_pwd_toggle_cm
	bind L fish_cd_next
	bind H fish_cd_prev
	bind m mark
	bind M unmark
	bind . edit-commandline
end

###############################################################################
# => Files
###############################################################################

# Config file
set -g budspencer_config $HOME/.config/fish/budspencer_config.fish

# Temporary file
set -g budspencer_tmpfile "/tmp/"(echo %self)".fish"

###############################################################################
# => Functions
###############################################################################

######################
# => Directory history
######################
function create_dir_hist -v PWD -d "Create directory history without duplicates"
	if test $hist_lock = "false"
		if contains $PWD $dir_hist
			set -e dir_hist[(contains -i $PWD $dir_hist)]
		end
		set dir_hist $dir_hist "$PWD"
		set -g dir_hist_val (count $dir_hist)
	end
end

function fish_cd_prev -d "Change to previous directory, press H in NORMAL mode."
	if test $dir_hist_val -gt 1
		set dir_hist_val (math $dir_hist_val-1)
		set hist_lock "true"
		cd $dir_hist[$dir_hist_val]
		commandline -f repaint
	end
end

function fish_cd_next -d "Change to next directory, press L in NORMAL mode."
	if test $dir_hist_val -lt (math (count $dir_hist))
		set dir_hist_val (math $dir_hist_val+1)
		set hist_lock "true"
		cd $dir_hist[$dir_hist_val]
		commandline -f repaint
	end
end

function d -d "List directory history, jump to directory in list with d <number>"
	set hist_lock "true"
	set -l num_items (math (count $dir_hist)-1)
	if test $num_items -eq 0
		echo (set_color $fish_color_error)"Directory history is empty."
		return
	end
	if test $argv[1] -ge 0 -a $argv[1] -lt $num_items ^ /dev/null
		cd $dir_hist[(math $num_items-$argv[1])]
	else
		for i in (seq $num_items)
			if test (math \($num_items-$i\)%2) -eq 0
				set_color normal
			else
				set_color $budspencer_colors[4]
			end
			echo (math $num_items-$i)\t$dir_hist[$i]  | sed "s|$HOME|~|"
		end
		if test $num_items -eq 1
			set last_item ""
		else
			set last_item "-"(math $num_items-1)
		end
		set input_length (expr length (math $num_items-1))
		read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[5])" ♻ Goto [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[5])' -n $input_length -l dir_num
		if begin
			test -n $dir_num
			and contains $dir_num (seq 0 (math $num_items-1))
		end
    		cd $dir_hist[(math $num_items-$dir_num)]
	end
end
end

####################
# => Command history
####################
function create_cmd_hist -e fish_prompt -d "Create command history without duplicates"
	if test $hist_lock = "false"
        set -l cmd $history[1]
		if not begin
			expr $cmd : 'cd ' > /dev/null
			or expr $cmd : '[cdm] ' > /dev/null
			or test $cmd = 'cd' -o $cmd = 'c' -o $cmd = 'd' -o $cmd = 'm'
		end
    		if contains $cmd $cmd_hist
    			set -e cmd_hist[(contains -i $cmd $cmd_hist)]
	    	end
	    	set cmd_hist $cmd_hist $cmd
    	end
    end
end

function c -d "List command history, execute command in list with c <number>"
	set hist_lock "true"
	set -l num_items (count $cmd_hist)
	if test $num_items -eq 0
		echo (set_color $fish_color_error)"Command history is empty."
		return
	end
	if test $argv[1] -lt $num_items ^ /dev/null
		commandline $cmd_hist[(math $num_items-$argv[1])]
		echo $cmd_hist[(math $num_items-$argv[1])]  | xsel
	else
		for i in (seq $num_items)
			if test (math \($num_items-$i\)%2) -eq 0
				set_color normal
			else
				set_color $budspencer_colors[4]
			end
			echo -n (math $num_items-$i)
			set -l item (echo $cmd_hist[$i] | fish_indent | expand -t 4)
			echo -n \t$item\n
		end
		if test $num_items -eq 1
			set last_item ""
		else
			set last_item "-"(math $num_items-1)
		end
		set input_length (expr length (math $num_items-1))
		read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[8])" ↩ Exec [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[8])' -n $input_length -l cmd_num
		if begin
			test -n $cmd_num
			and contains $cmd_num (seq 0 (math $num_items-1))
		end
    		commandline $cmd_hist[(math $num_items-$cmd_num)]
    		echo $cmd_hist[(math $num_items-$cmd_num)] | xsel
    	end
    	set fish_bind_mode default
    end
	set hist_lock "false"
end

##############
# => Bookmarks
##############
function mark -d "Create bookmark for present working directory."
	if not contains $PWD $bookmarks
		set -U bookmarks $PWD $bookmarks
		sed -i '/^set -U bookmarks/d' $budspencer_config ^ /dev/null
		echo "set -U bookmarks $bookmarks" >> $budspencer_config
		set hist_lock "true"
		commandline -f repaint
	end
end

function unmark -d "Remove bookmark for present working directory."
	if contains $PWD $bookmarks
		set -e bookmarks[(contains -i $PWD $bookmarks)]
		sed -i '/^set -U bookmarks/d' $budspencer_config ^ /dev/null
		echo "set -U bookmarks $bookmarks" >>  $budspencer_config
		set hist_lock "true"
		commandline -f repaint
	end
end

function m -d "List bookmarks, jump to directory in list with m <number>"
	set hist_lock "true"
	set -l num_items (count $bookmarks)
	if test $num_items -eq 0
		echo (set_color $fish_color_error)"Bookmark list is empty."
		return
	end
	if test $argv[1] -ge 0 -a $argv[1] -lt $num_items ^ /dev/null
		cd $bookmarks[(math $num_items-$argv[1])]
	else
		for i in (seq $num_items)
			if test (math \($num_items-$i\)%2) -eq 0
				set_color normal
			else
				set_color $budspencer_colors[4]
			end
			echo (math $num_items-$i)\t$bookmarks[$i]  | sed "s|$HOME|~|"
		end
		if test $num_items -eq 1
			set last_item ""
		else
			set last_item "-"(math $num_items-1)
		end
		echo -en $budspencer_cursors[1]
		set input_length (expr length $num_items)
		read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[10])" ⌘ Goto [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[10])' -n $input_length -l dir_num

		if begin
			test -n $dir_num
			and contains $dir_num (seq 0 (math $num_items-1))
		end
    		cd $bookmarks[(math $num_items-$dir_num)]
    	end
    end
end

#####################################
# => Commandline editing with $EDITOR
#####################################
function edit-commandline -d "Opens current commandline with your $EDITOR"
	commandline >  $budspencer_tmpfile
	eval $EDITOR $budspencer_tmpfile
	if test -s $budspencer_tmpfile
		set hist_lock "true"
		commandline (sed 's|^\s*||' $budspencer_tmpfile)
	else
		set hist_lock "true"
		commandline ""
	end
	rm $budspencer_tmpfile
end

################
# => Git segment
################
function __budspencer_prompt_git_branch -d "Return the current branch name"
	set -l branch (command git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
	if test (count $branch) -eq 0
		set -l position (command git describe --contains --all HEAD ^ /dev/null)
		if test (count $position) -eq 0
			set -l commit (command git rev-parse HEAD ^ /dev/null | sed  's|\(^.......\).*|\1|')
			echo -n (set_color -b $budspencer_colors[11])""(set_color $budspencer_colors[1])" ➦ "$commit" "(set_color $budspencer_colors[11])
		else
			echo -n (set_color -b $budspencer_colors[9])""(set_color $budspencer_colors[1])"  "$position" "(set_color $budspencer_colors[9])
		end
	else
		echo -n (set_color -b $budspencer_colors[3])""(set_color $budspencer_colors[1])"  "$branch" "(set_color $budspencer_colors[3])
	end
end

######################
# => Bind-mode segment
######################
function __budspencer_prompt_bindmode -d "Displays the current mode"
	switch $fish_bind_mode
	case default
		set_color -b $budspencer_colors[10] $budspencer_colors[1]
		echo -en $budspencer_cursors[1]
		if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "fish_user_key_bindings"
			echo -n " NORMAL "
		else
			echo -n " EMACS "
		end
		set_color -b $budspencer_colors[1] $budspencer_colors[10]
	case insert
		set_color -b $budspencer_colors[5] $budspencer_colors[1]
		echo -en $budspencer_cursors[2]
		echo -n " INSERT "
		set_color -b $budspencer_colors[1] $budspencer_colors[5]
		if test $hist_lock = "true"
			set hist_lock "false"
			create_dir_hist
		end
	case visual
		set_color -b $budspencer_colors[8] $budspencer_colors[1]
		echo -en $budspencer_cursors[3]
		echo -n " VISUAL "
		set_color -b $budspencer_colors[1] $budspencer_colors[8]
	end
end

####################
# => Symbols segment
####################
function __budspencer_prompt_left_symbols -d "Display symbols"
	set_color -b $budspencer_colors[2]
	echo -n ""

	# Bookmark indicator
	if contains $PWD $bookmarks
		if test $symbols_style = "symbols"
			set_color -o $budspencer_colors[10]
			echo -n " ⌘"
		else
			set_color $budspencer_colors[10]
			echo -n " "(math (count $bookmarks)-(contains -i $PWD $bookmarks))
		end
	end

	# Indicator for vim parent process
	if set -q -x VIM
		set_color -o $budspencer_colors[9]
		echo -n " V"
	end

	# Indicator for ranger parent process
	if set -q -x RANGER_LEVEL
		set_color -o $budspencer_colors[9]
		echo -n " R"
	end

	# Background job indicator
	set jobs (jobs | wc -l)
	if [ $jobs -gt 0 ]
		if test $symbols_style = "symbols"
			set_color -o $budspencer_colors[11]
			echo -n " ⚙"
		else
			set_color normal
			set_color -b $budspencer_colors[2] $budspencer_colors[11]
			echo -n " "$jobs
		end
	end

	# Write protection indicator
	if [ ! -w . ]
		set_color -o $budspencer_colors[6]
		echo -n " "
	end

	# Status indicator
	if [ $last_status -eq 0 ]
		if test $symbols_style = "symbols"
			set_color -o $budspencer_colors[12]
			echo -n " ✔"
		else
			set_color normal
			set_color -b $budspencer_colors[2] $budspencer_colors[12]
			echo -n " "$last_status
		end
	else
		if test $symbols_style = "symbols"
			set_color -o $budspencer_colors[7]
			echo -n " ✘"
		else
			set_color normal
			set_color -b $budspencer_colors[2] $budspencer_colors[7]
			echo -n " "$last_status
		end
	end

	# Superuser indicator
	if [ $USER = "root" ]
		set_color -o $budspencer_colors[6]
		echo -n " ⚡"
	end
	echo -n " "
	set_color -b normal $budspencer_colors[2]
end

###############################################################################
# => Prompt initialization
###############################################################################

# Initialize some global variables
set -g hist_lock false
set -g dir_hist
set -g cmd_hist
set -g CMD_DURATION 0

# Load user defined key bindings
if functions --query fish_user_key_bindings
    fish_user_key_bindings
end

# Set favorite editor
if not set -q EDITOR
    set -g EDITOR vi
end

# Source config file
if test -e $budspencer_config
	source $budspencer_config
end

# Set PWD segment style
if set -q $PWDSTYLE
	set -g PWDSTYLE short long none
end
set pwd_style $PWDSTYLE[1]

# Cd to newest bookmark if this is a login shell
if not begin
	set -q -x LOGIN
	or set -q -x RANGER_LEVEL
	or set -q -x VIM
end ^ /dev/null
    cd $bookmarks[1]
end
set -x LOGIN $USER

###############################################################################
# => Left prompt
###############################################################################

function fish_prompt -d "Write out the left prompt of the budspencer theme"
	set -g last_status $status

	#############
	# => Segments
	#############

	# Vi mode
	set -l ps_vi ""
	set ps_vi (__budspencer_prompt_bindmode)

	# Git
	set -l ps_git ""
	set -l git_branch_name (__budspencer_prompt_git_branch)
	if test -n "$git_branch_name"
		set ps_git $git_branch_name
	end

	# Symbols
	set -l ps_symbols (__budspencer_prompt_left_symbols)

	# Left prompt
	echo -n -s $ps_vi $ps_git $ps_symbols '' ' '
end
