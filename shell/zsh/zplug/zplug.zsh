#!/usr/bin/env zsh

# Check if zplug is installed and then source
if [[ ! -d "${ZPLUG_HOME}" ]]; then
	source "${DOTFILES}/shell/zsh/zplug/install.sh"
	source "${ZPLUG_HOME}/init.zsh"
else
	source "${ZPLUG_HOME}/init.zsh"
fi

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -rq; then
        echo; zplug install
    fi
fi

# Source packages and add commands to $PATH
zplug load


# ============================================================================ #
#                                 PLUGIN CONFIGS                               #
# ============================================================================ #

# Prompt
if ZSH_THEME="spaceship"; then

  SPACESHIP_PROMPT_ORDER=(
    time          # Time stampts section
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubecontext   # Kubectl context section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )

  # PROMPT CHAR
  SPACESHIP_CHAR_SYMBOL='λ '

  # USER
  SPACESHIP_USER_PREFIX="" # remove `with` before username
  SPACESHIP_USER_SUFFIX="" # remove space after username

  # HOST
  # Result will look like this:
  #   username@:(hostname)
  SPACESHIP_HOST_PREFIX="@"

fi

# ZNT
if zplug check "psprint/zsh-navigation-tools"; then
  autoload znt-history-widget
  zle -N znt-history-widget
  bindkey "^R" znt-history-widget
fi

# TIPZ
if zplug check "molovo/tipz"; then
  export TIPZ_TEXT='💡  '
fi

# History-Substring-Search
if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  # VI-Mode
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

# ZSH-Autosuggestions
if zplug check "zsh-users/zsh-autosuggestions"; then
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
fi
