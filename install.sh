#!/usr/bin/env sh

ln -sf -n $PWD/src/config/* ~/.config

ln -sf $PWD/src/gitconfig ~/.gitconfig
ln -sf $PWD/src/mailcap ~/.mailcap
ln -sf $PWD/src/profile ~/.profile
ln -sf $PWD/src/ctags ~/.ctags
ln -sf $PWD/src/bashrc ~/.bashrc
ln -sf $PWD/src/bash_profile ~/.bash_profile
ln -sf $PWD/src/Xmodmap ~/.Xmodmap

exec ./vim-plugged.sh
