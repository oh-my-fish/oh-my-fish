function ta.util.tafile.get.key -a key
  grep -E "\b$key\b" $__ta_file_info | cut -d, -f2
end
