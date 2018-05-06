function awk --description 'use gawk if available'
	if type -q gawk
gawk $argv
else
awk $argv
end
end
