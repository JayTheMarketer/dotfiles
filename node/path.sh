#!/bin/sh

# Add Yarn global binaries to $PATH
if command -v yarn >/dev/null; then
  YARNBIN=`yarn global bin`
  echo $PATH | grep -q $YARNBIN || export PATH=$PATH:$YARNBIN
fi
