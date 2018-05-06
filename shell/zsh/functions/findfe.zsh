#!/usr/bin/env zsh
#
# Find a file with pattern $1 in name and execute $2 on it
#

findfe() {
  find . -type f -iname '*'${1:-}'*' -exec "${2:-ls}" {} \;  ;
}
