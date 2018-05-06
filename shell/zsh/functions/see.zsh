#!/bin/sh
#
# open command in $EDITOR
#

see() {
  $EDITOR "$(command which $1)"
}
