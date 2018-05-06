function emptytrash --description 'empty all trashes'
	sudo rm -rfv /Volumes/*/.Trashes
  sudo rm -rfv ~/.Trash
  sudo rm -rfv /private/var/log/asl/*.asl
  sudo rm -rfv ~/Library/Mobile\ Documents/com~apple~CloudDocs/.Trash
end
