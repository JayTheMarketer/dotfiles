#!/usr/bin/env bash
#
# Copies the pathname of the current directory to the clipboard
#

cpath() {
  echo $PWD | pbcopy
}
