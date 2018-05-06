#!/usr/bin/env zsh

# Set gnupg location
export GNUPGHOME="$HOME/.gnupg"

# Enable gpg-agent if it is not running
GPG_AGENT_SOCKET="${GNUPGHOME}/S.gpg-agent.ssh"
if [ ! -S $GPG_AGENT_SOCKET ]; then
  gpg-agent --daemon >/dev/null 2>&1
  export GPG_TTY=$(tty)
fi

# Set SSH to use gpg-agent if it is configured to do so
GNUPGCONFIG="${GNUPGHOME}/gpg-agent.conf"
if [ -r "$GNUPGCONFIG" ] && grep -q enable-ssh-support "$GNUPGCONFIG"; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK=$GPG_AGENT_SOCKET
fi

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null
