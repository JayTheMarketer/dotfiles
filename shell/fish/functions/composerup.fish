function composerup --description 'update composer and all packages'
	composer selfupdate
  composer global outdated
  composer global update
  composer clear-cache
end
