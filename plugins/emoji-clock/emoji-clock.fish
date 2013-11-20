# ------------------------------------------------------------------------------
#          FILE: emoji-clock.plugin.zsh
#   DESCRIPTION: The current time with half hour accuracy as an emoji symbol.
#                Inspired by Andre Torrez' "Put A Burger In Your Shell"
#                http://notes.torrez.org/2013/04/put-a-burger-in-your-shell.html
#        AUTHOR: Alexis Hildebrandt (afh[at]surryhill.net) ported to fish by Erik Kallen
#       VERSION: 1.0.0
# -----------------------------------------------------------------------------

function emoji-clock
  set hour (date '+%I')
  set minutes (date '+%M')
  switch $hour
    case 01
    if test $minutes -ge 30
      set clock "🕜"
    else
      set clock "🕐"
    end
    case 02
    if test $minutes -ge 30
      set clock "🕝"
    else
      set clock "🕑"
    end
    case 03
    if test $minutes -ge 30
      set clock "🕞"
    else
      set clock "🕒"
    end
    case 04
    if test $minutes -ge 30
      set clock "🕟"
    else
      set clock "🕓"
    end
    case 05
    if test $minutes -ge 30
      set clock "🕠"
    else
      set clock "🕔"
    end
    case 06
    if test $minutes -ge 30
      set clock "🕡"
    else
      set clock "🕕"
    end
    case 07
    if test $minutes -ge 30
      set clock "🕢"
    else
      set clock "🕖"
    end
    case 08
    if test $minutes -ge 30
      set clock "🕣"
    else
      set clock "🕗"
    end
    case 09
    if test $minutes -ge 30
      set clock "🕤"
    else
      set clock "🕘"
    end
    case 10
    if test $minutes -ge 30
      set clock "🕥"
    else
      set clock "🕙"
    end
    case 11
    if test $minutes -ge 30
      set clock "🕦"
    else
      set clock "🕚"
    end
    case 12
    if test $minutes -ge 30
      set clock "🕧"
    else
      set clock "🕛"
    end
    case '*' set clock "⌛"
  end
  echo $clock
end
