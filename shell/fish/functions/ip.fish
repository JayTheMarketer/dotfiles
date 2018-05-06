function ip --description 'find WAN IP address'
	dig +short myip.opendns.com @resolver1.opendns.com
end
