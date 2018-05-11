# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.6DHMJZ/updateall.fish @ line 2
function updateall --description 'update everything (macOS)'
	softwareupdate -i -a; brewup; yarnup; gemup; composerup;
end
