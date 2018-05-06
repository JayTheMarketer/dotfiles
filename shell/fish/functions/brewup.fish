function brewup  --description 'update brew & all packages, casks, and apps'
	brew update; brew outdated; brew upgrade --force-bottle --cleanup; brew cu -a -y; mas upgrade; brew cask cleanup; brew cleanup; brew prune; brew doctor;
end
