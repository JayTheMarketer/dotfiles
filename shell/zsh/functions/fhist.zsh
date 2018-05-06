#!/usr/bin/env zsh
#
# load zsh history up in FZF to search
#

fhist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
