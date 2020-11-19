# =============================================================================
# Colors
# =============================================================================

# ANSI Color
# Attributes are in #;#;#...;#
# 0 reset, 1 bold, 4 underline, 5 flashing, 7 inverse
# Text
# 30 black, 31 red, 32 green, 33 yellow, 34 blue, 35 magenta, 36 cyan, 37 white
# Background colors are 40-47
# 100-107 are lighter variants
ANSI_RESET="\033[0;0m"
ANSI_BOLD="\033[1;1m"
ANSI_UNDERLINE="\033[4;4m"
ANSI_FLASH="\033[5;5m"
ANSI_INVERSE="\033[7;7m"

# text colors
ANSI_BLACK="\033[30;30m"
ANSI_RED="\033[31;31m"
ANSI_GREEN="\033[32;32m"
ANSI_YELLOW="\033[33;33m"
ANSI_BLUE="\033[34;34m"
ANSI_MAGENTA="\033[35;35m"
ANSI_CYAN="\033[36;36m"
ANSI_WHITE="\033[36;36m"

# background colors
ANSI_BG_BLACK="\033[40;40m"
ANSI_BG_RED="\033[41;41m"
ANSI_BG_GREEN="\033[42;42m"
ANSI_BG_YELLOW="\033[43;43m"
ANSI_BG_BLUE="\033[44;44m"
ANSI_BG_MAGENTA="\033[45;45m"
ANSI_BG_CYAN="\033[46;46m"
ANSI_BG_WHITE="\033[47;47m"

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  # c_user='\[\033[1;33m\]'
  # c_path='\[\e[0;33m\]'
  # c_git_clean='\[\e[0;36m\]'
  # c_git_dirty='\[\e[0;35m\]'
  c_user=${ANSI_CYAN}
  c_path=${ANSI_LIGHT_BLUE}
  c_git_clean=${ANSI_LIGHT_GREEN}
  c_git_dirty=${ANSI_LIGHT_RED}
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_dirty=
fi

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export CLICOLOR=1
export CLICOLOR_FORCE=1

# check for GNU dircolors
if command -v gdircolors >/dev/null; then
  alias dircolors=gdircolors
fi

if [[ -r ${HOME}/.dircolors ]]; then
  eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
else
  export LSCOLORS="exfxcxdxbxegedabagacad"
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43';
fi

# =============================================================================
# Options
# =============================================================================

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char