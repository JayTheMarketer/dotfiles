function fisher-ls-all --description 'get all fisher plugins with repo info'
	fisher ls-remote --format="%name(%stars): %info [%url]\n"
end
