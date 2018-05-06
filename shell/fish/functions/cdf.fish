function cdf --description 'cd into formost Finder window'
	cd (osascript -e '
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell')
end
