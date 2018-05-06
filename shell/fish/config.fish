#######################################
#              FISHERMAN              #
#######################################

# Ensure fisherman and plugins are installed.
if not type -q fisher
  echo "==> Installing Fisherman..."
  if type -q brew
    brew tap fisherman/tap
    brew install fisherman
  else
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  end

  # install fishfile
	fisher
end

#######################################
#            Env Variables            #
#######################################

set --export EDITOR 'nvim'
set --export TERM 'screen-256color'
set --export fish_home '~/.config/fish'
set --export fish_key_bindings 'fish_vi_key_bindings'
set --export fisher_active_prompt 'bobthefish'
set --export theme_color_scheme 'dark'
set --export theme_title_display_process 'yes'

#######################################
#    Aliases (shorthand functions)    #
#######################################
#
alias e 'eval $EDITOR'
alias rm 'rm -v'
alias cp 'cp -iv'
alias mv 'mv -iv'
alias mkdir 'mkdir -pv'
alias rmdir 'rm -rfv'
alias vim 'nvim'
alias vi 'nvim'
alias less 'less -r'
alias which 'which -a'
alias rgrep 'grep --recursive'
alias tree 'tree -C --dirsfirst'

#######################################
#            Shell Programs           #
#######################################

# hub
if type -q hub
  eval (hub alias -s)
  complete -c hub -w git
else
  echo "Please install 'hub' first!"
end

# pygmentize support
if type -q colorize # see $DOTFILES/bin
  alias c 'colorize'
else
  alias c 'pygmentize -O style=monokai -f console256 -g'
end

# OSX command-not-found support
# https://github.com/Homebrew/homebrew-command-not-found
if type -q brew
  brew command command-not-found-init > /dev/null 2>&1; and source (brew command-not-found-init)
end

# add iTerm integration
#
test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish


#######################################
#            Local Config             #
#######################################

# Add confidential info here
#
test -e $HOME/.config/fish/local.config.fish; and source $HOME/.config/fish/local.config.fish
