# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.uvqo4V/brewup.fish @ line 2
function brewup --description 'update brew & all packages, casks, and apps'
	brew update; brew outdated; brew upgrade --cleanup; brew cu --all --yes --cleanup --quiet; mas outdated; mas upgrade; brew cask cleanup; brew cleanup; brew prune; brew doctor;
end
