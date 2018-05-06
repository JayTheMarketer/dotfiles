function lart --description 'ls --options: 1=one file per line, F=put / after directories, c=show time of last modification, a=do not ignore enteries starting with ., r=reverse order, t=sort by modification; newest first'
  ls -1Fcart $argv
end
