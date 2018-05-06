function lrt --description 'ls --options: 1=one file per line, F=put / after directories, c=show time of last modification, r=reverse order, t=sort by modification; newest first'
  ls -1Fcrt $argv
end
