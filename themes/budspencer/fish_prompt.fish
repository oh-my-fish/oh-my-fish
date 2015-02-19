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
#   -> Key bindings
#   -> Files
#   -> Functions
#     -> Pre execute
#     -> Directory history
#     -> Command history
#     -> Bookmarks
#     -> Sessions
#     -> Commandline editing with $EDITOR
#     -> Git segment
#     -> Bind-mode segment
#     -> Symbols segment
#   -> Prompt initialization
#   -> Left prompt
#
###############################################################################

###############################################################################
# => Key bindings
###############################################################################

if [ $fish_key_bindings = 'fish_vi_key_bindings' ]
  bind '#' __budspencer_toggle_symbols
  bind -M visual '#' __budspencer_toggle_symbols
  bind ' ' __budspencer_toggle_pwd
  bind -M visual ' ' __budspencer_toggle_pwd
  bind L __budspencer_cd_next
  bind H __budspencer_cd_prev
  bind m mark
  bind M unmark
  bind . __budspencer_edit_commandline
  bind -M insert \n __budspencer_preexec
  bind \n __budspencer_preexec
end

###############################################################################
# => Files
###############################################################################

# Config file
set -g budspencer_config "$HOME/.config/fish/budspencer_config.fish"

# Temporary files
set -g budspencer_tmpfile '/tmp/'(echo %self)'_budspencer_edit.fish'

###############################################################################
# => Functions
###############################################################################

################
# => Pre execute
################
function __budspencer_preexec -d 'Execute after hitting <Enter> before doing anything else'
  set -l cmd (commandline | sed 's|\s\+|\x1e|g')
  if [ $_ = 'fish' ]
    if [ -z $cmd[1] ]
      set -e cmd[1]
    end
    if [ -z $cmd[1] ]
      return
    end
    set -e budspencer_prompt_error[1]
    if not type -q $cmd[1]
      if [ -d $cmd[1] ]
        set budspencer_prompt_error (cd $cmd[1] ^&1)
        and commandline ''
        commandline -f repaint
        return
      end
    end
    switch $cmd[1]
      case 'c'
        if begin
            [ (count $cmd) -gt 1 ]
            and [ $cmd[2] -gt 0 ]
            and [ $cmd[2] -lt $pcount ]
          end
          commandline $prompt_hist[$cmd[2]]
          echo $prompt_hist[$cmd[2]] | xsel
          commandline -f repaint
          return
        end
      case 'cd'
        if [ (count $cmd) -le 2 ]
          set budspencer_prompt_error (eval $cmd ^&1)
          and commandline ''
          if [ (count $budspencer_prompt_error) -gt 1 ]
            set budspencer_prompt_error $budspencer_prompt_error[1]
          end
          commandline -f repaint
          return
        end
      case 'day' 'night'
        if [ (count $cmd) -eq 1 ]
          eval $cmd
          commandline ''
          commandline -f repaint
          return
        end
    end
  end
  commandline -f execute
end

#####################
# => Fish termination
#####################
function __budspencer_on_termination -s HUP -s INT -s QUIT -s TERM --on-process %self -d 'Execute when shell terminates'
  set -l item (contains -i %self $budspencer_sessions_active_pid ^ /dev/null)
  __budspencer_detach_session $item
end

######################
# => Directory history
######################
function __budspencer_create_dir_hist -v PWD -d 'Create directory history without duplicates'
  if [ "$pwd_hist_lock" = false ]
    if contains $PWD $$dir_hist
      set -e $dir_hist[1][(contains -i $PWD $$dir_hist)]
    end
    set $dir_hist $$dir_hist $PWD
    set -g dir_hist_val (count $$dir_hist)
  end
end

function __budspencer_cd_prev -d 'Change to previous directory, press H in NORMAL mode.'
  if [ $dir_hist_val -gt 1 ]
    set dir_hist_val (expr $dir_hist_val - 1)
    set pwd_hist_lock true
    cd $$dir_hist[1][$dir_hist_val]
    commandline -f repaint
  end
end

function __budspencer_cd_next -d 'Change to next directory, press L in NORMAL mode.'
  if [ $dir_hist_val -lt (count $$dir_hist) ]
    set dir_hist_val (expr $dir_hist_val + 1)
    set pwd_hist_lock true
    cd $$dir_hist[1][$dir_hist_val]
    commandline -f repaint
  end
end

function d -d 'List directory history, jump to directory in list with d <number>'
  set -l num_items (expr (count $$dir_hist) - 1)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Directory history is empty. '(set_color normal)'It will be created automatically'
    return
  end
  for i in (seq $num_items)
    if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
      set_color normal
    else
      set_color $budspencer_colors[4]
    end
    echo '▶' (expr $num_items - $i)\t$$dir_hist[1][$i] | sed "s|$HOME|~|"
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $budspencer_cursors[2]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[5])" ♻ Goto [e|0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[5])' -n $input_length -l dir_num
  switch $dir_num
    case (seq 0 (expr $num_items - 1))
      cd $$dir_hist[1][(expr $num_items - $dir_num)]
    case 'e'
      read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[5])" ♻ Erase [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[5])' -n $input_length -l dir_num
      set -e $dir_hist[1][(expr $num_items - $dir_num)] ^ /dev/null
      set dir_hist_val (count $$dir_hist)
      tput cuu1
  end
  for i in (seq (expr $num_items + 1))
    tput cuu1
  end
  tput ed
  tput cuu1
  set pcount (expr $pcount - 1)
  set no_prompt_hist 'T'
end

####################
# => Command history
####################
function __budspencer_create_cmd_hist -e fish_prompt -d 'Create command history without duplicates'
  if [ $_ = 'fish' ]
    set -l IFS ''
    set -l cmd (echo $history[1] | fish_indent | expand -t 4)
    # Create prompt history
    if begin
        [ $pcount -gt 0 ]
        and [ $no_prompt_hist = 'F' ]
      end
      set prompt_hist[$pcount] $cmd
    else
      set no_prompt_hist 'F'
    end
    set pcount (expr $pcount + 1)
    # Create command history
    if not begin
        expr $cmd : '[cdms] ' > /dev/null
        or contains $cmd $budspencer_nocmdhist
      end
      if contains $cmd $$cmd_hist
        set -e $cmd_hist[1][(contains -i $cmd $$cmd_hist)]
      end
      set $cmd_hist $$cmd_hist $cmd
    end
  end
  set fish_bind_mode insert
  echo -n \a
end

function c -d 'List command history, load command from prompt with c <prompt number>'
  set -l num_items (count $$cmd_hist)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Command history is empty. '(set_color normal)'It will be created automatically.'
    return
  end
  for i in (seq $num_items)
    if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
      set_color normal
    else
      set_color $budspencer_colors[4]
    end
    echo -n '▶ '(expr $num_items - $i)
    set -l item (echo $$cmd_hist[1][$i])
    echo -n \t$item\n
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $budspencer_cursors[4]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[9])" ↩ Exec [e|0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[9])' -n $input_length -l cmd_num
  switch $cmd_num
    case (seq 0 (expr $num_items - 1))
      commandline $$cmd_hist[1][(expr $num_items - $cmd_num)]
      echo $$cmd_hist[1][(expr $num_items - $cmd_num)] | xsel
      for i in (seq (count (echo $$cmd_hist\n)))
        tput cuu1
      end
    case 'e'
      read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[9])" ↩ Erase [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[9])' -n $input_length -l cmd_num
      for i in (seq (count (echo $$cmd_hist\n)))
        tput cuu1
      end
      tput cuu1
      set -e $cmd_hist[1][(expr $num_items - $cmd_num)] ^ /dev/null
  end
  tput ed
  tput cuu1
  set pcount (expr $pcount - 1)
  set no_prompt_hist 'T'
end

##############
# => Bookmarks
##############
function mark -d 'Create bookmark for present working directory.'
  if not contains $PWD $bookmarks
    set -U bookmarks $PWD $bookmarks
    set pwd_hist_lock true
    commandline -f repaint
  end
end

function unmark -d 'Remove bookmark for present working directory.'
  if contains $PWD $bookmarks
    set -e bookmarks[(contains -i $PWD $bookmarks)]
    set pwd_hist_lock true
    commandline -f repaint
  end
end

function m -d 'List bookmarks, jump to directory in list with m <number>'
  set -l num_items (count $bookmarks)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Bookmark list is empty. '(set_color normal)'Enter '(set_color $fish_color_command[1])'mark '(set_color normal)'in INSERT mode or '(set_color $fish_color_command[1])'m '(set_color normal)'in NORMAL mode, if you want to add the current directory to your bookmark list.'
    return
  end
  for i in (seq $num_items)
    if [ $PWD = $bookmarks[$i] ]
      set_color $budspencer_colors[10]
    else
      if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
        set_color normal
      else
        set_color $budspencer_colors[4]
      end
    end
    echo '▶ '(expr $num_items - $i)\t$bookmarks[$i] | sed "s|$HOME|~|"
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $budspencer_cursors[1]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[10])" ⌘ Goto [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[10])' -n $input_length -l dir_num
  switch $dir_num
    case (seq 0 (expr $num_items - 1))
      cd $bookmarks[(expr $num_items - $dir_num)]
  end
  for i in (seq (expr $num_items + 1))
    tput cuu1
  end
  tput ed
  tput cuu1
end

#############
# => Sessions
#############
function __budspencer_delete_zombi_sessions -d 'Delete zombi sessions'
  for i in $budspencer_sessions_active_pid
    if not contains $i %fish
      set -l item (contains -i $i $budspencer_sessions_active_pid)
      set -e budspencer_sessions_active_pid[$item]
      set -e budspencer_sessions_active[$item]
    end
  end
end

function __budspencer_create_new_session -d 'Create a new session'
  set -U budspencer_session_cmd_hist_$argv[1] $$cmd_hist
  set -U budspencer_session_dir_hist_$argv[1] $$dir_hist
  set -U budspencer_sessions $argv[1] $budspencer_sessions
end

function __budspencer_erase_session -d 'Erase current session'
  if [ (count $argv) -eq 1 ]
    set_color $fish_color_error[1]
    echo 'Missing argument: name of session to erase'
    return
  end
  if contains $argv[2] $budspencer_sessions_active
    set_color $fish_color_error[1]
    echo "Session '$argv[2]' cannot be erased because it's currently active."
    return
  end
  if contains $argv[2] $budspencer_sessions
    set -e budspencer_session_cmd_hist_$argv[2]
    set -e budspencer_session_dir_hist_$argv[2]
    set -e budspencer_sessions[(contains -i $argv[2] $budspencer_sessions)]
  else
    set_color $fish_color_error[1]
    echo "Session '$argv[2]' not found. "(set_color normal)'Enter '(set_color $fish_color_command[1])'s '(set_color normal)'to show a list of all recorded sessions.'
  end
end

function __budspencer_detach_session -d 'Detach current session'
  set cmd_hist cmd_hist_nosession
  set dir_hist dir_hist_nosession
  if [ -z $$dir_hist ] ^ /dev/null
    set $dir_hist $PWD
  end
  set dir_hist_val (count $$dir_hist)
  set -e budspencer_sessions_active_pid[$argv] ^ /dev/null
  set -e budspencer_sessions_active[$argv] ^ /dev/null
  set budspencer_session_current ''
  cd $$dir_hist[1][$dir_hist_val]
  set no_prompt_hist 'T'
end

function __budspencer_attach_session -d 'Attach session'
  set argv (echo -sn $argv\n | sed 's|[^[:alnum:]]|_|g')
  if contains $argv[1] $budspencer_sessions_active
    wmctrl -a "✻ $argv[1]"
  else
    wt "✻ $argv[1]"
    __budspencer_detach_session $argv[-1]
    set budspencer_sessions_active $budspencer_sessions_active $argv[1]
    set budspencer_sessions_active_pid $budspencer_sessions_active_pid %self
    set budspencer_session_current $argv[1]
    if not contains $argv[1] $budspencer_sessions
      __budspencer_create_new_session $argv[1]
    end
    set cmd_hist budspencer_session_cmd_hist_$argv[1]
    set dir_hist budspencer_session_dir_hist_$argv[1]
    if [ -z $$dir_hist ] ^ /dev/null
      set $dir_hist $PWD
    end
    set dir_hist_val (count $$dir_hist)
    cd $$dir_hist[1][$dir_hist_val] ^ /dev/null
  end
  set no_prompt_hist 'T'
end

function s -d 'Create, delete or attach session'
  __budspencer_delete_zombi_sessions
  if [ (count $argv) -eq 0 ]
    set -l active_indicator
    set -l num_items (count $budspencer_sessions)
    if [ $num_items -eq 0 ]
      set_color $fish_color_error[1]
      echo -n 'Session list is empty. '
      set_color normal
      echo -n 'Enter '
      set_color $fish_color_command[1]
      echo -n 's '
      set_color $fish_color_param[1]
      echo -n 'session-name'
      set_color normal
      echo ' to record the current session.'
      return
    end
    for i in (seq $num_items)
      if [ $budspencer_sessions[$i] = $budspencer_session_current ]
        set_color $budspencer_colors[8]
      else
        if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
          set_color normal
        else
          set_color $budspencer_colors[4]
        end
      end
      if contains $budspencer_sessions[$i] $budspencer_sessions_active
        set active_indicator '✻ '
      else
        set active_indicator ' '
      end
      echo '▶ '(expr $num_items - $i)\t$active_indicator$budspencer_sessions[$i]
    end
    if [ $num_items -eq 1 ]
      set last_item ''
    else
      set last_item '-'(expr $num_items - 1)
    end
    echo -en $budspencer_cursors[3]
    set input_length (expr length (expr $num_items - 1))
    read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[8])" ✻ Attach [e|0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[8])' -n $input_length -l session_num
    set pcount (expr $pcount - 1)
    switch $session_num
      case (seq 0 (expr $num_items - 1))
        set argv[1] $budspencer_sessions[(expr $num_items - $session_num)]
        for i in (seq (expr $num_items + 1))
          tput cuu1
        end
        tput ed
        tput cuu1
      case 'e'
        read -p 'echo -n (set_color -b $budspencer_colors[2] $budspencer_colors[8])" ✻ Erase [0"$last_item"] "(set_color -b normal $budspencer_colors[2])" "(set_color $budspencer_colors[8])' -n $input_length -l session_num
        if [ (expr $num_items - $session_num) -gt 0 ]
          __budspencer_erase_session -e $budspencer_sessions[(expr $num_items - $session_num)]
        end
        for i in (seq (expr $num_items + 3))
          tput cuu1
        end
        tput ed
        return
      case '*'
        for i in (seq (expr $num_items + 1))
          tput cuu1
        end
        tput ed
        tput cuu1
        return
    end
  end
  set -l item (contains -i %self $budspencer_sessions_active_pid ^ /dev/null)
  switch $argv[1]
    case '-e'
      __budspencer_erase_session $argv
    case '-d'
      wt 'fish'
      __budspencer_detach_session $item
      tput cuu1
      tput ed
      set pcount (expr $pcount - 1)
    case '-*'
      set_color $fish_color_error[1]
      echo "Invalid argument: $argv[1]"
    case '*'
      __budspencer_attach_session $argv $item
  end
end

#####################################
# => Commandline editing with $EDITOR
#####################################
function __budspencer_edit_commandline -d 'Open current commandline with your editor'
  commandline > $budspencer_tmpfile
  eval $EDITOR $budspencer_tmpfile
  if [ -s $budspencer_tmpfile ]
    commandline (sed 's|^\s*||' $budspencer_tmpfile)
  else
    commandline ''
  end
  rm $budspencer_tmpfile
end

################
# => Git segment
################
function __budspencer_prompt_git_branch -d 'Return the current branch name'
  set -l branch (command git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
  if not test $branch > /dev/null
    set -l position (command git describe --contains --all HEAD ^ /dev/null)
    if not test $position > /dev/null
      set -l commit (command git rev-parse HEAD ^ /dev/null | sed 's|\(^.......\).*|\1|')
      echo -n (set_color -b $budspencer_colors[11])''(set_color $budspencer_colors[1])' ➦ '$commit' '(set_color $budspencer_colors[11])
    else
      echo -n (set_color -b $budspencer_colors[9])''(set_color $budspencer_colors[1])'  '$position' '(set_color $budspencer_colors[9])
    end
  else
    echo -n (set_color -b $budspencer_colors[3])''(set_color $budspencer_colors[1])'  '$branch' '(set_color $budspencer_colors[3])
  end
end

######################
# => Bind-mode segment
######################
function __budspencer_prompt_bindmode -d 'Displays the current mode'
  switch $fish_bind_mode
    case default
      set budspencer_current_bindmode_color $budspencer_colors[10]
      echo -en $budspencer_cursors[1]
    case insert
      set budspencer_current_bindmode_color $budspencer_colors[5]
      echo -en $budspencer_cursors[2]
      if [ "$pwd_hist_lock" = true ]
        set pwd_hist_lock false
        __budspencer_create_dir_hist
      end
    case visual
      set budspencer_current_bindmode_color $budspencer_colors[8]
      echo -en $budspencer_cursors[3]
  end
  if [ (count $budspencer_prompt_error) -eq 1 ]
    set budspencer_current_bindmode_color $budspencer_colors[7]
  end
  set_color -b $budspencer_current_bindmode_color $budspencer_colors[1]
  echo -n " $pcount "
  set_color -b $budspencer_colors[1] $budspencer_current_bindmode_color
end

####################
# => Symbols segment
####################
function __budspencer_prompt_left_symbols -d 'Display symbols'
  set -l jobs (jobs | wc -l)
  if [ -e ~/.taskrc ]
    set todo (task due.before:sunday ^ /dev/null | tail -1 | cut -f1 -d' ')
    set overdue (task due.before:today ^ /dev/null | tail -1 | cut -f1 -d' ')
  end
  if [ -e ~/.reminders ]
    set appointments (rem -a | cut -f1 -d' ')
  end
  if [ (count $todo) -eq 0 ]
    set todo 0
  end
  if [ (count $overdue) -eq 0 ]
    set overdue 0
  end
  if [ (count $appointments) -eq 0 ]
    set appointments 0
  end
  set_color -b $budspencer_colors[2]
  echo -n ''

  if [ $symbols_style = 'symbols' ]
    if [ $budspencer_session_current != '' ]
      set_color -o $budspencer_colors[8]
      echo -n ' ✻'
    end
    if contains $PWD $bookmarks
      set_color -o $budspencer_colors[10]
      echo -n ' ⌘'
    end
    if set -q -x VIM
      set_color -o $budspencer_colors[9]
      echo -n ' V'
    end
    if set -q -x RANGER_LEVEL
      set_color -o $budspencer_colors[9]
      echo -n ' R'
    end
    if [ $jobs -gt 0 ]
      set_color -o $budspencer_colors[11]
      echo -n ' ⚙'
    end
    if [ ! -w . ]
      set_color -o $budspencer_colors[6]
      echo -n ' '
    end
    if [ $todo -gt 0 ]
      set_color -o $budspencer_colors[4]
    end
    if [ $overdue -gt 0 ]
      set_color -o $budspencer_colors[8]
    end
    if [ (expr $todo + $overdue) -gt 0 ]
      echo -n ' ⚔'
    end
    if [ $appointments -gt 0 ]
      set_color -o $budspencer_colors[5]
      echo -n ' ⚑'
    end
    if [ $last_status -eq 0 ]
      set_color -o $budspencer_colors[12]
      echo -n ' ✔'
    else
      set_color -o $budspencer_colors[7]
      echo -n ' ✘'
    end
    if [ $USER = 'root' ]
      set_color -o $budspencer_colors[6]
      echo -n ' ⚡'
    end
  else
    if [ $budspencer_session_current != '' ] ^ /dev/null
      set_color $budspencer_colors[8]
      echo -n ' '(expr (count $budspencer_sessions) - (contains -i $budspencer_session_current $budspencer_sessions))
    end
    if contains $PWD $bookmarks
      set_color $budspencer_colors[10]
      echo -n ' '(expr (count $bookmarks) - (contains -i $PWD $bookmarks))
    end
    if set -q -x VIM
      set_color -o $budspencer_colors[9]
      echo -n ' V'
      set_color normal
    end
    if set -q -x RANGER_LEVEL
      set_color -b $budspencer_colors[2] $budspencer_colors[9]
      echo -n ' '$RANGER_LEVEL
    end
    if [ $jobs -gt 0 ]
      set_color -b $budspencer_colors[2] $budspencer_colors[11]
      echo -n ' '$jobs
    end
    if [ ! -w . ]
      set_color -o $budspencer_colors[6]
      echo -n ' '
      set_color normal
    end
    if [ $todo -gt 0 ]
      set_color -b $budspencer_colors[2] $budspencer_colors[4]
    end
    if [ $overdue -gt 0 ]
      set_color -b $budspencer_colors[2] $budspencer_colors[8]
    end
    if [ (expr $todo + $overdue) -gt 0 ]
      echo -n " $todo"
    end
    if [ $appointments -gt 0 ]
      set_color -b $budspencer_colors[2] $budspencer_colors[5]
      echo -n " $appointments"
    end
    if [ $last_status -eq 0 ]
      set_color -b $budspencer_colors[2] $budspencer_colors[12]
      echo -n ' '$last_status
    else
      set_color -b $budspencer_colors[2] $budspencer_colors[7]
      echo -n ' '$last_status
    end
    if [ $USER = 'root' ]
      set_color -o $budspencer_colors[6]
      echo -n ' ⚡'
    end
  end
  echo -n ' '
  set_color -b normal $budspencer_colors[2]
end

###############################################################################
# => Prompt initialization
###############################################################################

# Initialize some global variables
set -g budspencer_prompt_error
set -g budspencer_current_bindmode_color
set -U budspencer_sessions_active $budspencer_sessions_active
set -U budspencer_sessions_active_pid $budspencer_sessions_active_pid
set -g budspencer_session_current ''
set -g cmd_hist_nosession
set -g cmd_hist cmd_hist_nosession
set -g CMD_DURATION 0
set -g dir_hist_nosession
set -g dir_hist dir_hist_nosession
set -g pwd_hist_lock false
set -g pcount 1
set -g prompt_hist
set -g no_prompt_hist 'F'
set -g symbols_style 'symbols'

# Load user defined key bindings
if functions --query fish_user_key_bindings
  fish_user_key_bindings
end

# Set favorite editor
if not set -q EDITOR
  set -g EDITOR vi
end

# Source config file
if [ -e $budspencer_config ]
  source $budspencer_config
end

# Don't save in command history
if not set -q budspencer_nocmdhist
  set -U budspencer_nocmdhist 'c' 'd' 'll' 'ls' 'm' 's'
end

# Set PWD segment style
if not set -q budspencer_pwdstyle
  set -U budspencer_pwdstyle short long none
end
set pwd_style $budspencer_pwdstyle[1]

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

function fish_prompt -d 'Write out the left prompt of the budspencer theme'
  set -g last_status $status
  echo -n -s (__budspencer_prompt_bindmode) (__budspencer_prompt_git_branch) (__budspencer_prompt_left_symbols) '' ' '
end
