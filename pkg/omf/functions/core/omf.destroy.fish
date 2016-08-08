function omf.destroy -d "Remove Oh My Fish"
  # Run the uninstaller
  fish "$OMF_PATH/bin/install" --uninstall "--path=$OMF_PATH" "--config=$OMF_CONFIG"

  # Start a new OMF-free shell
  set -q CI; or exec fish < /dev/tty
end
