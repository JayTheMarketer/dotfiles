#!/usr/bin/env bash
#
# Open a specified man page in Dash
#

mand() {
  local page
  if (( $# > 0 )); then
    open "dash://manpages:$@"
  else
    printf "What manpage would you like to open?"
    read -l page
    open "dash://manpages:$page"
  fi
}
