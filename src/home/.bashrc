prompt_pwd() { # --description "Print the current working directory, shortened to fit the prompt"
    realhome=$(echo $HOME | sed 's/\//\\\//g')
    tmp=$(echo $PWD | sed -E "s/^$realhome($|\/)/\~\1/g")

    abrev_len=1
    echo $tmp | sed -E "s/(\/?[^/]{1})[^/]*\//\1\//g"
}

set_title() {
    echo -ne "\033]0;$1\007"
}

__prompt() {
    if [ -n $(command -v tput) ]; then
        bold="\[$(tput bold)\]"
        reset="\[$(tput sgr0)\]"
        red="\[$(tput setaf 1)\]"
        green="\[$(tput setaf 2)\]"
        yellow="\[$(tput setaf 3)\]"
        blue="\[$(tput setaf 4)\]"
        purple="\[$(tput setaf 5)\]"
        lgreen="\[$(tput setaf 6)\]"
        white="\[$(tput setaf 7)\]"
        grey="\[$(tput setaf 8)\]"
        if [ $(id -u) -eq 0 ]; then
            export PS1="$reset$red`whoami` $grey@ $blue`prompt_pwd` $yellow\$$reset "
        else
            export PS1="$reset$purple`whoami`$grey @ $blue`prompt_pwd` $yellow\$$reset "
        fi
    else
        export PS1="`whoami` @ `prompt_pwd` \$ "
    fi
    set_title "bash"
}
PROMPT_COMMAND='__prompt'

vman() {
    nvim -c 'set ft=man nolist nomod' -c "Man $@"
}

gxemacs() {
    guix shell -p ~/.guix-extra-profiles/emacs -- emacs $@
}

edhome() {
    DOTFILES=$HOME/.dotfiles
    $EDITOR $DOTFILES/src/guix/$HOSTNAME-home-config.scm
    $DOTFILES/make-home.scm
}
