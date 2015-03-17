import plugins/fish-spec
import plugins/ta

function describe_ta -d "ta: to-done task manager"
    function before_all
    end

    function after_all
    end

    function it_does_something
      ta -h
      expect $status --to-equal 0
    end

end

spec.run $argv
