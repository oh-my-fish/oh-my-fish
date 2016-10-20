function omf.version
  command git -C "$OMF_PATH" describe --tags --match 'v*' --always | cut -c 2-
end
