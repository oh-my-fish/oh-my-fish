function __fish_spec.color.echo.success
  set_color -o green
  echo $argv
  set_color normal
end

function __fish_spec.color.echo.failure
  set_color -o red
  echo $argv
  set_color normal
end

function __fish_spec.color.echo.mixed
  set_color -o yellow
  echo $argv
  set_color normal
end

function __fish_spec.color.echo.info
  set_color -o cyan
  echo $argv
  set_color normal
end

function __fish_spec.color.echo-n.info
  echo -n (set_color -o cyan)$argv(set_color normal)
end

function __fish_spec.color.echo.autocolor -a total failed
  if test $total -eq $failed -a $total -eq 0
    __fish_spec.color.echo.success $argv[3..-1]
  else if test $total -eq $failed
    __fish_spec.color.echo.failure $argv[3..-1]
  else if test $failed -gt 0
    __fish_spec.color.echo.mixed $argv[3..-1]
  else
    __fish_spec.color.echo.success $argv[3..-1]
  end
end
