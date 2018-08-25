#!/usr/bin/env bash

# from `code --list-extensions`
extensions=(
	AndersEAndersen.html-class-suggestions
	HookyQR.minify
	P-de-Jong.vscode-html-scss
	TeddyDD.fish
	Zignd.html-css-class-completion
	aaron-bond.better-comments
	abusaidm.html-snippets
	alefragnani.project-manager
	alexdima.copy-relative-path
	anseki.vscode-color
	castwide.solargraph
	christian-kohler.npm-intellisense
	christian-kohler.path-intellisense
	CoenraadS.bracket-pair-colorizer
	cssho.vscode-svgviewer
	DavidAnson.vscode-markdownlint
	dbaeumer.vscode-eslint
	deerawan.vscode-dash
	eamodio.gitlens
	ecmel.vscode-html-css
	eg2.vscode-npm-script
	esbenp.prettier-vscode
	felixfbecker.php-debug
	felixfbecker.php-intellisense
	formulahendry.auto-close-tag
	formulahendry.auto-rename-tag
	formulahendry.code-runner
	foxundermoon.shell-format
	ikappas.phpcs
	KnisterPeter.vscode-github
	lunaryorn.fish-ide
	mgmcdermott.vscode-language-babel
	mkaufman.HTMLHint
	mrmlnc.vscode-autoprefixer
	mrmlnc.vscode-scss
	ms-python.python
	ms-vscode.sublime-keybindings
	msjsdiag.debugger-for-chrome
	naumovs.color-highlight
	naumovs.theme-oceanicnext
	octref.vetur
	PeterJausovec.vscode-docker
	PKief.material-icon-theme
	pranaygp.vscode-css-peek
	rebornix.ruby
	redhat.vscode-yaml
	ritwickdey.LiveServer
	ryu1kn.partial-diff
	shardulm94.trailing-spaces
	shd101wyy.markdown-preview-enhanced
	skyapps.fish-vscode
	spywhere.guides
	timonwong.shellcheck
	travisthetechie.write-good-linter
	WallabyJs.quokka-vscode
	xabikos.JavaScriptSnippets
)

for variant in "code" "code-insiders"; do
	if hash $variant 2>/dev/null; then
		echo "Installing ${#extensions[@]} extensions for $variant"
		for extension in "${extensions[@]}"; do
			"$variant" --install-extension "$extension"
		done
	fi
done
