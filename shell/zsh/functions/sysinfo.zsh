#!/bin/sh
#
# get current host related info
#

  # ensure aliases are defined
  local free="ruby /Users/schwartzj/Documents/Developer/dotfiles/functions/free-memory.rb"
  local ip="dig +short myip.opendns.com @resolver1.opendns.com"
  local myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print }'"

sysinfo() {
  # print system information
  echo -e "\\n\033[1;31mYou are logged on:\033[0m" ; hostname
  echo -e "\\n\033[1;31mAdditionnal information:\033[0m" ; uname -sr
  echo -e "\\n\033[1;31mUsers logged on:\033[0m" ; w -h
  echo -e "\\n\033[1;31mCurrent date :\033[0m" ; date
  echo -e "\\n\033[1;31mMachine stats :\033[0m" ; uptime
  echo -e "\\n\033[1;31mMemory stats :\033[0m" ; free
  echo -e "\\n\033[1;31mLAN IP Address :\033[0m" ; myip
  echo -e "\\n\033[1;31mWAN IP Address :\033[0m" ; ip
}
