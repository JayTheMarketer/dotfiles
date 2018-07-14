#!/usr/bin/env bash

###############################################
###                   SUDO                  ###
###############################################

alias sudo='sudo '
alias _='sudo'
alias please='sudo'

###############################################
###                NAVIGATION               ###
###############################################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias home='cd ~'
alias old='cd ${OLDPWD}'

###############################################
###                 SHORTCUTS               ###
###############################################

alias e='${EDITOR}'
alias less='less -r'
alias which='which -a'
alias map='xargs -n1' # Intuitive map function -- i.e. list all directories with a certain file: `find . -name .gitattributes | map dirname`
alias j='jobs'
alias gh='github'
alias edit='nvim' # opens any file in Neovim
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print executable $PATH
alias cask='brew cask'
alias bitly='bitly-client'
alias help='man'
alias bell='tput bel' # Ring the terminal bell, and put a badge on Terminal.app’s Dock icon -- (useful when executing time-consuming commands)
alias psf='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias fsz='stat -f \"%z bytes\"' # File size
alias x+='chmod +x'
alias h='history'
alias https='http --default-scheme=https' # requires `HTTPie` package (brew install httpie)
alias histcount='wc -l ${HISTFILE}'
alias htop='sudo htop'
alias hosts='sudo $EDITOR /etc/hosts'
alias fix_stty='stty sane'            # Restore terminal settings when screwed up
alias clear="clear && printf '\e[3J'" # clear buffer

###############################################
###                ALTERNATES               ###
###############################################

# use nvim for vi
if which nvim >/dev/null; then
	alias vi='nvim'
	alias vim='nvim'
fi

# use micro for nano -- https://github.com/zyedidia/micro
if which micro >/dev/null; then
	alias nano='micro'
fi

# Use mmake wrapper for make -- https://github.com/tj/mmake
if which mmake >/dev/null; then
	alias make='mmake'
fi

###############################################
###                  LS                     ###
###############################################

if ! which gls >/dev/null; then
  brew install coreutils
fi

alias l="gls -lFh --color" # List all files colorized in long format
alias ls="gls -lAFh --color --group-directories-first" # ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias la="gls -la --color" # List all files colorized in long format, including dot files
alias lsd="gls -l --color | grep '^d'" # List only directories
alias lr="gls -tRFh --color" # sorted by date, recursive, show type, human readable
alias lt="gls -ltFh --color" # long list, sorted by date, show type, human readable
alias ll="gls -lh --color" # long list
alias ldot="gls -ld .* --color"
alias lS="gls -1FSsh --color"
alias lart="gls -1Fcart --color"
alias lrt="gls -1Fcrt --color"
alias lsx="gls -l *(*) --color" # Display only executables
alias lsl="gls -l *(@) --color" # Only show symlinks
alias lad="gls -d .*(/) --color" # Only show dot-directories
alias lsa="gls -a .*(.) --color" # Only show dot-files
alias lss="gls -l *(s,S,t) --color" # Only files with setgid/setuid/sticky flag

# finds sizes for current dir's sub-directories
# and lists them biggest to smallest
alias dirsize='du -shx * | sort -hr'

###############################################
###        MV, RM, CP, GUNZIP, TAR          ###
###############################################

alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias cpdir='cp -Riv'
alias mkdir='mkdir -pv'
alias rmdir='rm -rfv'
alias gunz='gunzip -k'
alias tarz='tar -k -j'

###############################################
###      CAT, GREP, CURL, WGET, AWK         ###
###############################################

alias awk='gawk'
alias grvi='grep -Rvi'
alias f.='find . | grep'
alias f:='find'
alias fn='grep -Rlvi'
alias pgr='${PAGER}'
alias grep='grep --color'
alias hgrep='fc -El 0 | grep'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias get='curl -O -L' # Download file and save it with filename of remote file
alias gurl='curl --compressed' # Gzip-enabled `curl`
alias c='colorize' # requires `$DOTFILES/bin/colorize`

###############################################
###      CAT, GREP, CURL, WGET, AWK         ###
###############################################

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
