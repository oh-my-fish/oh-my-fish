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
#     -> Help
#     -> Welcome message
#
###############################################################################

###############################################################################
# => Functions
###############################################################################

#########
# => Help
#########
function budspencer_help -d "Shows helpfile"
	set -l readme_file $fish_path"/themes/budspencer/README.md"
	if set -q PAGER
		if test -e $readme_file
			eval $PAGER $readme_file
		else
			set_color $fish_color_error
			echo $readme_file" wasn't found."
		end
	else
		open $readme_file
	end
end

####################
# => Welcome message
####################
function fish_greeting -d "Show greeting in login shell."
	if begin
		test (count $bookmarks) -gt 0
		and not set -q -x LOGIN
		and not set -q -x RANGER_LEVEL
		and not set -q -x VIM
	end
    	echo This is oh-my-fish\'s (set_color -b 083746 268bd2)budspencer(set_color normal) theme.
    	echo Type (set_color -b 083746 cb4b16)»budspencer_help«(set_color normal) in order to see how you can speed up your workflow.
    	set_color normal
    end
end
