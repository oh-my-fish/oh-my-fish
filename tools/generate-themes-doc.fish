#!/usr/bin/env fish

# This is meant to be run from the root:
#
# ./tools/generate-themes-doc.fish > docs/NewThemes.md
#
# Prior to running it, check out packages-main repository alongside oh-my-fish.
# If it's checked out at another location, you can specify it with the only
# optional argument
#
# ./tools/generate-themes-doc.fish /full-or-rel-path/packages-main > docs/NewThemes.md
#

if [ $argv ]
  set packages "$argv/packages"
else
  set packages "../packages-main/packages"
end

type -q gsed; and alias sed gsed

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

echo "# Available themes" > $temp_theme_toc
for theme in (command grep -r -l "type = theme" $packages | sort)
  set -l name (basename $theme)
  set -l url (grep repository $theme | string replace "repository = " "")
  set -l raw_content (echo $url | sed -r 's#\.git$#/#i; s#https://github.com/([-.a-z0-9]+)/([-.a-z0-9]+)#https://raw.githubusercontent.com/\1/\2/master#i')
  set -l readme (__find_readme $raw_content)

  echo "- [$name](#$name)" >> $temp_theme_toc
  echo "# $name" >> $temp_theme_contents
  if [ $readme ]
    echo "Fetching readme for $name" >&2
    __write_theme_readme $name $raw_content $readme
  else
    echo "FAILED: No readme for $name" >&2
    echo "See $url for details" >> $temp_theme_contents
  end
end

echo "" >> $temp_theme_toc
cat $temp_theme_contents >> $temp_theme_toc
rm -f $theme_doc
cat $temp_theme_toc
echo "All done!" >&2

rm $temp_theme_contents
rm $temp_theme_toc
