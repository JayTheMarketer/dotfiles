#!/usr/bin/env zsh
#
# Set up hub wrapper for git, if it is available; http://github.com/github/hub
if [ "$commands[(I)hub]" ]; then
  if hub --version &>/dev/null; then
    eval $(hub alias -s zsh)
    export GITHUB_USER=$(git config user.name)
  fi
fi
