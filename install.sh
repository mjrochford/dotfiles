#!/usr/bin/env bash

# Links the first argument as a dotfile in the user's home dir
linkDotfile() {
    ln -sf $1 ~/.$(basename $1)
}
export -f linkDotfile

for item in $PWD/src/home/*; do
    linkDotfile $item
done

ln -sf -n $PWD/src/config/* ~/.config

exec ./vim-plugged.sh

unset linkDotfile
