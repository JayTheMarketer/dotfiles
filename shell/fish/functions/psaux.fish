function psaux --description 'information about a specific process for all users'
	ps aux | grep -v grep | cgrep -i $argv
end
