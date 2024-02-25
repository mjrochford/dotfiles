(define-module (mlap-home)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu system shadow)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu packages version-control)
  #:use-module (manifests home)
  #:export (%mlap-home-config))

(define %mlap-home-config
  (home-environment
   (packages home-packages)
   (services
    (list
     (service home-fish-service-type)
     (service home-dbus-service-type)
     (service home-dotfiles-service-type
	      (home-dotfiles-configuration
	       (directories (list "../home"))))
     (service home-pipewire-service-type)))))

%mlap-home-config
