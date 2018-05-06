function flushdns --description 'function to flush the DNS cache'
	sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
end
