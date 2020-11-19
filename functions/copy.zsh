#!/usr/bin/env bash
#
# Copy the contents of a text file or variable to your clipboard
# usage ex. copy <file>
#

copy() {
  if [[ $# -eq 1 ]]; then
    case $(uname -s) in
      Linux) 
        if [[ -e "$1" ]]; then
          xclip -selection clip < "$1"
        else
          printf "$1" | xclip -selection clip
        fi
      ;;
      Darwin)
        if [[ -e "$1" ]]; then
          pbcopy < "$1"
        else
          printf "$1" | pbcopy
        fi
      ;;
    esac
  else
    echo "Well this is embarrassing... I can only copy one file at a time."
  fi
}
