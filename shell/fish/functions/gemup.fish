function gemup --description 'update ruby and all gems'
	update_rubygems; gem update --system; gem update; gem cleanup
end
