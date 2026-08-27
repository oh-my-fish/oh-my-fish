# omf.theme.prompt_path <theme>
# Prints the theme's fish_prompt.fish (root or functions/), if it has one.
function omf.theme.prompt_path -a theme
  for path in {$OMF_CONFIG,$OMF_PATH}/themes/$theme/{,functions/}fish_prompt.fish
    if test -f $path
      echo $path
      return 0
    end
  end
  return 1
end
