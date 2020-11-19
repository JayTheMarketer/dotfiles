#!/usr/bin/env bash

# GRC colorizes nifty unix tools all over the place
# brew install grc on OS X to check it out.
if ! type grc >/dev/null; then
  brew install grc
fi

[[ -f $(brew --prefix)/etc/grc.bashrc ]] && source $(brew --prefix)/etc/grc.bashrc

if [ "$TERM" != dumb ] && builtin type -p grc >/dev/null 2>&1; then
  alias colorify="grc -es --colour=auto"

  # Use functions so we can still take advantage of ZSH completion functions

  function as(){
    \grc --colour=auto /usr/bin/as "$@"
  }

  function diff(){
    \grc --colour=auto /usr/bin/diff "$@"
  }

  if [ -x /usr/bin/dig ]; then
    function dig(){
      \grc --colour=auto /usr/bin/dig "$@"
    }
  fi

  if [ -x /usr/bin/gas ]; then
    function gas(){
      \grc --colour=auto /usr/bin/gas "$@"
    }
  fi

  if [ -x /usr/bin/gcc ]; then
    function gcc(){
      \grc --colour=auto /usr/bin/gcc "$@"
    }
  fi

  if [ -x /usr/bin/g++ ]; then
    function g++(){
      \grc --colour=auto /usr/bin/g++ "$@"
    }
  fi

  if [ -x /usr/bin/last ]; then
    function last(){
      \grc --colour=auto /usr/bin/last "$@"
    }
  fi

  if [ -x /usr/bin/ld ]; then
    function ld(){
      \grc --colour=auto /usr/bin/ld "$@"
    }
  fi

  if [ -x /sbin/ifconfig ]; then
    function ifconfig(){
      \grc --colour=auto /sbin/ifconfig "$@"
    }
  fi

  # mount was in primordial Unix, but OS X and Linux have it in different paths.
  if [ -x /bin/mount ]; then
    function mount(){
      \grc --colour=auto /bin/mount "$@"
    }
  fi
  if [ -x /sbin/mount ]; then
    function mount(){
      \grc --colour=auto /sbin/mount "$@"
    }
  fi

  # OS X and Linux have different paths to mtr
  if [ -x /usr/local/sbin/mtr ]; then
    function mtr(){
      \grc --colour=auto /usr/local/sbin/mtr "$@"
    }
  fi
  if [ -x /usr/sbin/mtr ]; then
    function mtr(){
      \grc --colour=auto /usr/sbin/mtr "$@"
    }
  fi

  # OS X and Linux have different paths to netstat
  if [ -x /usr/sbin/netstat ]; then
    function netstat(){
      \grc --colour=auto /usr/sbin/netstat "$@"
    }
  fi
  if [ -x /bin/netstat ]; then
    function netstat(){
      \grc --colour=auto /bin/netstat "$@"
    }
  fi

  # OS X and Linux have different paths to ping, of course
  if [ -x /sbin/ping ]; then
    function ping(){
      \grc --colour=auto /sbin/ping "$@"
    }
  fi
  if [ -x /sbin/ping6 ]; then
    function ping6(){
      \grc --colour=auto /sbin/ping6 "$@"
    }
  fi
  if [ -x /bin/ping ]; then
    function ping(){
      \grc --colour=auto /bin/ping "$@"
    }
  fi

  if [ -x /bin/ps ]; then
    function ps(){
      \grc --colour=auto /bin/ps "$@"
    }
  fi

  # OS X and Linux have different paths to traceroute
  if [ -x /usr/sbin/traceroute ]; then
    function traceroute(){
      \grc --colour=auto /usr/sbin/traceroute "$@"
    }
  fi
  if [ -x /bin/traceroute ]; then
    function traceroute(){
      \grc --colour=auto /bin/traceroute "$@"
    }
  fi
  # OS X and Linux have different paths to traceroute6 too
  if [ -x /usr/sbin/traceroute6 ]; then
    function traceroute6(){
      \grc --colour=auto /usr/sbin/traceroute6 "$@"
    }
  fi
  if [ -x /bin/traceroute6 ]; then
    function traceroute6(){
      \grc --colour=auto /bin/traceroute6 "$@"
    }
  fi
fi
