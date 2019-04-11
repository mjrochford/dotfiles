#!/bin/sh

if [[ -z ~/.config ]]; then
    mkdir ~/.config
fi

if [[ -z ~/.config/nvim ]]; then
    mkdir ~/.config/nvim/
fi

if [[ -z ~/.config/bspwm ]]; then
    mkdir ~/.config/bspwm/
fi

if [[ -z ~/.config/sxhkd ]]; then
    mkdir ~/.config/sxhkd/
fi

if [[ -z ~/.mutt ]]; then
    mkdir ~/.mutt
fi

rm -rf ~/.config/ranger ~/.config/rtv
rm -rf ~/.mutt/accounts

ln -sf -n $PWD/src/config/* ~/.config
ln -sf -n $PWD/src/mutt/* ~/.mutt
ln -sf $PWD/src/config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf $PWD/src/config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

ln -sf $PWD/src/bash_profile ~/.bash_profile
ln -sf $PWD/src/bashrc ~/.bashrc
ln -sf $PWD/src/gitconfig ~/.gitconfig
ln -sf $PWD/src/gitignore ~/.gitignore
ln -sf $PWD/src/mailcap ~/.mailcap
ln -sf $PWD/src/profile ~/.profile
ln -sf $PWD/src/tmux.conf ~/.tmux.conf
ln -sf $PWD/src/tmux.conf.local ~/.tmux.conf.local
ln -sf $PWD/src/vimrc ~/.vimrc
ln -sf $PWD/src/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/src/zshrc ~/.zshrc
ln -sf $PWD/src/ctags ~/.ctags
