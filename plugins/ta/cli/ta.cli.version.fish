function ta.cli.version
  set -l name     (ta.util.tafile.get.key name)
  set -l tagline  (ta.util.tafile.get.key tagline)
  set -l ver      (ta.util.tafile.get.key version)

  echo $name - (set_color yellow)$tagline(set_color normal) $ver

  echo -s (set_color 777)"
  If you are curious, ta or rather た, is a particle / deflection used in
  Japanese to indicate the completion of an action, roughly corresponding
  to the past tense in some western languages.
  "(set_color normal)\
  "
  Now go get some stuff done!"
end
