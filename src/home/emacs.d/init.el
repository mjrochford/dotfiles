;;; package --- init
;;; Commentary:

;;; Code:

(global-set-key [escape] 'keyboard-escape-quit) ;; escape to close prompts
(menu-bar-mode -1) ;; remove menubar & toolbar

(toggle-truncate-lines)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq dired-listing-switches "-lha")

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

(defun create-term ()
  "Create new window for a term."
  (interactive)
  (split-window-below)
  (other-window 1)
  (sane-term-create))

(use-package sane-term
  :ensure t)

(use-package evil-leader
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (if (fboundp 'evil-leader/set-leader)
      (evil-leader/set-leader "<SPC>"))

  (if (fboundp 'evil-leader/set-key)
      (evil-leader/set-key
	"t" 'create-term
	"T" 'create-term
	"e" 'flycheck-list-errors
	"r" 'lsp-rename
	"a" 'lsp-execute-code-action
	"h" 'which-key-show-top-level
	"b" 'switch-to-buffer
	"f" 'find-file
	"g" 'magit-status
	"p" 'projectile-find-file
	"w" 'save-buffer
	"x" 'execute-extended-command))

  :ensure t)

(use-package evil
  :ensure t
  :init

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
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-chalk t))

(add-to-list 'default-frame-alist
	    '(font . "Fira Code-10"))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package magit
  :ensure t)

(use-package org
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((C, t)))
  (setq org-src-fontify-natively t))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

; (use-package spinner :ensure t)

(use-package lsp-mode :ensure t)
(setq byte-compile-warnings '(cl-functions))

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-ivy :ensure t)
(use-package lsp-ui :ensure t)

(use-package flycheck :ensure t)

(global-flycheck-mode)

(use-package go-mode :ensure t)
(use-package haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  :ensure t)
(use-package lsp-haskell :ensure t)
(use-package rustic :ensure t)
(use-package geiser-mit :ensure t)
(use-package geiser-racket :ensure t)
(use-package geiser-guile :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
;;; init.el ends here
