function ta.util.get.tail
  tail -rn1 $__ta_file_data \
    | cut -f1
end
