function up --description 'go up $argv directories (default 1)'
	set --local up_to ".."
if test (count $argv) -ne 1; or test $argv[1] -eq 1
cd $up_to
else if echo $argv[1] | not grep -q '^-\?[0-9]\+$'
printf "Error: up should be called with the number of directories to go up. The default is 1."
else
for x in (seq (math $argv[1] - 1))
set up_to "$up_to/.."
end
cd $up_to
end
end
