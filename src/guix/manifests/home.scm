(define-module (manifests home)
  #:use-module (guix profiles)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages video)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages man)
  #:export (home-packages))

(define home-packages
  (list man-db ripgrep bat
	python python-ipython
	mpv yt-dlp
        lua5.2-socket lua5.2-filesystem
	zathura zathura-pdf-poppler))
(packages->manifest home-packages)
