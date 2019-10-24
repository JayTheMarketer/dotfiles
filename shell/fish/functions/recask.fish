# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.UOVdGR/recask.fish @ line 2
function recask --description 'a more thorough option to brew cask reinstall'
	if count $argv > /dev/null
    brew cask uninstall $argv
    brew cask install $argv
  else
    echo 'No package specified'
  end
end
