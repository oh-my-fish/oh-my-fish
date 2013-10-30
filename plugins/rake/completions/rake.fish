# fish completion for rake
function __fish_rake_tasks
  rake -T ^/dev/null | awk '{print $2"\t"substr($0, index($0, $4))}'
end

### commands

complete -c rake -f -a '(__fish_rake_tasks)'
complete -c rake -s C -l classic-namespace        -d 'Put Task and FileTask in the top level namespace'
complete -c rake -s D -l describe              -x -d 'Describe the tasks (matching optional PATTERN), then exit.'
complete -c rake -s n -l dry-run                  -d 'Do a dry run without executing actions.'
complete -c rake -s e -l execute               -x -d 'Execute some Ruby code and exit.'
complete -c rake -s p -l execute-print         -x -d 'Execute some Ruby code, print the result, then exit.'
complete -c rake -s E -l execute-continue      -x -d 'Execute some Ruby code, then continue with normal task processing.'
complete -c rake -s I -l libdir                -x -d 'Include LIBDIR in the search path for required modules.'
complete -c rake -s N -l no-search -l nosearch    -d 'Do not search parent directories for the Rakefile.'
complete -c rake -s P -l prereqs                  -d 'Display the tasks and dependencies, then exit.'
complete -c rake -s q -l quiet                    -d 'Do not log messages to standard output.'
complete -c rake -s f -l rakefile              -x -d 'Use FILE as the rakefile.'
complete -c rake -s R -l rakelibdir            -x -d "Auto-import any .rake files in RAKELIBDIR. (default is 'rakelib')"
complete -c rake -l rakelib
complete -c rake -s r -l require               -x -d 'Require MODULE before executing rakefile.'
complete -c rake -l rules                         -d 'Trace the rules resolution.'
complete -c rake -s s -l silent                   -d "Like --quiet, but also suppresses the 'in directory' announcement."
complete -c rake -s g -l system                   -d "Using system wide (global) rakefiles (usually '~/.rake/*.rake')."
complete -c rake -s G -l no-system -l nosystem    -d 'Use standard project Rakefile search paths, ignore system wide rakefiles.'
complete -c rake -s T -l tasks                 -x -d 'Display the tasks (matching optional PATTERN) with descriptions, then exit.'
complete -c rake -s t -l trace                    -d 'Turn on invoke/execute tracing, enable full backtrace.'
complete -c rake -s v -l verbose                  -d 'Log message to standard output.'
complete -c rake -s V -l version                  -d 'Display the program version.'
complete -c rake -s W -l where                 -x -d 'Describe the tasks (matching optional PATTERN), then exit.'
complete -c rake -s X -l no-deprecation-warnings  -d 'Disable the deprecation warnings.'
complete -c rake -s h -s H -l help                -d 'Display this help message.'
