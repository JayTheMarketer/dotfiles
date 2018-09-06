#!/usr/bin/env bash

# from `code --list-extensions`
extensions=(
	AndersEAndersen.html-class-suggestions
	HookyQR.minify
	P-de-Jong.vscode-html-scss
	Zignd.html-css-class-completion
	aaron-bond.better-comments
	abusaidm.html-snippets
	alefragnani.project-manager
	alexdima.copy-relative-path
	anseki.vscode-color
	castwide.solargraph
	christian-kohler.npm-intellisense
	christian-kohler.path-intellisense
	chrmarti.regex
	CoenraadS.bracket-pair-colorizer
	cssho.vscode-svgviewer
	DavidAnson.vscode-markdownlint
	dbaeumer.vscode-eslint
	deerawan.vscode-dash
	eamodio.gitlens
	ecmel.vscode-html-css
	eg2.tslint
	eg2.vscode-npm-script
	EQuimper.react-native-react-redux-snippets-for-es6-es7-version-standard
	esbenp.prettier-vscode
	felixfbecker.php-debug
	felixfbecker.php-intellisense
	formulahendry.auto-close-tag
	formulahendry.auto-rename-tag
	formulahendry.code-runner
	foxundermoon.shell-format
	humao.rest-client
	humy2833.ftp-simple
	ikappas.phpcs
	KnisterPeter.vscode-github
	lunaryorn.fish-ide
	mgmcdermott.vscode-language-babel
	minhthai.vscode-todo-parser
	mkaufman.HTMLHint
	mrmlnc.vscode-autoprefixer
	mrmlnc.vscode-scss
	ms-python.python
	ms-vscode.Go
	ms-vscode.sublime-keybindings
	msjsdiag.debugger-for-chrome
	naumovs.color-highlight
	naumovs.theme-oceanicnext
	octref.vetur
	persoderlind.vscode-phpcbf
	PeterJausovec.vscode-docker
	PKief.material-icon-theme
	pranaygp.vscode-css-peek
	rebornix.ruby
	redhat.vscode-yaml
	ritwickdey.LiveServer
	ryu1kn.partial-diff
	shardulm94.trailing-spaces
	shd101wyy.markdown-preview-enhanced
	shinnn.stylelint
	skyapps.fish-vscode
	spywhere.guides
	TimonVS.ReactSnippetsStandard
	timonwong.shellcheck
	travisthetechie.write-good-linter
	WallabyJs.quokka-vscode
	wix.vscode-import-cost
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
