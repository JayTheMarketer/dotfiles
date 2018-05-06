#!/usr/bin/env zsh

autoload -Uz compinit
compinit -i

zmodload zsh/complist

# See http://zsh.sourceforge.net/Doc/Release/Options.html.

# =============================================================================
# Changing Directories
# =============================================================================

# If a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# Have pushd with no arguments act like ‘pushd $HOME’.
setopt pushd_to_home

# =============================================================================
# Expansion / Globbing
# =============================================================================

# treat #, ~, and ^ as part of patterns for filename generation
setopt extended_glob

# Do not require a leading ‘.’ in a filename to be matched explicitly.
setopt glob_dots

# Allow the short forms of for, repeat, select, if, and function constructs.
setopt short_loops

# =============================================================================
# Job Control
# =============================================================================

# Treat single word simple commands without redirection as candidates for resumption of an existing job.
setopt auto_resume

# Don't run all background jobs at a lower priority.
setopt no_bg_nice

# Report the status of background and suspended jobs before exiting a shell with job control;
# a second attempt to exit the shell will succeed.
# NO_CHECK_JOBS is best used only in combination with NO_HUP, else such jobs will be killed automatically.
setopt no_check_jobs

# don't send the HUP signal to running jobs when the shell exits
setopt no_hup

# List jobs in the long format by default.
setopt long_list_jobs

# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt notify

# =============================================================================
# Prompting
# =============================================================================

# If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts.
# Substitutions within prompts do not affect the command status.
setopt prompt_subst

# =============================================================================
# Scripts / Functions
# =============================================================================

# If this option is set at the point of return from a shell function, most options (including this one) which were in force upon entry to the function are restored;
# options that are not restored are PRIVILEGED and RESTRICTED.
setopt local_options

# If this option is set when a signal trap is set inside a function, then the previous status of the trap for that signal will be restored when the function exits.
setopt local_traps

# =============================================================================
# History
# =============================================================================

# If this is set, zsh sessions will append their history list to the history file, rather than replace it.
setopt append_history

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
setopt extended_history

# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate
# to be lost before losing a unique event from the list.
setopt hist_expire_dups_first

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous.
setopt hist_find_no_dups

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt hist_ignore_dups

# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt hist_ignore_space

# Remove superfluous blanks from each command line being added to the history list.
setopt hist_reduce_blanks

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt hist_save_no_dups

# Whenever the user enters a line with history expansion, don't execute the line directly;
# instead, perform history expansion and reload the line into the editing buffer.
setopt hist_verify

# This options works like APPEND_HISTORY except that new history lines are added
# to the $HISTFILE incrementally (as soon as they are entered), rather than
# waiting until the shell exits.
setopt inc_append_history

# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file
setopt share_history

# Better history -- credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# =============================================================================
# Input/Output
# =============================================================================

# Try to correct the spelling of commands.
# Note that, when the HASH_LIST_ALL option is not set or when some directories in the path are not readable,
# this may falsely report spelling errors the first time some commands are used.
setopt correct

# If this option is unset, output flow control via start/stop characters
# (usually assigned to ^S/^Q) is disabled in the shell's editor.
setopt no_flow_control

# Allow comments even in interactive shells.
setopt interactive_comments

# Perform a path search even on command names with slashes in them.
setopt path_dirs

# alt-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
LBUFFER+="$(eval $history[$((histCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

# =============================================================================
# ZLE
# =============================================================================

# Combine zero-length punctuation characters (accents) with the base character.
# If this option is not set, zero-width characters are displayed separately with special mark-up.
setopt combining_chars

# Don't print a warning message if a mail file has been accessed since the shell last checked.
setopt no_mail_warning

# Allow the character sequence `''` to signify a single quote within singly quoted strings.
# Note this does not apply in quoted strings using the format $'...', where a backslashed single quote can be used.
setopt rc_quotes

# Smart URLs
autoload -Uz is-at-least
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# =============================================================================
# Completion
# =============================================================================

#
# Options
#

# If a completion is performed with the cursor within a word, and a full
# completion is inserted, the cursor is moved to the end of the word.
setopt always_to_end

# Automatically list choices on an ambiguous completion.
setopt auto_list

# Automatically use menu completion after the second consecutive request for completion,
# for example by pressing the tab key repeatedly.
setopt auto_menu

# If a parameter is completed whose content is the name of a directory,
# then add a trailing slash instead of a space.
setopt auto_param_slash

# Prevents aliases on the command line from being internally substituted before completion is attempted.
# The effect is to make the alias a distinct command for completion purposes.
setopt complete_aliases

# If unset, the cursor is set to the end of the word if completion is started.
# Otherwise it stays there and completion is done from both ends.
setopt complete_in_word

# Don't beep on an ambiguous completion.
setopt no_list_beep

# Whenever a command completion or spelling correction is attempted, make sure the entire command path is hashed first.
# This makes the first completion slower but avoids false reports of spelling errors.
setopt hash_list_all

# On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately.
# Then when completion is requested again, remove the first match and insert the second match, etc.
# When there are no more matches, go back to the first one again. reverse-menu-complete may be used to loop through the list in the other direction.
setopt no_menu_complete

#
# Styles
#

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZPLUG_HOME:-$HOME}/.zcompcache"

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate _prefix
zstyle ':completion:*' add-space true

# Try smart-case completion, then case-insensitive, then partial-word, and then
# substring completion.
# See http://zsh.sourceforge.net/Doc/Release/Completion-Widgets.html#Completion-Matching-Control.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Z}{a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
if [ -z "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43';
else
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# List all processes for killall
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

# Process completion shows all processes with colors
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command 'ps -A -o pid,user,cmd'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# Media Players
zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

# Mutt
if [[ -s "$HOME/.mutt/aliases" ]]; then
  zstyle ':completion:*:*:mutt:*' menu yes select
  zstyle ':completion:*:mutt:*' users ${${${(f)"$(<"$HOME/.mutt/aliases")"}#alias[[:space:]]}%%[[:space:]]*}
fi

# format on completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# describe options in full
zstyle ':completion:*:options' description 'yes'

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path \
/usr/local/sbin \
/usr/local/bin \
/usr/sbin \
/usr/bin \
/sbin \
/bin \
/usr/X11R6/bin

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

#### SSH/SCP/RSYNC ###
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# host completion
_ssh_config_hosts=()
_ssh_hosts=()
_etc_hosts=()
hosts=(
  $(hostname)
  "$_ssh_config_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# SSH usernames
if [[ -f ~/.ssh/config ]]; then
  _accounts=(`egrep "^User" ~/.ssh/config | sed s/User\ // | egrep -v '^\*$'`)
  zstyle ':completion:*:users' users $_accounts
fi

# Colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Display message when no matches are found
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# Grouping for completion types (trial)
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format "%{${fg_bold[magenta]}%}= %d =%{$reset_color%}"
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' group-name ""

# Speedup path completion
zstyle ':completion:*' accept-exact '*(N)'

# Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# Shift-Tab: Perform menu completion, like menu-complete, except that if a menu
# completion is already in progress, move to the previous completion rather than
# the next.
# See http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Completion.
[ -n "${terminfo[kcbt]}" ] && bindkey "${terminfo[kcbt]}" reverse-menu-complete
