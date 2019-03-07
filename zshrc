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

export BROWSER="google-chrome-stable"
export EDITOR="nvim"
export PATH="${PATH}:${HOME}/Projects/bin"

export CSE="$HOME/Documents/CSE142/code"
export PROJ="$HOME/Projects"
export HHH="$PROJ/HHH Scheduler"

export TERM=screen-256color

autoload -Uz compinit promptinit
compinit
promptinit

setopt HIST_IGNORE_SPACE
HISTFILE=$HOME/.zsh/histfile
HISTSIZE=1000
SAVEHIST=10000

# ---------
# Vi Mode
# ---------
bindkey -v

alias vim="nvim"
alias mutt="neomutt"

alias q="exit"
alias weather="date; curl 'wttr.in?0'"
alias weather_help="curl 'wttr.in/:help'"


alias ll="ls -lh --group-directories-first --color=always"
alias la="ll -a"

alias grep="grep --color=always"
alias diff="diff -e --color=always"

alias ytw="mpv --ytdl-format=bestvideo+bestaudio/best"
alias ytd="youtube-dl -cn --add-metadata"
alias ytda="ytd -x --audio-format mp3"

alias pomo_short='sleep 1500 && notify-send "break"; sleep 300 && notify-send "back to work"'
alias pomo_long='sleep 1500 && notify-send "break"; sleep 900 && notify-send "back to work"'

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man () {
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

dev-tmux () {
  cwd=$1
  if [[ -z $1 ]]; then
    cwd=.
  fi

  tmux kill-session -t dev > /dev/null
  tmux new-session -c $cwd -s dev "$EDITOR" \; \
   split-window -h \; \
   resize-pane -R 25
}

twitch () {

  mpv "https://twitch.tv/$1" &

}

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

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
c1="cyan"
c2="green"
c3="yellow"
c4="blue"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{$c1}%s%f %F{$c2}[%f%F{$c1}(%b) (%m)(%u)(%c)%f%F{$c2}]%f"

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
    p_host='%F{$c4}%M%f'
  else
    p_host='%F{$c1}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %(!.%F{$c2}%n%f.%F{$c1}%n%f)
    %F{$c2}@%f
    ${p_host}
    " "
    %F{$c3}#%f
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'%F{$c2}[%f%F{$c1}%2~%f%F{$c2}]%f ${vcs_info_msg_0_}'
}
setprompt