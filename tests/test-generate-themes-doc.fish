#!/usr/bin/env fish

function __test_themes_doc
  set -l project_dir (status -f|xargs dirname|xargs dirname)
  set -l theme_output (mktemp /tmp/fish.test.Themes.XXXXX.md)
  set -l theme_doc $project_dir/docs/Themes.md

  fish $project_dir/tools/generate-themes-doc.fish $theme_output

  if cmp -s $theme_doc $theme_output
    echo "OK: $theme_doc is up-to-date"
    exit 0
  else
    diff $theme_doc $theme_output
    echo "WARN: $theme_doc is not up-to-date"
    exit 1
  end
end

set -l compare_url "https://api.github.com/repos/$TRAVIS_REPO_SLUG/compare/$TRAVIS_COMMIT_RANGE"
echo "Detecting changes: $compare_url ..."
if curl -s $compare_url | grep -E '"filename": ?"db/themes'
  echo "Changes to themes found. Verifying Themes.doc ..."
  __test_themes_doc
else
  echo "OK: No changes to themes found."
  exit 0
end
