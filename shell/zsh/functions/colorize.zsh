#!/bin/sh
#
# pygmentize script for coloring shell output
#

if which colorize >/dev/null; then
	alias c="colorize"
else
	alias c="pygmentize -O style=monokai -f console256 -g"
fi
