#!/usr/bin/env bash

for file in ${DOTFILES}/**/aliases.sh; do
  source $file
done
