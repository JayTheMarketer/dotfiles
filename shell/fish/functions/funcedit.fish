# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.oWeKkR/funcedit.fish @ line 2
function funcedit --description 'edit function in $EDITOR'
	funced -e $EDITOR $argv; funcsave $argv
end
