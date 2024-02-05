(use-package eglot :defer)
(use-package rust-mode
  :config
  :defer
  (add-hook 'rust-mode-hook 'eglot-ensure))

(use-package geiser :defer)
(use-package geiser-guile :defer)

(provide 'languages)
