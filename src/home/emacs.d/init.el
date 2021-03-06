;;; package --- init
;;; Commentary:

;;; Code:

(global-set-key [escape] 'keyboard-escape-quit) ;; escape to close prompts
(menu-bar-mode -1) ;; remove menubar & toolbar

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
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents ;; update repos if not updated
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package eshell
  :init

  (defun fst-letter(str) "STR shortens director name."
	 (cond
					; empty string gets empty string
	  ((eq (length str) 0) "")
					; hidden dirs get two chars
	  ((string= (substring str 0 1) ".") (substring str 0 2))
					; everything else first character
	  (t (substring str 0 1))))
  (defun shorten-paths(p-lst) "P-LST shortens a path list."
	 (if (> (length p-lst) 1)
	     (concat
	      (mapconcat (lambda (elm) (fst-letter elm)) (butlast p-lst) "/")
	      "/"
	      (mapconcat (lambda (elm) elm) (last p-lst) "/"))
	   (car p-lst)))
  (defun short-path() "Return a short version of PWD."
	 (shorten-paths (split-string (abbreviate-file-name (eshell/pwd)) "/")))

  (defvar eshell-prompt-regexp "\.\+ (>|#) $")
  (defvar eshell-prompt-function
    (lambda() (concat
	       (with-face (short-path) :foreground "lightblue")
	       (if (= (user-uid) 0)
		   (with-face " #" :weight 'bold :foreground "red")
		 (with-face " >" :weight 'bold :foreground "lightyellow"))
	       " "))))

(use-package evil-leader
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (if (fboundp 'evil-leader/set-leader)
      (evil-leader/set-leader "<SPC>"))

  (if (fboundp 'evil-leader/set-key)
      (evil-leader/set-key
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

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package go-mode :ensure t)
(use-package haskell-mode :ensure t)
(use-package rust-mode :ensure t)

;;; init.el ends here
