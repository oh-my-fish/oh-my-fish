#!/usr/bin/env fish
# This script generates the AUTHORS file from Git history.

echo '# This file lists all individuals having contributed content to the repository.'
echo '# This list was auto-generated from Git history.'
echo

git log --format='%aN <%aE>' | awk '
{
    pos = index($0, "<");
    name = substr($0, 0, pos - 2);
    email = substr($0, pos + 1, length($0) - pos - 1);
    names[name]++;
    emails[email]++;
    if (names[name] == 1 && emails[email] == 1) {
        print $0;
    }
}
' | env LC_ALL=C.UTF-8 sort -uf
