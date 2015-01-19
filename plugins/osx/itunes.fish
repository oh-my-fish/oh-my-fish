# Play, pause etc. iTunes

function itunes -d "Play, pause etc. iTunes. Use -h or --help for a more detailed description."
  if [ (count $argv) -gt 0 ]
    set -l opt $argv[1]
    switch $opt
      case launch play pause stop rewind resume quit      
      case mute
        set opt "set mute to true"      
      case unmute
        set opt "set mute to false"      
      case next previous
        set opt "$opt track"      
      case vol volume
        set opt "set sound volume to $argv[2]"      
      case "" -h --help
        echo "Usage: itunes <option>"
        echo "option:"
        echo \t"launch|play|pause|stop|rewind|resume|quit"
        echo \t"mute|unmute\tcontrol volume set"
        echo \t"next|previous\tplay next or previous track"
        echo \t"vol"\t"Set the volume, takes an argument from 0 to 100"
        echo \t"help"\t"show this message and exit"
        return 0      
      case '*'
        echo "Unknown option $opt. Use -h or --help for a more detailed description."
        return 1      
    end
    osascript -e "tell application \"iTunes\" to $opt"
  else
    echo "Arguments expected. Use -h or --help for a more detailed description."
  end
end