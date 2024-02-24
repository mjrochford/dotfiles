#!/usr/bin/env -S guix repl -L src/guix
!#
(use-modules (manifests home)
             (guix scripts home))
(define home-config
  (format #f "src/guix/~a-home-config.scm" (gethostname)))
(guix-home "reconfigure" home-config)
