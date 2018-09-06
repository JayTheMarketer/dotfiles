# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.6DYxlZ/updateall.fish @ line 2
function updateall --description 'update everything (macOS)'
	brewup; yarnup; gemup; composerup; sudo softwareupdate --install --all --restart;
end
