# Defined in - @ line 0
function ldot --description 'ls for dotfiles only --options: l=long list, d=show directories, not their contents, h=byte unit suffixes'
	ls -ldh .* $argv
end
