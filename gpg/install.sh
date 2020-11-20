#!/bin/sh
#
# GPG
#
# This links the core config files for GPG
#

export GNUPGHOME="$HOME/.gnupg"
ln -sf "${DOTFILES}/gpg/gpg.conf" "${GNUPGHOME}/gpg.conf"
ln -sf "${DOTFILES}/gpg/gpg-agent.conf" "${GNUPGHOME}/gpg-agent.conf"
ln -sf "${DOTFILES}/gpg/pubring.gpg" "${GNUPGHOME}/pubring.gpg"
