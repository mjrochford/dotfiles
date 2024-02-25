#!/usr/bin/env sh

if [ $INSTALL_LAZY ] && [ -n $(command -v git) ]; then
    lazy_dir=$XDG_DATA_HOME/nvim/lazy
    mkdir -p $lazy_dir/lazy.nvim
    git clone https://github.com/folke/lazy.nvim $lazy_dir/lazy.nvim
fi

# TODO source build possible? BSD possible?
# https://ftpmirror.gnu.org/gnu/guix/guix-1.4.0.tar.gz
# https://ftpmirror.gnu.org/gnu/guix/guix-1.4.0.tar.gz.sig
if [ $INSTALL_GUIX ] && [ -n $(command -v wget) ]; then
    pushd /tmp
    wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
    chmod +x guix-install.sh
    sudo ./guix-install.sh
    popd
fi

if [ -n $(command -v guix) ]; then
    ./make-home.scm
else
    echo "Guix not found try running \`INSTALL_GUIX=1 $0\`"
fi

