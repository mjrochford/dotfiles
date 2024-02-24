(setq default-frame-alist '((font . "Iosevka Term 11")
			    (font . "Iosevka 11")))

(use-package base16-theme
  :config
  (setq base16-theme-256-color-source 'colors)
  (load-theme 'base16-chalk t))

(use-package vterm :defer)
(use-package company :defer)
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1))
(use-package counsel)

(use-package which-key
  :config
  (which-key-mode 1))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'makeup)
