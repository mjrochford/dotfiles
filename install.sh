#!/bin/sh

ln -sf -n $PWD/src/config ~/.config
ln -sf -n $PWD/src/mutt/* ~/.mutt

ln -sf $PWD/src/gitconfig ~/.gitconfig
ln -sf $PWD/src/mailcap ~/.mailcap
ln -sf $PWD/src/profile ~/.profile
ln -sf $PWD/src/tmux.conf ~/.tmux.conf
ln -sf $PWD/src/vimrc ~/.vimrc
ln -sf $PWD/src/ctags ~/.ctags
