# Defined in /var/folders/jr/5blkp97x441_cj_thkkc6v2m0000gn/T//fish.I4KOm7/brewup.fish @ line 2
function brewup --description 'update brew & all packages, casks, and apps'
	brew update; brew outdated; brew upgrade; brew cu --all --yes --quiet; mas outdated; mas upgrade; brew cleanup; brew doctor;
end
