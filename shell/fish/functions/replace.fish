function replace --description 'Find and replace by a given list of files.'
	set find_this $argv[1]
set replace_with $argv[2]
set look_here $argv[3..-1]

ag -0 -l $find_this $look_here | xargs -0 sed -ri.bak -e "s/$find_this/$replace_with/g"
end
