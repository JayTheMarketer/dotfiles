#!/usr/bin/env zsh
#
# Find a directory with pattern $1 in name
#

findd() {
  find . -type d -iname '*'${1:-}'*' -ls ;
}
