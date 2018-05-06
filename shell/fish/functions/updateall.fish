function updateall --description 'update everything (macOS)'
	sudo softwareupdate -i -a; brewup; yarnup; gemup; composerup;
end
