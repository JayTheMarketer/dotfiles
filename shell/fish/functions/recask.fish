function recask --description 'a more thorough option to brew cask reinstall'
  brew cask uninstall $argv
  brew cask install $argv
end
