# To show the right prompt please set
# set fish_theme_l_right_prompt true (config.fish)

if test "$fish_theme_l_right_prompt" = true

  function _ruby_version
    echo (command rbenv version-name | sed 's/\n//')
  end

  function _ruby_gemset
    echo (command rbenv gemset active ^/dev/null | sed -e 's| global||')
  end

  function fish_right_prompt
    set -l red (set_color red)
    set -l normal (set_color normal)

    set ruby_info $red(_ruby_version)

    if [ (_ruby_gemset) ]
      set -l ruby_gemset $red(_ruby_gemset)
      set ruby_info "$ruby_info@$ruby_gemset"
    end

    echo -n -s $ruby_info $normal
  end

end
