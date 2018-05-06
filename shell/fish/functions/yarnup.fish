function yarnup --description 'upgrade npm and all global packages'
	brew upgrade npm; brew upgrade yarn; yarn global upgrade
end
