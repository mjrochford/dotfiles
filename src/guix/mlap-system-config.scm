;; mlap guix config
(define-module (mlap-system)
  :use-module (gnu)
  :use-module (nongnu packages linux)
  :use-module (nongnu system linux-initrd)
  :use-module (manifests system)
  :export (%mlap-system-config))

(use-package-modules radio shells)
(use-service-modules cups desktop sddm networking ssh xorg dbus)

(define %mlap-packages
  (append system-packages %base-packages))

(define %mlap-desktop-services
  (modify-services
   %desktop-services
   (guix-service-type
    config =>
    (guix-configuration
     (inherit config)
     (substitute-urls
      (append (list "https://substitutes.nonguix.org")
	      %default-substitute-urls))
     (authorized-keys
      (append (list (plain-file "non-guix.pub"
				"(public-key (ecc (curve Ed25519)
					    (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))"))
	      %default-authorized-guix-keys))))
   (delete gdm-service-type)))

(define %mlap-services
  (append (list (service plasma-desktop-service-type)
		(service sddm-service-type
			 (sddm-configuration
			  (theme "breeze")))
		(service openssh-service-type)
		(service cups-service-type)
		(service bluetooth-service-type
			 (bluetooth-configuration
			  (auto-enable? #t)))
		(udev-rules-service 'rtl-sdr rtl-sdr))
	  %mlap-desktop-services))

(define %mlap-users
  (cons* (user-account
	  (name "mrochford")
	  (comment "Matt Rochford")
	  (shell (file-append fish "/bin/fish"))
	  (group "users")
	  (home-directory "/home/mrochford")
	  (supplementary-groups '("wheel" "netdev" ; admin
				  "kvm" "dialout"  ; Virtualization, usb
				  "audio" "video")))
	 %base-user-accounts))

(define %mlap-system-config
  (operating-system
   (locale "en_US.utf8")
   (timezone "America/Los_Angeles")
   (keyboard-layout (keyboard-layout "us"))
   (host-name "mlap")
   (kernel linux)
   (kernel-arguments '("modprobe.blacklist=dvb_usb_rtl28xxu"))
   (initrd microcode-initrd)
   (firmware (list linux-firmware))

   (packages %mlap-packages)
   (users %mlap-users)
   (services %mlap-services)
   (name-service-switch %mdns-host-lookup-nss)

   (bootloader (bootloader-configuration
		(bootloader grub-efi-bootloader)
		(targets (list "/boot"))
		(keyboard-layout keyboard-layout)))
   (mapped-devices (list (mapped-device
			  (source (uuid
				   "22631675-7240-41a0-83aa-2342031cfb51"))
			  (target "cryptroot")
			  (type luks-device-mapping))))
   (file-systems (cons* (file-system
			 (mount-point "/boot")
			 (device (uuid "2030-CF89"
				       'fat32))
			 (type "vfat"))
			(file-system
			 (mount-point "/")
			 (device "/dev/mapper/cryptroot")
			 (type "ext4")
			 (dependencies mapped-devices)) %base-file-systems))))

%mlap-system-config
