#!/usr/bin/env sh

ln -sf -n $PWD/src/config/* ~/.config

ln -sf $PWD/src/gitconfig ~/.gitconfig
ln -sf $PWD/src/mailcap ~/.mailcap
ln -sf $PWD/src/profile ~/.profile
ln -sf $PWD/src/ctags ~/.ctags

./vim-plugged.sh

