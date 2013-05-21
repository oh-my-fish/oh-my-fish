# clean current directory recursively from any .pyc and .pyo files
function pyclean
     if test -n $argv
        set path2CLEAN $argv
     else
        set path2CLEAN .
     end

     find $path2CLEAN -name "*.pyc" -delete -o -name "*.pyo" -delete
 end