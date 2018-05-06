function touch --description 'create file and open in $EDITOR'
	command touch $argv; and eval $EDITOR $argv
end
