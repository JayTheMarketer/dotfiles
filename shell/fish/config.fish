#######################################
#            Fisherman            #
#######################################

# Ensure fisherman and plugins are installed.
#
if not functions -q fisher
  echo "==> Installing Fisherman..."
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end


#######################################
#          Env Variables          #
#######################################

set --export EDITOR 'nvim'
set --export TERM 'screen-256color'
set --export fish_home '~/.config/fish'
set --export fish_key_bindings 'fish_vi_key_bindings'
set --export fisher_active_prompt 'bobthefish'
set --export theme_color_scheme 'dark'
set --export theme_title_display_process 'yes'


#######################################
#    Aliases (shorthand functions)   #
#######################################

alias rm 'trash -v'
alias cp 'cp -iv'
alias mv 'mv -iv'
alias mkdir 'mkdir -pv'
alias rmdir 'trash -v'
alias cpdir 'cp -aiv'
alias vim 'nvim'
alias vi 'nvim'
alias less 'less -r'
alias top 'vtop'


#######################################
#          Shell Programs          #
#######################################

# initialize rbenv
# https://github.com/rbenv/rbenv
#
status --is-interactive; and source (rbenv init -|psub)

# hub -- https://github.com/github/hub
#
if type -q hub
  eval (hub alias -s)
  complete -c hub -w git
else
  echo 'installing `hub`...'
  eval (hub alias -s)
  complete -c hub -w git
end

# pygmentize -- http://pygments.org/docs/cmdline/
#
if type -q colorize # see $DOTFILES/bin
  alias c 'colorize'
else
  alias c 'pygmentize -O style=monokai -f console256 -g'
end

# colorls -- https://github.com/athityakumar/colorls
#
if type -q colorls
  alias k 'colorls --long --almost-all --sort-dirs --git-status'
else
  echo 'installing `colorls`...'
  gem install colorls
  alias k 'colorls --long --almost-all --sort-dirs --git-status'
end

# OSX command-not-found support
# https://github.com/Homebrew/homebrew-command-not-found
#
if type -q brew
  brew command command-not-found-init >/dev/null 2>&1; and source (brew command-not-found-init)
end

# add iTerm integration
#
test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish

# keep $PATH clean
#
set PATH (perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')

#######################################
#            Local Config         #
#######################################

# Add confidential info here
#
test -e $HOME/.config/fish/local.config.fish; and source $HOME/.config/fish/local.config.fish
