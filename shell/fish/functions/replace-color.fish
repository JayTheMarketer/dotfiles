# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.YA376j/replace-color.fish @ line 2
function replace-color --description 'replace color in image; ex. replace-color source.png red purple (replace red with purple)'
	cp "$argv[1]" "$argv[1].bak"
	magick convert $argv[1] -fuzz 30% -fill $argv[3] -opaque $argv[2] $argv[1]
end
