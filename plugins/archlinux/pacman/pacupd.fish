which abs ^ /dev/null > /dev/null
if test $status -ne 1
  function pacupd -d "Update and refresh the local package and ABS databases against repositories"
    sudo pacman -Sy; and sudo abs
  end
else
  function pacupd -d "Update and refresh the local package against repositories"
    sudo pacman -Sy
  end
end
