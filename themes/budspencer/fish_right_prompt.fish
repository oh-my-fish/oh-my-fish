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
#   -> Functions
#     -> Toggle functions
#     -> Command duration segment
#     -> Git segment
#     -> PWD segment
#   -> Prompt
#     -> Segments
#
###############################################################################

###############################################################################
# => Functions
###############################################################################

#####################
# => Toggle functions
#####################
set symbols_style "symbols"
function fish_symbols_toggle_cm -d "Toggles style of symbols, press # in NORMAL or VISUAL mode"
	if test $symbols_style = "symbols"
		set symbols_style "numbers"
	else
		set symbols_style "symbols"
	end
	set hist_lock "true"
	commandline -f repaint
end

function fish_pwd_toggle_cm -d "Toggles style of pwd segment, press space bar in NORMAL or VISUAL mode"
	for i in (seq (count $PWDSTYLE))
		if test $PWDSTYLE[$i] = $pwd_style
			set pwd_style $PWDSTYLE[(math $i%(count $PWDSTYLE)+1)]
			set hist_lock "true"
			commandline -f repaint
			break
		end
	end
end

#############################
# => Command duration segment
#############################
function fish_cmd_duration_cm -d "Displays the elapsed time of last command"
	set -l seconds ""
	set -l minutes ""
	set -l hours ""
	set -l days ""
	set -l cmd_duration (math $CMD_DURATION/1000)
	if test $cmd_duration -gt 0
		set seconds (math $cmd_duration%68400%3600%60)"s"
		if test $cmd_duration -ge 60
			set minutes (math $cmd_duration%68400%3600/60)"m"
			if test $cmd_duration -ge 3600
				set hours (math $cmd_duration%68400/3600)"h"
				if test $cmd_duration -ge 68400
					set days (math $cmd_duration/68400)"d"
				end
			end
		end
		if test $last_status -ne 0
			echo -n (set_color $budspencer_colors[2])""(set_color -b $budspencer_colors[2] $budspencer_colors[7])" "$days$hours$minutes$seconds
		else
			echo -n (set_color $budspencer_colors[2])""(set_color -b $budspencer_colors[2] $budspencer_colors[12])" "$days$hours$minutes$seconds
		end
	end
end

################
# => Git segment
################
function __budspencer_is_git_ahead_or_behind -d "Check if there are unpulled or unpushed commits"
	command git rev-list --count --left-right "HEAD...@{upstream}" ^ /dev/null  | sed 's|\s\+|\n|g'
end

function __budspencer_git_status -d "Check git status"
	set -l git_status (command git status --porcelain ^/dev/null | cut -c 1-2)
	set -l added (echo -sn $git_status\n | egrep -c "[ACDMT][ MT]|[ACMT]D")
	set -l deleted (echo -sn $git_status\n | egrep -c "[ ACMRT]D")
	set -l modified (echo -sn $git_status\n | egrep -c ".[MT]")
	set -l renamed (echo -sn $git_status\n | egrep -c "R.")
	set -l unmerged (echo -sn $git_status\n | egrep -c "AA|DD|U.|.U")
	set -l untracked (echo -sn $git_status\n | egrep -c "\?\?")
	echo -n $added\n$deleted\n$modified\n$renamed\n$unmerged\n$untracked
end

function __budspencer_is_git_stashed -d "Check if there are stashed commits"
	command git stash list ^ /dev/null  | wc -l
end

function __budspencer_prompt_git_symbols -d "Displays the git symbols"
	set -l git_prompt ""
	set -l is_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
	if test $is_repo="true"

		set -l git_ahead_behind (__budspencer_is_git_ahead_or_behind)
		if test (count $git_ahead_behind) -eq 2
			if test $git_ahead_behind[1] -gt 0
				if test $symbols_style = "symbols"
					set git_prompt (set_color -o $budspencer_colors[5])" ↑"
				else
					set git_prompt (set_color $budspencer_colors[5])" "$git_ahead_behind[1]
				end
			end

			if test $git_ahead_behind[2] -gt 0
				if test $symbols_style = "symbols"
					set git_prompt $git_prompt(set_color -o $budspencer_colors[5])" ↓"
				else
					set git_prompt $git_prompt(set_color $budspencer_colors[5])" "$git_ahead_behind[2]
				end
			end
		end

		set -l git_status (__budspencer_git_status)
		if test $git_status[1] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[12])" +"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[12])" "$git_status[1]
			end
		end

		if test $git_status[2] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[7])" –"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[7])" "$git_status[2]
			end
		end

		if test $git_status[3] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[10])" ✱"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[10])" "$git_status[3]
			end
		end

		if test $git_status[4] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[8])" →"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[8])" "$git_status[4]
			end
		end

		if test $git_status[5] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[9])" ═"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[9])" "$git_status[5]
			end
		end

		if test $git_status[6] -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[4])" ●"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[4])" "$git_status[6]
			end
		end

		set -l git_stashed (__budspencer_is_git_stashed)
		if test $git_stashed -gt 0
			if test $symbols_style = "symbols"
				set git_prompt $git_prompt(set_color -o $budspencer_colors[11])" ✭"
			else
				set git_prompt $git_prompt(set_color $budspencer_colors[11])" "$git_stashed
			end
		end
		echo -n $git_prompt

	end
end

################
# => PWD segment
################
function __budspencer_prompt_pwd -d "Displays the present working directory"
	set -l user_host " "
	if test (count $SSH_CLIENT) -gt 0
		if test $symbols_style = "symbols"
			switch $pwd_style
			case short
				set user_host " "$USER"@"(hostname -s)":"
			case long
				set user_host " "$USER"@"(hostname -f)":"
			end
        else
            set user_host " "$USER"@"(hostname -i)":"
		end
	end
	switch $fish_bind_mode
	case default
		set_color $budspencer_colors[10]
		echo -n ""
		set_color normal
		set_color -b $budspencer_colors[10] $budspencer_colors[1]
	case insert
		set_color $budspencer_colors[5]
		echo -n ""
		set_color normal
		set_color -b $budspencer_colors[5] $budspencer_colors[1]
	case visual
		set_color $budspencer_colors[8]
		echo -n ""
		set_color normal
		set_color -b $budspencer_colors[8] $budspencer_colors[1]
	end
	switch $pwd_style
	case short
		echo -n $user_host(prompt_pwd)' '
	case long
		echo -n $user_host$PWD' '
	end
	set_color normal
end

###############################################################################
# => Prompt
###############################################################################

function fish_right_prompt -d "Write out the right prompt of the budspencer theme"

	#############
	# => Segments
	#############

	# Command duration
	set ps_duration (fish_cmd_duration_cm)

	# Git
	set ps_git (__budspencer_prompt_git_symbols)
	if test -n "$ps_git"
		set ps_git (set_color $budspencer_colors[3])""(set_color -b $budspencer_colors[3])""$ps_git(set_color -b $budspencer_colors[3] normal)
	end

	# Pwd
	set -l ps_pwd ""
	set ps_pwd (__budspencer_prompt_pwd)

	# Right prompt
	echo -n $ps_duration $ps_git $ps_pwd
	set_color normal
end
