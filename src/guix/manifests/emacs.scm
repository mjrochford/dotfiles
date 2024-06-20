(define-module (manifests emacs)
  #:use-module (gnu packages)
  #:export (emacs-scheme-geiser-deps
	    emacs-lsp-deps
	    emacs-default-deps))

(define-public emacs-lsp-deps
  (list "emacs-eglot"))
(define-public emacs-default-deps
  (list "emacs"
	"emacs-evil"
	"emacs-evil-leader"
	"emacs-evil-commentary"
	"emacs-evil-matchit"
	"emacs-evil-visualstar"
	"emacs-evil-collection"
	"emacs-evil-org"
	"emacs-ivy"
	"emacs-counsel"
	"emacs-company"
	"emacs-swiper"
	"emacs-which-key"
	"emacs-magit"
	"emacs-editorconfig"
	"emacs-use-package"
	"emacs-vterm"
	"emacs-base16-theme"
	"font-iosevka-term"))

(define emacs-guix-deps
  (append (list "emacs-guix") emacs-default-deps))

(define-public emacs-scheme-geiser-deps
  (append (list
	   "emacs-geiser"
	   "emacs-geiser-guile"
	   "guile"
	   "guile-gnutls")
	  emacs-default-deps))

(specifications->manifest emacs-default-deps)
