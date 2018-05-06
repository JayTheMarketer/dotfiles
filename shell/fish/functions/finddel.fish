function finddel --description 'recursively finds and deletes any files/dirs with the matching name'
  find . -name $argv[1] -ls -delete
end
