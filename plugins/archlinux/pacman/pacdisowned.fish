# TODO: Need to convert to fish
function pacdisowned
  # tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  # db=$tmp/db
  # fs=$tmp/fs

  # mkdir "$tmp"
  # trap  'rm -rf "$tmp"' EXIT

  # pacman -Qlq | sort -u > "$db"

  # find /bin /etc /lib /sbin /usr \
  #     ! -name lost+found \
  #       \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  # comm -23 "$fs" "$db"
end

