(use-package evil-leader
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (if (fboundp 'evil-leader/set-leader)
      (evil-leader/set-leader "<SPC>"))

  (if (fboundp 'evil-leader/set-key)
      (evil-leader/set-key
	"5" 'racket-run
	"c" 'compile
	"t" 'vterm-other-window
	"e" 'flymake-show-project-diagnostics
	"r" 'eglot-rename
	"a" 'eglot-code-actions
	"k" 'eldoc
	"h" 'which-key-show-top-level
	"b" 'switch-to-buffer
	"f" 'find-file
	"s" 'swiper
	"g" 'magit-status
	"/" 'counsel-rg
	"." 'project-find-file
	"x" 'kill-buffer)))

(use-package evil
  :config
  (global-evil-leader-mode)
  (evil-mode 1))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-matchit
  :config
  (evil-matchit-mode))

(use-package evil-visualstar
  :config
  (evil-visualstar-mode))

(use-package evil-collection
  :after evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-collection-init))

(provide 'keybinds)
