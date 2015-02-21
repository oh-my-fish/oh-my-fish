# NAME
#   ta - to-done manager
#
# SYNOPSIS
#   ta [<task #tag #tag...>]
#      [-u --undo]
#      [-s --search <key[+key...]>]
#      [-r --regex]
#      [-n --number <number>]
#      [-h --help]
#      [--clear]
#      [--version]
#
# USAGE
#   [<task>]
#     Add new completed task. Append a `#' to keywords to apply tags.
#     Simply run ta without arguments to list all completed tasks.
#
#   -s --search <key[,...]>
#     Search tasks tagged by <key>. Use `+' to search tasks with all
#     the specified tags. Use -r and `|' to search for tasks with at
#     least one of the specified tags
#
#     Some tags are automatically created based in the current date:
#
#       Weekdays  mon...sun
#       Month     jan...dec
#       Day       1st, 2nd, 3rd, 4th...31st
#       Time      12am...12pm
#
#   -r --regex {-s<key>}
#     Use <key> as a regular expression.
#
#   -n --number <number>
#     Truncate results to <number>.
#
#   -u --undo
#     Delete most recent task. Using this option locks the ability to undo
#     until a new task is committed. This protects users from engaging in
#     useless housekeeping habits.
#
#   -h --help
#     Show usage help.
#
#   --clear
#     Clear all data. Use with caution.
#
#   --version
#     Show version information.
#
# EXAMPLES
#   Add a task.
#     ta "talked to #mom #family"
#
#   List all `spanish` tasks in July.
#     ta -s spanish+jul
#
#   List all `work` AND `opensource` tasks.
#     ta -s work+opensource
#
#   List all `workout` OR `cardio` OR `gym` tasks.
#     ta -rs workout\|cardio\|gym
#
#   List all `family` AND `friends` tasks. Show 5 most recent.
#     ta --search family+friends -n5
#
# DESCRIPTION
#   In a todo-like system, each task is a promise scheduled to be fullfilled
#   in the future. In practice, promises can be hard to keep and prioritize.
#
#   GTD-like methods offer good strategies to help with this, but they often
#   require breaking die-to-hard habits and can be too complicated for users.
#
#   Information flux is unpredictable, and dividing how this information is
#   collected and processed in often overlapping stages is challenging.
#
#   A to-done approach is not incompatible with traditional todo-lists, but
#   it was created in a world where todo lists are not prominent.
#
#   The premise is as information flow crosses over the singularity threshold
#   data-collection and sorting becomes impossible and unwieldy. The contract
#   is to spend less time prioritizing and concentrate in completing only one
#   task at a time. Only completed tasks can be logged into the system.
#
#   Overall happiness and motivation increase will be directly proportional
#   to the number of completed tasks.
#
# AUTHORS
#   Jorge Bucaran <jbucaran@me.com>
#/
function ta -d "to-done manager"
  set -l flags

  while set opts (getopts ":s:search: n:number: r:regex
                            u:undo h:help clear version" $argv)
    switch $opts[1]
      case s n
        set flags $flags search
        if test $opts[1] = n
          set number $opts[2]
        else
          set search $opts[2]
        end
      case r
        set flags $flags regex
      case u
        set flags undo
      case h
        set flags help
      case clear
        set flags clear
      case version
        set flags version
    end
  end

  if test $status -gt 1
    ta.cli.help
    return $__ta_error_bad_input

  else if contains -- undo $flags
    ta.cli.undo

  else if contains -- search $flags
    # Pipe to less with color, left-width and verbose status bar.
    ta.cli.search "$search" "$number" $flags \
      | less -JM --raw-control-chars

  else if contains -- version $flags
    ta.cli.version

  else if contains -- clear $flags
    ta.cli.clear

  else if test -n "$opts"
    ta.cli.commit "$opts"

  else if contains -- help $flags
    ta.cli.help
  else
    ta --search ""
  end
end
