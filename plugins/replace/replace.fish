function replace --description 'Find and replace by a given list of files.'
  set find_this $argv[1]
  set replace_with $argv[2]

  ag -l $find_this $argv[3..-1] | xargs sed -i '' "s/$find_this/$replace_with/g"
end
