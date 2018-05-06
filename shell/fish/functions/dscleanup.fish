function dscleanup --description 'recursively delete DS_Store files'
	find . -type f -name '*.DS_Store' -ls -delete
end
