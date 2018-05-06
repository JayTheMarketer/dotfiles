#!/bin/sh

if which rbenv >/dev/null; then

  RUBYPATH="$HOME/.rbenv/shims"

  __rbenv_started=0

  __rbenv_init() {
  	test $__rbenv_started = 0 && {
  		eval "$(command rbenv init -)"
  		__rbenv_started=1
  	}
  }

  rbenv() {
  	__rbenv_init
  	command rbenv "$@"
  }

  ruby() {
  	__rbenv_init
  	command ruby "$@"
  }

  rake() {
  	__rbenv_init
  	command rake "$@"
  }

  bundle() {
  	__rbenv_init
  	command bundle "$@"
  }

  gem() {
  	__rbenv_init
  	command gem "$@"
  }

else
  RUBYPATH="/usr/bin/ruby"
fi

echo $PATH | grep -q $RUBYPATH || export PATH=$RUBYPATH:$PATH
