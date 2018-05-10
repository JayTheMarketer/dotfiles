function mand -d "Open a specified manpage in Dash"
  if [ (count $argv) -gt 0 ]
    open "dash://manpages:$argv"
  else
    echo "What manpage would you like to open?"
    read -l manpg
    open "dash://manpages:$manpg"
  end
end
