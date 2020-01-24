# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.iTgkwP/npmup.fish @ line 2
function npmup --description 'upgrade npm and all global packages'
	npm update -g npm; npm outdated -g; npm update -g
end
