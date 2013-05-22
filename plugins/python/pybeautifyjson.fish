# beautify json string
# use : pybeautifyjson '{"foo": "lorem", "bar": "ipsum"}'
function pybeautifyjson
  echo $argv | python -mjson.tool
end