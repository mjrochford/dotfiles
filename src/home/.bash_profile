export EDITOR="nvim"
export BROWSER="icecat"
export MOZ_ENABLE_XINPUT2=1
command -v nvim 2>&1 >/dev/null && export MANPAGER="nvim -c :Man!"
command -v bat 2>&1 >/dev/null && export MANPAGER="bat -p -l man"
export PATH="${PATH}:${HOME}/.local/bin"

export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:${HOME}/.local/share/flatpak/exports/share"

export GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
export GUIX_PROFILE=$HOME/.guix-profile
for p in $GUIX_PROFILE; do
    . $p/etc/profile
done
