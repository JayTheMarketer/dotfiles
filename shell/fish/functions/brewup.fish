# Defined in /var/folders/jr/5blkp97x441_cj_thkkc6v2m0000gn/T//fish.ZNnhDT/brewup.fish @ line 2
function brewup --description 'update brew & all packages, casks, and apps'
	brew update; brew outdated; brew upgrade --cleanup; brew cu --all --yes --cleanup; mas outdated; mas upgrade; brew cask cleanup; brew cleanup; brew prune; brew doctor;
end
