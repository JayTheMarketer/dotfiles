function rcp --description 'faster (remote and local) transfers than scp -- eg: `rcp file.txt aws:~/`'
	rsync --archive --perms --compress
end
