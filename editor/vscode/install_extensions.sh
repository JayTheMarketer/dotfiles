#!/bin/sh

# from `code --list-extensions`
extensions=(
  AndersEAndersen.html-class-suggestions
  CoenraadS.bracket-pair-colorizer
  DavidAnson.vscode-markdownlint
  EditorConfig.EditorConfig
  HookyQR.minify
  KnisterPeter.vscode-github
  P-de-Jong.vscode-html-scss
  PKief.material-icon-theme
  PeterJausovec.vscode-docker
  Zignd.html-css-class-completion
  aaron-bond.better-comments
  abusaidm.html-snippets
  akamud.vscode-theme-onedark
  alefragnani.Bookmarks
  alefragnani.project-manager
  alexdima.copy-relative-path
  anseki.vscode-color
  attilabuti.vscode-mjml
  axosoft.gitkraken-glo
  bierner.color-info
  bmewburn.vscode-intelephense-client
  castwide.solargraph
  cdsama.shell-snippets
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  cssho.vscode-svgviewer
  dbaeumer.vscode-eslint
  deerawan.vscode-dash
  digitalstreamio.mjml-syntax
  donjayamanne.jquerysnippets
  DotJoshJohnson.xml
  dzannotti.vscode-babel-coloring
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
  hdg.live-html-previewer
  idleberg.icon-fonts
  ikappas.phpcs
  jinsihou.diff-tool
  lunaryorn.fish-ide
  mkaufman.HTMLHint
  mrmlnc.vscode-autoprefixer
  mrmlnc.vscode-scss
  ms-mssql.mssql
  ms-python.python
  ms-vscode.Go
  ms-vscode.sublime-keybindings
  msjsdiag.debugger-for-chrome
  naumovs.color-highlight
  octref.vetur
  persoderlind.vscode-phpcbf
  pranaygp.vscode-css-peek
  rebornix.Ruby
  redhat.vscode-yaml
  ritwickdey.LiveServer
  ryu1kn.partial-diff
  shardulm94.trailing-spaces
  shd101wyy.markdown-preview-enhanced
  spywhere.guides
  tanato.vscode-gulp
  thekalinga.bootstrap4-vscode
  timonwong.shellcheck
  tungvn.wordpress-snippet
  vilicvane.es-quotes
  WallabyJs.quokka-vscode
  wayou.vscode-todo-highlight
  wmaurer.change-case
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

