#!/usr/bin/env sh

guix home reconfigure "src/guix/$(hostname)-home-config.scm"

stow -d src -t ~ home
stow -d src -t ~/.config config
