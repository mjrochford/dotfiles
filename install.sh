#!/bin/bash

rm -rf ~/.config/ranger ~/.config/rtv
ln -sf -n /home/matt/dotfiles/.config/* ~/.config
ln -sf -n /home/matt/dotfiles/.offlineimap/* ~/.offlineimap

rm -rf ~/.mutt/accounts
ln -sf -n /home/matt/dotfiles/.mutt/* ~/.mutt

ln -sf /home/matt/dotfiles/.bash_profile ~/.bash_profile
ln -sf /home/matt/dotfiles/.bashrc ~/.bashrc
ln -sf /home/matt/dotfiles/.gitconfig ~/.gitconfig
ln -sf /home/matt/dotfiles/.gitignore ~/.gitignore
ln -sf /home/matt/dotfiles/.mailcap ~/.mailcap
ln -sf /home/matt/dotfiles/.offlineimaprc ~/.offlineimaprc
ln -sf /home/matt/dotfiles/.profile ~/.profile
ln -sf /home/matt/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf /home/matt/dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -sf /home/matt/dotfiles/.vimrc ~/.vimrc
ln -sf /home/matt/dotfiles/.zshrc ~/.zshrc

