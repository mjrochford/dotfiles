#          | |              
#   _______| |__  _ __ ___  
#  |_  / __| '_ \| '__/ __| 
#   / /\__ \ | | | | | (__  
# ./___|___/_| |_|_|  \___| 
# Matt Rochford

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh//plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------
# Variables
# ---------

export BROWSER="google-chrome"
export EDITOR="vim"
export PATH="${PATH}:${HOME}/Projects/bin"

autoload -Uz compinit promptinit
compinit
promptinit

HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=10000

alias ll="ls -lh --group-directories-first --color=auto"
alias la="ll -a"

alias yt="youtube-dl -cn --add-metadata"
alias yta="yt -x --audio-format mp3"

alias start-mac="~/MacOs/start-mac.sh"


#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Window title
#------------------------------
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;[%n@%M][%~]%#\a"
    }
    preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
    ;;
  screen|screen-256color)
    precmd () {
      vcs_info
      print -Pn "\e]83;title \"$1\"\a"
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
    }
    preexec () {
      print -Pn "\e]83;title \"$1\"\a"
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
    }
    ;;
esac

#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{cyan}%s%f %F{green}[%f%F{cyan}%b %m|%u|%c%f%F{green}]%f"

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{cyan}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %(!.%F{red}%n%f.%F{cyan}%n%f)
    %F{green}@%f
    ${p_host} 
    " "
    %F{yellow}#%f
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'%F{green}[%f%F{cyan}%2~%f%F{green}]%f ${vcs_info_msg_0_}'
}
setprompt


