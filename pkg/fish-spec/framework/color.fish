function echo::success
  set_color -o green
  echo $argv
  set_color normal
end

function echo::failure
  set_color -o red
  echo $argv
  set_color normal
end

function echo::mixed
  set_color -o yellow
  echo $argv
  set_color normal
end

function echo::info
  set_color -o cyan
  echo $argv
  set_color normal
end

function echo::autocolor -a total failed
  if test $total -eq $failed -a $total -eq 0
    echo::success $argv[3..]
  else if test $total -eq $failed
    echo::failure $argv[3..]
  else if test $failed -gt 0
    echo::mixed $argv[3..]
  else
    echo::success $argv[3..]
  end
end
