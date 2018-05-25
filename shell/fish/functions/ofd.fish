# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.qm8Nie/ofd.fish @ line 2
function ofd
	if test (count $argv) -gt 0
    open -a Finder $argv
  else
    open -a Finder $PWD
	end
end
