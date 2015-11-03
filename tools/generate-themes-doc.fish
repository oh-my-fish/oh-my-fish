#!/usr/bin/env fish

set -l project_dir (status -f|xargs dirname|xargs dirname)
if [ $argv ]
  set theme_doc $argv
else
  set theme_doc "$project_dir/docs/Themes.md"
end
set temp_theme_contents (mktemp /tmp/fish.Themes.Content.XXXXX.md)
set temp_theme_toc (mktemp /tmp/fish.Themes.TOC.XXXXX.md)

function __write_theme_readme -a name raw_content readme
  set -l escaped_raw_content (echo $raw_content | sed -r s"#[\/]#\\\/#gi")
  curl -s "$raw_content/$readme" | \
    sed -r 's/^#(.*)$/###\1/gi' | \
    sed -r 's/^=+$//gi' | \
    sed -r 's/^!\[(.*)\]\(([^h][^t][^t].*)\)$/![\1]('$escaped_raw_content'\/\2)/gi' | \
    sed -r 's/\[([^\]+)\]\[([a-zA-Z0-9]+)\]/[\1][THEMES-NAMESPACE-'"$name"'-\2]/gi' | \
    sed -r 's/\[([a-zA-Z0-9]+)\]: (.+)/[THEMES-NAMESPACE-'"$name"'-\1]: \2/gi' \
    >> $temp_theme_contents
  echo "" >> $temp_theme_contents
  echo "" >> $temp_theme_contents
end

function __find_readme -a raw_content
  for readme in "README.md" "readme.md"
    if curl -Ifs "$raw_content/$readme" > /dev/null
      echo $readme
      break
    end
  end
end

echo "Generating Themes documentation to $theme_doc ..."
echo "# Available themes" > $temp_theme_toc

for theme in (command find $project_dir/db/themes/ -type f|sort)
  set -l name (echo $theme|xargs basename)
  set -l url (cat $theme)
  set -l raw_content (echo $url|sed -r 's#https://github.com/([-.a-z0-9]+)/([-.a-z0-9]+)#https://raw.githubusercontent.com/\1/\2/master#gi')
  set -l readme (__find_readme $raw_content)

  echo "- [$name](#$name)" >> $temp_theme_toc
  echo "# $name" >> $temp_theme_contents
  if [ $readme ]
    echo "Fetching readme for $name"
    __write_theme_readme $name $raw_content $readme
  else
    echo "FAILED: No readme for $name" 1>&2
    echo "See $url for details" >> $temp_theme_contents
  end
end

echo "" >> $temp_theme_toc
cat $temp_theme_contents >> $temp_theme_toc
rm -f $theme_doc
cat $temp_theme_toc >> $theme_doc
echo "All done: $theme_doc"

rm $temp_theme_contents
rm $temp_theme_toc
