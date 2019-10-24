# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.fb55LN/rebrew.fish @ line 2
function rebrew --description 'a more thorough option to brew reinstall'
	if count $argv > /dev/null
    echo 'No package specified'
  else
    brew uninstall $argv
    brew install $argv
  end
end
