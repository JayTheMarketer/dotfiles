# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.6JMSXR/brewup.fish @ line 2
function brewup --description 'update brew & all packages, casks, and apps'
	brew update; brew outdated; brew upgrade; brew cu --all --yes --quiet; mas outdated; mas upgrade; brew cleanup; brew doctor; brew bundle dump --force --file='~/Brewfile';
end
