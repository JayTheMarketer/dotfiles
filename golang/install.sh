#!/bin/sh

export GOPATH="$HOME/.go"

if [ "$(command -v go)" ] && [ -n "$GOPATH" ]; then
  mkdir -p "$GOPATH/bin" "$GOPATH/src/github.com/"

  packages="
    github.com/alecthomas/gometalinter
    github.com/nsf/gocode
    golang.org/x/tools/cmd/cover
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/guru
    golang.org/x/tools/cmd/goimports
    golang.org/x/tools/cmd/gorename
    golang.org/x/lint/golint
  "

  for pkg in $packages; do
    go get -u "$pkg"
  done

  "$GOPATH"/bin/gometalinter --install --update
fi

export GOROOT=`go env GOROOT`
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH
