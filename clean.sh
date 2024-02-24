#!/usr/bin/env sh

for file in src/home/.config/*;do
    rm -i $XDG_CONFIG_HOME/$(basename $file)
done
for file in src/home/.*;do
    rm  -i $HOME/$(basename $file)
done
