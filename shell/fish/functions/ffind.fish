function ffind --description 'searches recursively from cwd for files containing the case-insensitive query'
	find . -type f -iname "*"$argv"*" ^/dev/null
end
