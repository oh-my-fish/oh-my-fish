function omf.cli.help
  set -l IFS ''
  set -l doc_root $OMF_PATH/docs/cli
  set -l doc $doc_root/omf.adoc

  # If a command was given, find a help document for it.
  if set -q argv[1]
    if not set command (omf.command $argv[1])
      echo (omf::err)"Unknown command: $argv[1]"(omf::off) >&2
      return $OMF_UNKNOWN_OPT
    end

    set doc $doc_root/$command.adoc
  end

  set -l r (set_color normal ^ /dev/null)
  set -l c (set_color cyan ^ /dev/null)
  set -l b (set_color --bold ^ /dev/null)
  set -l u (set_color --underline ^ /dev/null)

  # Format the help document for the terminal.
  fold -s -w 78 $doc | sed -e "
    # Strip cross references.
    s/<<[^,]*,\([^>]*\)>>/\1/g

    # Definition lists.
    s/^\([^[:space:]].*\)::\(..*\)/\1\2/g
    s/^\([^[:space:]].*\)::/$b\1$r/g

    # Nice bullets for unordered lists.
    s/^[*-] /· /g

    # Indent everything left except for headers and the first line.
    2,\$ s/^[^=]/  &/

    # Headers.
    s/^==* \(.*\)/$b\1$r/

    # Highlight bold and monospace text.
    s/\*\*\([^\*]*\)\*\*/$c\1$r/g
    s/\*\([^\*]*\)\*/$c\1$r/g
    s/``\([^`]*\)``/$c\1$r/g
    s/`\([^`]*\)`/$c\1$r/g

    # Style italics as underline.
    s/__\([^_]*\)__/$u\1$r/g
    s/_\([^_]*\)_/$u\1$r/g

    # Underline links.
    s/[[:alnum:]_][[:alnum:]_]*:[^[:space:]][^[:space:]]*/$u&$r/g

    # Underline variable names in angle brackets.
    s/<[^>]*>/$u&$r/g
  "
end
