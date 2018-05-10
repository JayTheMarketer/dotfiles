#!/bin/sh

# Add Composer's global binaries to PATH
if command -v pyenv >/dev/null; then

  PYTHONPATH=${HOME}/.pyenv/shims

  __pyenv_started=0

  __pyenv_init() {
  	test $__pyenv_started = 0 && {
  		eval "$(command pyenv init -)"
  		__pyenv_started=1
  	}
  }

  pyenv() {
  	__pyenv_init
  	command pyenv "$@"
  }

  python() {
  	__pyenv_init
  	command python "$@"
  }

  pip() {
  	__pyenv_init
  	command pip "$@"
  }

else
  PYTHONPATH="$BREWBIN"
fi

echo $PATH | grep -q $PYTHONPATH || export PATH=$PYTHONPATH:$PATH
