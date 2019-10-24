# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.1LIQCM/recask.fish @ line 2
function recask --description 'a more thorough option to brew cask reinstall'
	if count $argv > /dev/null
    echo 'No package specified'
  else
    brew cask uninstall $argv
    brew cask install $argv
  end
end
