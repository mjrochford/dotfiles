#!/usr/bin/env -S guix repl
!#
(add-to-load-path (string-append (dirname (current-filename)) "/src/guix"))
(use-modules (manifests home)
             (guix scripts home))
(define home-config
  (format #f "~a/src/guix/~a-home-config.scm"
	  (dirname (current-filename)) (gethostname)))
(guix-home "reconfigure" home-config)
