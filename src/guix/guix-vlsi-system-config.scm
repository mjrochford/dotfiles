(use-modules (gnu))
(use-service-modules networking ssh web monitoring)
(use-package-modules screen ssh monitoring)

(operating-system
  (host-name "guix-vlsi")
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
                (name "mrochford")
                (comment "Matt Rochford")
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
                          (service zabbix-server-service-type)
                          (service zabbix-agent-service-type)
                          (service zabbix-front-end-service-type)
                          (service openssh-service-type
                                   (openssh-configuration)))
                    %base-services)))
