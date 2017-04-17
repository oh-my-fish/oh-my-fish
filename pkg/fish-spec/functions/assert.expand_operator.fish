function assert.expand_operator -a operator
  switch $operator
    case =
      echo equals
    case -n
      echo not empty
    case \-z
      echo empty
    case \*
      echo $operator
  end
end
