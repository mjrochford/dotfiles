(define-module (mdesk-home-config)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu system shadow)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu packages version-control)
  #:use-module (manifests home))

(define home-config
  (home-environment
    (packages home-packages)
    (services
      (list
        (service home-fish-service-type)
	(service home-dotfiles-service-type
		(home-dotfiles-configuration
		(directories (list "../home"))))))))

home-config
