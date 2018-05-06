#!/bin/sh

# test for ack installation
if test "$(which ack)"; then
  ln -sfn "${DOTFILES}/shell/ackrc" "${HOME}/.ackrc"
else
  brew install ack
  ln -sfn "${DOTFILES}/shell/ackrc" "${HOME}/.ackrc"
fi

if test "$(which youtube-dl)"; then
  mkdir -p "${HOME}/.config/youtube-dl/"
  ln -sfn "${DOTFILES}/shell/youtube-dl.conf" "${HOME}/.config/youtube-dl/config"
else
  brew install youtube-dl
  mkdir -p "${HOME}/.config/youtube-dl/"
  ln -sfn "${DOTFILES}/shell/youtube-dl.conf" "${HOME}/.config/youtube-dl/config"
fi

ln -sfn "${DOTFILES}"/shell/shenv "${HOME}/.shenv"
