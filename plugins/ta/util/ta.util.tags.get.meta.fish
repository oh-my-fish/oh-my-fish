function ta.util.tags.get.meta
  set -l week  (date +%a)
  set -l day   (date +%d)
  switch $day
    case 1 21 31
      set $day "$day"st
    case 2 22
      set $day "$day"nd
    case 3 23
      set $day "$day"rd
    case \*
      set $day "$day"th
  end
  set -l month (date +%b)
  set -l year  (date +%Y)
  set -l hour  (date "+%r" | \
    sed -E "s/0?([1-9][0-9]?).*(..)/\1\2/")

  printf "#%s " $week $day $month $year $hour | awk '{print tolower}'
end
