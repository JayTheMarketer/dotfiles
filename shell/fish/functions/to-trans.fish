# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.VQvQ92/to-trans.fish @ line 1
function to-trans --description 'use image magick to convert white background to transparent'
	magick convert $argv -fuzz 25% -transparent white $argv
end
