#!/bin/sh
#
# create directory and `cd` into it
#

mkcd() {
  mkdir -pv "$@" && cd "$@"
}
