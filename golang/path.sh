#!/bin/sh

if command -v go >/dev/null; then
  export GOPATH="$HOME/.go"
  export GOROOT=`go env GOROOT`
  echo $PATH | grep -q $GOPATH/bin || export PATH=$GOPATH/bin:$PATH
  echo $PATH | grep -q $GOROOT/bin || export PATH=$GOROOT/bin:$PATH
fi
