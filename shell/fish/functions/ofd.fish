# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.Sz23ZQ/ofd.fish @ line 1
function ofd --description 'open current directory in Finder'
	if count $argv > /dev/null
		open $argv
	else
		open $PWD
	end
end
