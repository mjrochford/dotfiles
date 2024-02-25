(define-module (manifests home)
  #:use-module (guix profiles)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages video)
  #:use-module (gnu packages pdf)
  #:export (home-packages))

(define home-packages
  (list ripgrep bat
	python python-ipython
	mpv yt-dlp
	zathura zathura-pdf-poppler))
(packages->manifest home-packages)
