;;; package --- init
;;; Commentary:

;;; Code:

(global-set-key [escape] 'keyboard-escape-quit) ;; escape to close prompts
(menu-bar-mode -1) ;; remove menubar & toolbar

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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
       (load-file "~/.emacs.d/init.el"))

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
  (sane-term))

(use-package sane-term
  :ensure t
  :bind (
    ("C-x t" . create-term))
    ("C-x T" . sane-term-create))

(use-package evil-leader
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (if (fboundp 'evil-leader/set-leader)
      (evil-leader/set-leader "<SPC>"))

  (if (fboundp 'evil-leader/set-key)
      (evil-leader/set-key
	"h" 'which-key-show-top-level
	"a" 'switch-to-prev-buffer
	"b" 'switch-to-buffer
	"d" 'switch-to-next-buffer
	"f" 'find-file
	"g" 'magit-status
	"p" 'projectile-find-file
	"r" 'reload-config
	"w" 'save-buffer
	"x" 'execute-extended-command))

  :ensure t)

(use-package evil
  :ensure t
  :init

  :config
  (global-evil-leader-mode)
  (evil-ex-define-cmd "bd" 'kill-this-buffer)
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
  (load-theme 'base16-circus t))

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
   'org-babel-load-languages
   '((emacs-lisp . nil)
     (haskell . t)
     (python . t)))
  (setq org-src-fontify-natively t))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

; (use-package spinner :ensure t)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (rust-mode . lsp)
         (python-mode . lsp)
         (haskell-mode . lsp)
	 (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :ensure t)
(setq byte-compile-warnings '(cl-functions))

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package flycheck :ensure t)

(global-flycheck-mode)

(use-package go-mode :ensure t)
(use-package haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  :ensure t)
(use-package lsp-haskell :ensure t)
(use-package rust-mode :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package slime)
(setq inferior-lisp-program "/usr/bin/sbcl")


;;; init.el ends here
