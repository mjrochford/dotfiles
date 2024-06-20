(define-module (manifests emacs-elixir)
  #:use-module (gnu packages)
  #:use-module (manifests emacs))

(define-public emacs-elixir-deps
  (append emacs-default-deps
	  (list "emacs-elixir-mode"
		"emacs-alchemist"
		"emacs-erlang"
		"erlang"
		"elixir"
		"elixir-hex")))
(specifications->manifest emacs-elixir-deps)
