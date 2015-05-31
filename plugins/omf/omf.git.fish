function omf.git
  switch $argv[1]
    case '--clone'
      set -l repo_url $argv[2]
      set -l path $argv[3]

      git clone --quiet $repo_url $path ^ /tmp/oh-my-fish.clone.log
    case '--update'
      set -l path $argv[2]
      return (cd $path; and git pull --rebase > /dev/null; echo $status)
    case '*'
      omf.log red 'Unknown option'
  end
end
