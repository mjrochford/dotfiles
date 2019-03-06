#!/bin/bash


if [[ -z ~/.config ]]; then mkdir ~/.config
fi

if [[ -z ~/.config/nvim ]]; then mkdir ~/.config/nvim/
fi

if [[ -z ~/.mutt ]]; then mkdir ~/.mutt
fi

rm -rf ~/.config/ranger ~/.config/rtv
ln -sf -n $HOME/dotfiles/config/* ~/.config
ln -sf -n $HOME/dotfiles/offlineimap/* ~/.offlineimap

rm -rf ~/.mutt/accounts
ln -sf -n $HOME/dotfiles/mutt/* ~/.mutt

ln -sf $HOME/dotfiles/bash_profile ~/.bash_profile
ln -sf $HOME/dotfiles/bashrc ~/.bashrc
ln -sf $HOME/dotfiles/gitconfig ~/.gitconfig
ln -sf $HOME/dotfiles/gitignore ~/.gitignore
ln -sf $HOME/dotfiles/mailcap ~/.mailcap
ln -sf $HOME/dotfiles/offlineimaprc ~/.offlineimaprc
ln -sf $HOME/dotfiles/profile ~/.profile
ln -sf $HOME/dotfiles/tmux.conf ~/.tmux.conf
ln -sf $HOME/dotfiles/tmux.conf.local ~/.tmux.conf.local
ln -sf $HOME/dotfiles/vimrc ~/.vimrc
ln -sf $HOME/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf $HOME/dotfiles/zshrc ~/.zshrc
ln -sf $HOME/dotfiles/ctags ~/.ctags
