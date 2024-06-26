#!/usr/bin/env -S guix repl
!#
(define dots-root (dirname (current-filename)))
(add-to-load-path (string-append dots-root "/src/guix"))
(use-modules (manifests system)
             (guix scripts system))
(define vm-name "vlsi")
(define system-config
  (format #f "~a/src/guix/~a-system-config.scm"
	  dots-root vm-name))
(guix-system "vm" system-config)
