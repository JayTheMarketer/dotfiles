function lr --description 'ls --options: t=sort by modification, newest first, R=recursive, F=display / after directory, h=byte unit suffixes'
  ls -tRFh $argv
end
