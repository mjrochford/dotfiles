;;; package --- init
;;; Commentary:

;;; Code:

(add-hook 'prog-mode-hook #'(lambda () (hs-minor-mode t))) ; code folding
(global-set-key [escape] 'keyboard-escape-quit) ;; escape to close prompts
(menu-bar-mode -1) ;; remove menubar & toolbar

(toggle-truncate-lines)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq dired-listing-switches "-lha --sort time --group-directories-first")

(tool-bar-mode -1) ;; --
(scroll-bar-mode -1) ;; hide scrollbars
(save-place-mode 1) ;; remember position in files

(setq frame-title-format "%b - emacs"     ; Use buffer name as frame title
      inhibit-startup-screen t            ; don't start with welcome scree
      initial-scratch-message ";; yo...\n\n") ; scratch message
(defalias 'yes-or-no-p 'y-or-n-p)         ; y/n instead of yes/no

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file) ;; dont pollute init.el with customize-* things

;; make editing init.el less horrid
(defun reload-config () "Reloads the init file." (interactive)
       (load-file (expand-file-name "init.el" user-emacs-directory)))

(defun with-face (str &rest face-plist) "STR FACE-PLIST, Format face strings."
       (propertize str 'face face-plist))

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents ;; update repos if not updated
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(defun fmt ()
  (interactive)
  "format buffer/project"
  (eglot-format))

(use-package vterm :ensure t)

(use-package eglot :ensure t)

(use-package company :ensure t)

(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'eglot-ensure))

(use-package evil-leader
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (if (fboundp 'evil-leader/set-leader)
      (evil-leader/set-leader "<SPC>"))

  (if (fboundp 'evil-leader/set-key)
      (evil-leader/set-key
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
	"x" 'execute-extended-command)))

(use-package evil
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-matchit
  :ensure t
  :config
  (evil-matchit-mode))

(use-package evil-visualstar
  :ensure t
  :config
  (evil-visualstar-mode))

(use-package evil-collection
  :ensure t
  :after evil
  :init 
  (setq evil-want-keybinding nil)
  :config
  (evil-collection-init))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1))
(use-package counsel :ensure t)
(use-package swiper :ensure t)

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-chalk t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package magit :ensure t)

(use-package org
  :ensure t
  :config
  (setq org-src-fontify-natively t))

(use-package evil-org :after org :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;;; init.el ends here
