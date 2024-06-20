(use-modules (gnu))
(use-service-modules networking ssh web monitoring cuirass)
(use-package-modules screen ssh monitoring)

(define %cuirass-specs
  #~(list (specification
           (name "z4-linux")
           (build '(packages "linux-libre")))
          (specification
           (name "core")
           (build '(packages "linux-libre")))
          ))

(operating-system
  (host-name "guix-ci")
  (timezone "America/Los_Angeles")
  (locale "en_US.utf8")
  (bootloader (bootloader-configuration (bootloader grub-bootloader)))

  (kernel-arguments (list "console=ttyS0,115200"))
  (file-systems (cons (file-system
                        (device (file-system-label "my-root"))
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))

  (users (cons (user-account
                (name "alice")
                (comment "Bob's sister")
                (group "users")
                (supplementary-groups '("wheel"
                                        "audio" "video")))
               %base-user-accounts))
  (packages (cons screen %base-packages))
  (services (append (list (service dhcp-client-service-type)
                          (service tailon-service-type)
                          (service darkstat-service-type
                                   (darkstat-configuration
                                     (interface "ens3")))
                          (service cuirass-service-type
                                   (cuirass-configuration
                                     (specifications %cuirass-specs)))
                          (service openssh-service-type
                                   (openssh-configuration
                                     (openssh openssh-sans-x)
                                     (port-number 2222))))
                    %base-services)))
