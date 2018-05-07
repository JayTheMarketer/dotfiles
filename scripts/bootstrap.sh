#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}" && pwd)"

cd "${BASEDIR}"
git submodule update --init --recursive

mkdir -p ~/.config/fish ~/.config/ranger ~/.config/youtube-dl ~/.config/brewfile ~/.gnupg

ln -sfn "bin" "~/bin"
ln -sfn "editor/editorconfig" "~/.editorconfig"
ln -sfn "editor/vim" "~/.config/nvim"
ln -sfn "editor/vscode/settings.json" "~/Library/Application Support/Code/User/settings.json"
ln -sfn "editor/vscode/keybindings.json" "~/Library/Application Support/Code/User/keybindings.json"
ln -sfn "editor/vscode/snippets" "~/Library/Application Support/Code/User/snippets"
ln -sfn "git/gitconfig" "~/.gitconfig"
ln -sfn "git/gitignore_global" "~/.gitignore_global"
ln -sfn "git/gitattributes" "~/.gitattributes"
ln -sfn "gpg/gpg.conf" "~/.gnupg/gpg.conf"
ln -sfn "gpg/pubring.gpg" "~/.gnupg/pubring.gpg"
ln -sfn "homebrew/Brewfile" "~/.config/brewfile/Brewfile"
ln -sfn "php/composer.json" "~/.composer/composer.json"
ln -sfn "ranger" "~/.config/ranger"
ln -sfn "shell/ackrc" "~/.ackrc"
ln -sfn "shell/dircolors" "~/.dircolors"
ln -sfn "shell/shenv" "~/.shenv"
ln -sfn "shell/youtube-dl.conf" "~/.config/youtube-dl/config"
ln -sfn "shell/bash/bashrc" "~/.bashrc"
ln -sfn "shell/bash/bash_profile" "~/.bash_profile"
ln -sfn "shell/zsh/zshrc" "~/.zshrc"
ln -sfn "shell/zsh/zshenv" "~/.zshenv"
ln -sfn "shell/fish/fish.config" "~/.config/fish/fish.config"
ln -sfn "shell/fish/fishfile" "~/.config/fish/fishfile"
ln -sfn "shell/fish/functions" "~/.config/fish/functions"
ln -sfn "ssh/config" "~/.ssh/config"

"echo \"Installing submodules\" && git submodule update --init --recursive"
"echo \"Symlinking vim to neovim\" && ln -sFn \"~/.config/nvim\" \"~/.vim\""
"echo \"Installing VSCode extensions\" && source \"editor/vscode/install_extensions.sh\""
"echo \"Installing Golang\" && source \"golang/install.sh\""
"echo \"Installing Tmux config\" && source \"tmux/tmux-config/install.sh\""
