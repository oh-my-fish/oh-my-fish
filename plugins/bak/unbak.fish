# Function to move files and directories (a.txt.20140608_195859.bak move to a.txt)
# (c) Roman Inflianskas (rominf) <infroma@gmail.com>, 2014

function unbak
	set re_bak '(.*)\.[0-9]{8,8}_[0-9]{6,6}\.bak'
	set file $argv[1] 
	set normalized (echo "$file" | sed -E "s/$re_bak/\1/g")

	function is_bak
		echo "$file" | perl -ne "print if /$re_bak/" > /dev/null
	end

	if test ! -e $file
		echo "File \"$file\" not exists! Cannot unbak \"$file\"."
	else if not is_bak $file
		echo "File \"$file\" don't meet bak files convention! Cannot unbak \"$file\"."
	else if test -e $normalized
		echo "File \"$normalized\" exists! Cannot unbak \"$file\"."
	else
		mv $file $normalized
	end
end
