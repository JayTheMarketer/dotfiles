function sysinfo --description 'prints system information'
  echo -e "\\n\033[1;31mYou are logged on:\033[0m" ; hostname
  echo -e "\\n\033[1;31mAdditionnal information:\033[0m" ;
  echo kernel-name: (uname --kernel-name) ;
  echo kernel-release: (uname --kernel-release) ;
  echo kernel-version: (uname --kernel-version) ;
  echo machine: (uname --machine) ;
  echo processor: (uname --processor) ;
  echo hardware-platform: (uname --hardware-platform)
  echo -e "\\n\033[1;31mUsers logged on:\033[0m" ; w -h
  echo -e "\\n\033[1;31mCurrent date :\033[0m" ; date
  echo -e "\\n\033[1;31mMachine stats :\033[0m" ; uptime
  echo -e "\\n\033[1;31mMemory stats :\033[0m" ; free
  echo -e "\\n\033[1;31mLAN IP Address :\033[0m" ; myip
  echo -e "\\n\033[1;31mWAN IP Address :\033[0m" ; ip
end
