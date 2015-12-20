function omf.check.fish_prompt
  set -l prompt_file "fish_prompt.fish"
  set -l theme (cat $OMF_CONFIG/theme)

  set -l user_functions_path (omf.xdg.config_home)/fish/functions
  set -l fish_prompt (readlink "$user_functions_path/$prompt_file" ^/dev/null)

  not test -e "$fish_prompt"; and return 0
  contains -- "$fish_prompt" {$OMF_CONFIG,$OMF_PATH}/themes/$theme/$prompt_file
end
