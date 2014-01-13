# beautify json string
# use : pybeautifyjson '{"foo": "lorem", "bar": "ipsum"}'
function pybeautifyjson
  echo $argv | _python -mjson.tool
end
