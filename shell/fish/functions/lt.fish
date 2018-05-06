# Defined in - @ line 0
function lt --description 'ls --options: l=long list, t=sort by modification, newest first, F=display / after directory, h=byte unit suffixes'
	ls -ltFh $argv;
end
