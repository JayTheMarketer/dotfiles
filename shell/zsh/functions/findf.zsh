#!/usr/bin/env zsh
#
# Find a file with pattern $1 in name
#

findf() {
  find . -type f -iname '*'${1:-}'*' -ls ;
}
