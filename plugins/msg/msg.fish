#    __ _  ___ ___ _
#   /  ' \(_-</ _ `/
#  /_/_/_/___/\_, /
#            /___/ v0.1.0
# NAME
#      msg - technicolor message printer
#
# SYNOPSIS
#      msg [-sn] [@<fg:bg> | style]<text>[style]
#
# OPTIONS
#      -s
#          Do not separate arguments with spaces.
#      -n
#          Do not output a newline at the end of the message.
#
# STYLES
#      _text_                 Bold
#      __text__               Underline
#      ___text___             Bold and Underline
#      `$variable`            Apply @<styles> to $variables
#      /directory/            Directories
#      [url]                  Links
#      \n                     Line Break
#      \t                     Tab Space
#
#      @<fg:bg> fg=bg=RGB|RRGGBB|name|random
#        RGB value can be any three to six hex digit or color name.
#        e.g, @0fb, @tomato, @random, @error, @ok.
#
# AUTHORS
#      @bucaran (Jorge Bucaran)
#
# v. 0.1.0
#/

# Global `msg` default color and styles.
set --global msg_color_fg   FFFFFF
set --global msg_color_bg   normal
set --global msg_style_url  00FF00 $msg_color_bg -u
set --global msg_style_dir  FFA500 $msg_color_bg -u
set --global msg_color_err  FF0000
set --global msg_color_ok   00FA9A

# Set style, fg/bg colors and reset. Modifies its parent scope of `msg`.
# @params [<fg>] [<bg>] [<style>]
function --no-scope-shadowing msg.util.set.color
  if [ (count $argv) -gt 0 ]
    set fg $argv[1]
  end

  if [ (count $argv) -gt 1 ]
    set bg $argv[2]
  end

  set_color -b $bg
  set_color    $fg

  if [ (count $argv) -gt 2 ]
    set_color $argv[3]
  end

  set bg $msg_color_bg
  set fg $msg_color_fg
end

function msg -d "Technicolor printer."
  # Default " " whitespace between strings, skip with -s.
  set -l ws " "
  # Default \n newline after message, skip with -n.
  set -l ln \n

  switch (count $argv)
    # No hard feelings, but don't print nothing.
    case 0
      return 0
    case \*
      switch $argv[1]
        # Options must appear joined and without spaces: -sn or -ns
        case -s\* -n\*
          # To use options at least a second parameter will be required.
          if [ (count $argv) -gt 1 ]
            # Use -s to not add spaces between words.
            if msg.util.str.has "s" $argv[1]
              set ws ""
            end
            # Use -n to not add a newline at the end of the message.
            if msg.util.str.has "n" $argv[1]
              set ln ""
            end
            # We are done with options, get rid of first item.
            set argv $argv[2..-1]
          else
            return 0
          end
      end
  end

  # Print flow is get next style token, set style, get anything else, print
  # and use the reset. set_color normal makes sure to reset both colors and
  # bold / underline styles.
  set -l reset (set_color normal)(set_color $msg_color_fg)

  # Foreground and background color carried from previous @style token.
  # These variables are set and reset via msg.util.set.color
  set -l fg $msg_color_fg
  set -l bg $msg_color_bg

  for token in $argv
    switch $token
      # Parse style tokens:
      # _txt_, __txt__, ___txt___, @color `$var`, /dir/, [url]
      case ___\*___\* __\*__\* _\*_\* \[\*\]\* \/\*\/\* `\*`\*
        set -l left   _ # Begin of style
        set -l right  _ # End of style
        set -l color $fg $bg -o
        switch $token
          case ___\*___\* __\*__\* _\*_\*
            if msg.util.str.has __ $token
              set color[3] -u
              set left __
              if msg.util.str.has ___ $token
                set color[3] -uo
                set left ___
              end
            end
          case \[\*\]\*
            set color $msg_style_url
            set left  [ ]
            set right ]
          case \/\*\/\*
            set color $msg_style_dir
            set left \/
            set right \/
          case `\*`\*
            set color $fg $bg
            set left  `
            set right `
        end

        # Extract text between left and right separators.
        echo -n (msg.util.set.color $color)(msg.util.str.grab $left $token)$reset

        # Extract string after separator from the right.
        echo -n (printf $token | sed "s/^.*\\$right\(.*\)/\1/")$ws

      # Parse @fg:bg style tokens.
      case @\*
        set fg (printf $token | cut -c 2-)  # @fg[:bg] → fg[:bg]
        set bg (printf $fg | cut -d: -f 2)  # fg:bg    → fg|bg
        set fg (printf $fg | cut -d: -f 1)  # fg:bg    → fg

        # Do not let bg=fg have the same color unless the user wants to.
        if [ $bg = $fg ]
          if not msg.util.str.has : $token
            set bg $msg_color_bg
          end
        end

        # Make color string into valid RRGGBB hex format code.
        set fg (msg.util.get.color $fg)
        set bg (msg.util.get.color $bg)

      # Everything else, print tokens, whitespace, etc.
      case \*
        set -l blank $ws
        switch $token
          # Do not print whitespace after the following characters.
          case $argv[-1] \n\* \t\* \r
            set blank ""
        end
        switch $token
          case \\\[\* \\\/\* \\\_\* # Escape \\[text] and \\/text/
            set token (printf $token | sed "s/^\\\//")
        end
        echo -en (msg.util.set.color)$token$reset$blank
    end
  end
  echo -en $ln
end

# True if substring exists in string.
# @params <substring> <string>
function msg.util.str.has
  printf $argv[2] | grep -q $argv[1]
end

# Extract string between left and right separators of variable length.
# @params <left-sep> [<right-sep>] <string>
function msg.util.str.grab
  set -l left   $argv[1]
  set -l right  $argv[1]
  set -l string $argv[2]

  if [ (count $argv) -gt 2 ]
    set right $argv[2]
    set string $argv[3]
  end

  set -l len (printf $left | awk '{print length}')
  # Match between outermost left / right separators.
  printf $string | sed "s/[^\\$left]*\(\\$left.*\\$right\)*/\1/g" | \
                   sed "s/^.\{$len\}\(.*\).\{$len\}\$/\1/"
end

# Print a random RRGGBB hexadecimal color from three min~max random beams
# where min = 0 and max = 255. Higher values produce lighter colors.
# @params [<min>][<max>]
function msg.util.random.color
  set -l min 0
  if [ (count $argv) -gt 0 ]
    set min $argv[1]
  end

  set -l max 255
  if [ (count $argv) -gt 1 ]
    set max $argv[2]
  end

  set beam "math (random)%\($max-$min+1\)+$min"
  printf "%02x%02x%02x" (eval $beam) (eval $beam) (eval $beam)
end

# Translate color names to valid RRGGBB hexadecimal value.
# @params <color|random>
function msg.util.get.color
  [ (count $argv) -lt 1 ]
    and printf $msg_color_fg
  switch $argv[1]
    case success ok
      printf "%s\n" $msg_color_ok
    case error
      printf "%s\n" $msg_color_err
    case random
      msg.util.random.color
    case light
      # Higher values produce lighter colors.
      msg.util.random.color 100
    case dark
      # Lower values produce darker colors.
      msg.util.random.color 0 75
   	case maroon
      printf 800000
   	case d\*red
      printf 8B0000
   	case brown
      printf A52A2A
   	case firebrick
      printf B22222
   	case crimson
      printf DC143C
   	case red
      printf FF0000
   	case tomato
      printf FF6347
   	case coral
      printf FF7F50
   	case indianred
      printf CD5C5C
   	case l\*coral
      printf F08080
   	case d\*salmon
      printf E9967A
   	case salmon
      printf FA8072
   	case l\*salmon
      printf FFA07A
   	case orangered
      printf FF4500
   	case d\*orange
      printf FF8C00
   	case orange
      printf FFA500
   	case gold
      printf FFD700
   	case d\*goldenrod
      printf B8860B
   	case goldenrod
      printf DAA520
   	case palegoldenrod
      printf EEE8AA
   	case d\*khaki
      printf BDB76B
   	case khaki
      printf F0E68C
   	case olive
      printf 808000
   	case yellow
      printf FFFF00
   	case yellowgreen
      printf 9ACD32
   	case d\*olivegreen
      printf 556B2F
   	case olivedrab
      printf 6B8E23
   	case lawngreen
      printf 7CFC00
   	case chartreuse
      printf 7FFF00
   	case greenyellow
      printf ADFF2F
   	case d\*green
      printf 006400
   	case green
      printf 008000
   	case forestgreen
      printf 228B22
   	case lime
      printf 00FF00
   	case limegreen
      printf 32CD32
   	case l\*green
      printf 90EE90
   	case palegreen
      printf 98FB98
   	case d\*seagreen
      printf 8FBC8F
   	case mediumspringgreen
      printf 00FA9A
   	case springgreen
      printf 00FF7F
   	case sea green
      printf 2E8B57
   	case mediumaquamarine
      printf 66CDAA
   	case mediumseagreen
      printf 3CB371
   	case l\*seagreen
      printf 20B2AA
   	case d\*slategray
      printf 2F4F4F
   	case teal
      printf 008080
   	case d\*cyan
      printf 008B8B
   	case aqua
      printf 00FFFF
   	case cyan
      printf 00FFFF
   	case l\*cyan
      printf E0FFFF
   	case d\*turquoise
      printf 00CED1
   	case turquoise
      printf 40E0D0
   	case mediumturquoise
      printf 48D1CC
   	case paleturquoise
      printf AFEEEE
   	case aquamarine
      printf 7FFFD4
   	case powderblue
      printf B0E0E6
   	case cadetblue
      printf 5F9EA0
   	case steelblue
      printf 4682B4
   	case cornflowerblue
      printf 6495ED
   	case deepskyblue
      printf 00BFFF
   	case dodgerblue
      printf 1E90FF
   	case l\*blue
      printf ADD8E6
   	case skyblue
      printf 87CEEB
   	case l\*skyblue
      printf 87CEFA
   	case midnightblue
      printf 191970
   	case navy
      printf 000080
   	case d\*blue
      printf 00008B
   	case mediumblue
      printf 0000CD
   	case blue
      printf 0000FF
   	case royalblue
      printf 4169E1
   	case blueviolet
      printf 8A2BE2
   	case indigo
      printf 4B0082
   	case d\*slateblue
      printf 483D8B
   	case slateblue
      printf 6A5ACD
   	case mediumslateblue
      printf 7B68EE
   	case mediumpurple
      printf 9370DB
   	case d\*magenta
      printf 8B008B
   	case d\*violet
      printf 9400D3
   	case d\*orchid
      printf 9932CC
   	case mediumorchid
      printf BA55D3
   	case purple
      printf 800080
   	case thistle
      printf D8BFD8
   	case plum
      printf DDA0DD
   	case violet
      printf EE82EE
   	case magenta fuchsia
      printf FF00FF
   	case orchid
      printf DA70D6
   	case mediumvioletred
      printf C71585
   	case palevioletred
      printf DB7093
   	case deeppink
      printf FF1493
   	case hotpink
      printf FF69B4
   	case l\*pink
      printf FFB6C1
   	case pink
      printf FFC0CB
   	case antiquewhite
      printf FAEBD7
   	case beige
      printf F5F5DC
   	case bisque
      printf FFE4C4
   	case blanchedalmond
      printf FFEBCD
   	case wheat
      printf F5DEB3
   	case cornsilk
      printf FFF8DC
   	case lemonchiffon
      printf FFFACD
   	case l\*goldenrodyellow
      printf FAFAD2
   	case l\*yellow
      printf FFFFE0
   	case saddlebrown
      printf 8B4513
   	case sienna
      printf A0522D
   	case choco chocolate
      printf D2691E
   	case peru
      printf CD853F
   	case sandybrown
      printf F4A460
   	case burlywood
      printf DEB887
   	case tan
      printf D2B48C
   	case rosybrown
      printf BC8F8F
   	case moccasin
      printf FFE4B5
   	case navajowhite
      printf FFDEAD
   	case peach peachpuff
      printf FFDAB9
   	case rose mistyrose
      printf FFE4E1
   	case lavenderblush
      printf FFF0F5
   	case linen
      printf FAF0E6
   	case oldlace
      printf FDF5E6
   	case papaya papayawhip
      printf FFEFD5
   	case seashell
      printf FFF5EE
   	case mintcream
      printf F5FFFA
   	case slategray
      printf 708090
   	case l\*slategray
      printf 778899
   	case l\*steelblue
      printf B0C4DE
   	case lavender
      printf E6E6FA
   	case floralwhite
      printf FFFAF0
   	case aliceblue
      printf F0F8FF
   	case ghostwhite
      printf F8F8FF
   	case honeydew
      printf F0FFF0
   	case ivory
      printf FFFFF0
   	case azure
      printf F0FFFF
   	case snow
      printf FFFAFA
   	case black
      printf 000000
   	case dimgray dimgrey
      printf 696969
   	case gray grey
      printf 808080
   	case d\*gray d\*grey
      printf A9A9A9
   	case silver
      printf C0C0C0
   	case l\*gray l\*grey
      printf D3D3D3
   	case gainsboro
      printf DCDCDC
   	case whitesmoke
      printf F5F5F5
   	case white
      printf FFFFFF
    case "*"
      printf $argv[1]
  end
end
