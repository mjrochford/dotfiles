[[ -r ~/.profile ]] && source ~/.profile
[[ -r ~/.bashrc ]] && source ~/.bashrc

export EDITOR="nvim"
export BROWSER="icecat"
export MOZ_ENABLE_XINPUT2=1
command -v nvim 2>&1 >/dev/null && export MANPAGER="nvim -c :Man!"
command -v bat 2>&1 >/dev/null && export MANPAGER="bat -p -l man"

export GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
export GUIX_PROFILE=$HOME/.guix-profile
for p in $GUIX_EXTRA_PROFILES/* $GUIX_PROFILE; do
    . $p/etc/profile
done

HOME_ENVIRONMENT=$HOME/.guix-home
. $HOME_ENVIRONMENT/setup-environment
$HOME_ENVIRONMENT/on-first-login

