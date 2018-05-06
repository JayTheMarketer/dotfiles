function seek --description 'search current folder with ls and grep'
	ls -a | grep --color=auto -i $argv;
end
