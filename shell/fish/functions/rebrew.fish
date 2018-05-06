function rebrew --description 'a more thorough option to brew reinstall'
  brew uninstall $argv
  brew install $argv
end
