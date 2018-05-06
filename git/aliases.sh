#!/bin/sh

if which git >/dev/null; then
  alias cdgr='cd `git root`' # requires git-extras
fi

if which gist >/dev/null; then
  alias gist-paste="gist --private --copy --paste --filename"  # gist-paste filename.ext -- create private Gist from the clipboard contents
  alias gist-file="gist --private --copy"  # gist-file filename.ext -- create private Gist from a file
fi
