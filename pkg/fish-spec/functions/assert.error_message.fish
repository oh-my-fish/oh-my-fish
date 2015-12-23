function assert.error_message
  set -l number_of_arguments (count $argv)

  switch $argv[1]
    case !
      switch $number_of_arguments
        case 3
          set operator (assert.expand_operator $argv[2])
          set actual $argv[3]
          echo "Expected result to not be $operator but it was $actual"
        case 4
          set expected $argv[2]
          set operator "not" (assert.expand_operator $argv[3])
          set actual   $argv[4]
          echo "Expected result to $operator $expected but it was $actual"
        case \*
          return 1
        end
    case \-\*
      test $number_of_arguments != 2; and return 1
      set operator (assert.expand_operator $argv[1])
      set actual $argv[2]
      echo "Expected result to be $operator but it was $actual"
    case \*
      test $number_of_arguments != 3; and return 1
      set expected $argv[1]
      set operator (assert.expand_operator $argv[2])
      set actual   $argv[3]
      echo "Expected result to $operator $expected but it was $actual"
  end
end
