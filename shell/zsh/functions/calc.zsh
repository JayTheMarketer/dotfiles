#!/bin/sh
#
# simple calculator
# usage: calc <equation>
#

calc() {
  if which bc >/dev/null; then
    echo "scale=3; $*" | bc -l
  else
    awk "BEGIN { print $* }"
  fi
}
