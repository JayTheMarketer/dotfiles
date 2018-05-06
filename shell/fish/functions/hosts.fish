# Defined in - @ line 0
function hosts --description 'alias hosts=sudo $EDITOR /etc/hosts'
	sudo $EDITOR /etc/hosts $argv;
end
