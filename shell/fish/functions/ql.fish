function ql --description 'Quick Look a specified file or directory'
	if [ (count $argv) -gt 0 ]
        quiet qlmanage -p $argv &
    else
        echo "No arguments given"
    end
end
