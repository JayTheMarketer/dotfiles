# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.ZtC2Fj/gemup.fish @ line 2
function gemup --description 'update ruby and all gems'
	gem update --system; gem update; gem cleanup
end
