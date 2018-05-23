function replace-color --description 'replace color in image; ex. replace-color source.png red purple (replace red with purple)'
	magick convert $argv[1] -fuzz 30% -fill $argv[3] -opaque $argv[2] $argv[1]
end
