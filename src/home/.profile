#!/usr/bin/env sh

export EDITOR="nvim"
export BROWSER="firefox"
export MOZ_ENABLE_XINPUT2=1

export GUIX_PROFILE=$HOME/.guix-profile
if [ -e $GUIX_PROFILE ]; then
    . $GUIX_PROFILE/etc/profile
fi
