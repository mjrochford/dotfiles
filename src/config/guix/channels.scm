(use-modules (guix ci))

(list (channel-with-substitutes-available
        %default-guix-channel
        "https://ci.guix.gnu.org"))

(append (list
    (channel
      (name 'nonguix)
      (url "https://gitlab.com/nonguix/nonguix")
      ;; Enable signature verification:
      (introduction
        (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
            "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
    (channel
      (name 'gur)
      (branch "main")
      (url (string-append "file://" (getenv "HOME")
                          "/ports/guix-channels/gur"))))
        %default-channels)
