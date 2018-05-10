function manp --description 'Open a specified manpage as a PDF in Preview'
	man -t $argv | open -f -a Preview
end
