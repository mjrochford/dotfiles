#!/usr/bin/env sh

export EDITOR="nvim"
export BROWSER="icecat"
export MOZ_ENABLE_XINPUT2=1
command -v bat 2>&1 >/dev/null && export MANPAGER="bat -p -l man"

export GUIX_PROFILE=$HOME/.guix-profile
if [ -e $GUIX_PROFILE ]; then
    . $GUIX_PROFILE/etc/profile
fi
