#!/usr/bin/env bash

export ZPLUG_HOME="${HOME}/.zplug"

# Check if zplug is installed and then source
if ! which zplug >/dev/null; then
  brew install zplug
else
  brew upgrade zplug
fi

ln -sFn "/usr/local/opt/zplug" "$ZPLUG_HOME"
ln -sf "${DOTFILES}/shell/zsh/zplug/packages.zsh" "${ZPLUG_HOME}/packages.zsh"
ln -sf "${DOTFILES}/shell/zsh/zplug/zplug.zsh" "${ZPLUG_HOME}/zplug.zsh"
