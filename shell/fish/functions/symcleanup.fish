function symcleanup --description 'remove all broken symlinks'
	bass 'find -L . -name . -o -type d -prune -o -type l -exec rm {} +'
end
