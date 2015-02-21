function ta.util.color.tags -a color
  env GREP_COLOR="$color" grep --color=always -E "$__ta_regex|\$"
end
