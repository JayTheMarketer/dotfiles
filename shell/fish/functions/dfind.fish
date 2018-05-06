function dfind --description 'searches recursively from cwd for directories containing the case-insensitive query'
	find . -type d -iname "*"$argv"*" ^/dev/null
end
