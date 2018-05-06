#!/bin/sh

if [ -f ${HOME}/.gitconfig ]; then
	mv ${HOME}/.gitconfig ${HOME}/.gitconfig.bak
fi

ln -sfn $DOTFILES/git/gitattributes ~/.gitattributes
ln -sfn $DOTFILES/git/gitconfig ~/.gitconfig
ln -sfn $DOTFILES/git/gitignore_global ~/.gitignore_global

# Don't ask git password all the time
if [ "$(uname -s)" = "Darwin" ]; then
	git config --global credential.helper osxkeychain
else
	git config --global credential.helper cache
fi

# better diffs
if which diff-so-fancy >/dev/null 2>&1; then
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# use vscode as mergetool & difftool
if which code >/dev/null 2>&1; then
	git config --global merge.tool vscode
	git config --global mergetool.vscode.cmd "code --wait $MERGED"
	git config --global diff.tool vscode
	git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
fi

# add git-trav as a git command
if git-trav >/dev/null 2>&1; then
	git config --global alias.trav '!zsh -ic git-trav'
fi
