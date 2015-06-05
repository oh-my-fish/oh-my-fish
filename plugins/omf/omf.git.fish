function omf.git
  switch $argv[1]
    case '--clone'
      set -l repo_url $argv[2]
      set -l path $argv[3]

      git clone --quiet $repo_url $path ^ /tmp/oh-my-fish.clone.log
    case '--update'
      set -l path $argv[2]
      return (pushd $path; and git pull --quiet --rebase > /dev/null
              echo $status
              popd > /dev/null)
    case '*'
      omf.log red 'Unknown option'
  end
end
