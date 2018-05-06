function psax --description 'get detailed information on a process for current user'
	ps ax -o pid,command | grep -v grep | grep --color=always -i $argv
end
