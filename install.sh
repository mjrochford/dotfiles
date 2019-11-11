#!/bin/sh

ln -sf $PWD/src/tmux.conf ~/.tmux.conf
ln -sf $PWD/src/tmux.conf.local ~/.tmux.conf.local
ln -sf $PWD/src/vimrc ~/.vimrc
mkdir --parents ~/.config/nvim
ln -sf $PWD/src/init.vim ~/.config/nvim/init.vim
