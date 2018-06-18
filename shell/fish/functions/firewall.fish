# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.BlvE6F/fw.fish @ line 2
function firewall --description 'alias for macOS firewall'
	sudo /usr/libexec/ApplicationFirewall/socketfilterfw $argv;
end
