function l --description 'ls --options: l=long list, A=display dotfiles (except for . and ..), F=display / after directory, h=byte unit suffixes'
  ls -lAFh $argv
end
