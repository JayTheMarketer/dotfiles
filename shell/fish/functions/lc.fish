# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.43Pjmz/lc.fish @ line 2
function lc --description 'colorls (requires `ruby download colorls`)'
	colorls --long --almost-all --sort-dirs --git-status $argv
end
