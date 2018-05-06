function manp --description 'Open a specified man page in Dash'
	if [ (count $argv) -gt 0 ]
    open "dash://manpages:$argv"
  else
    echo "What manpage would you like to open?"
    read -l manpg
    open "dash://manpages:$manpg"
  end
end
