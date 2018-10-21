#!/bin/sh

# Profile file. Runs on login.

export PATH="$PATH:$HOME/Projects/bin"
export EDITOR="vim"

[ -f ~/.bashrc ] && source ~/.bashrc
