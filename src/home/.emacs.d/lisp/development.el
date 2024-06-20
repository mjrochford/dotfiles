; (use-package guix)
(use-package magit :defer)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(add-hook 'prog-mode-hook #'(lambda () (hs-minor-mode t))) ; code folding

(use-package org
  :config
  :defer
  (setq org-src-fontify-natively t))

(use-package evil-org :after org)


(provide 'development)
