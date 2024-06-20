(define-module (manifests system)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages file)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages package-management)
  :export (system-packages))

(define system-packages
  (list git curl lsof tree file rsync ncurses
	neovim gnupg alacritty ungoogled-chromium icecat flatpak
	materia-theme papirus-icon-theme font-iosevka-term))
