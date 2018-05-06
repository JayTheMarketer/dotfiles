#!/bin/sh

# Make less the default pager, add some options and enable syntax highlight using source-highlight
LESSPIPE=`which src-hilite-lesspipe.sh`
[ -n "$LESSPIPE" ] && export LESSOPEN="| ${LESSPIPE} %s"
less_options=(
  # If the entire text fits on one screen, just show it and quit. (Be more
  # like "cat" and less like "more".)
  --quit-if-one-screen

  # Do not clear the screen first.
  --no-init

  # Like "smartcase" in Vim: ignore case unless the search pattern is mixed.
  --ignore-case

  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS

  # Do not ring the bell when trying to scroll past the end of the buffer.
  --quiet

  # Do not complain when we are on a dumb terminal.
  --dumb
);
export LESS="${less_options[*]}"
export PAGER='less'

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
