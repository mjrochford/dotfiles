(define-module (manifests emacs-clojure)
  #:use-module (gnu packages)
  #:use-module (manifests emacs))
(specifications->manifest
 (append emacs-default-deps
	 (list
	  "clojure"
	  "clojure-tools"
	  "emacs-clojure-mode"
	  "emacs-cider")))
