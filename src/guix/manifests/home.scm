(define-module (manifests home)
  #:use-module (gnu packages)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages file)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages video)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages ncurses)
  #:use-module (guix profiles)
  #:export (home-packages))

(define home-packages
    (list git curl lsof stow tree file rsync ncurses
		ripgrep bat alacritty
		ungoogled-chromium
		python python-ipython mpv yt-dlp
		zathura zathura-pdf-poppler
		materia-theme papirus-icon-theme font-iosevka-term
		flatpak))
(packages->manifest home-packages)
