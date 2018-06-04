function brewnum --description 'number of homebrew packages'
	brew list | wc -l
end
