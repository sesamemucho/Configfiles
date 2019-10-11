(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'darcula-theme)
  (package-refresh-contents)
  (package-install 'darcula-theme))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)


(setq ring-bell-function 'ignore)

(when window-system (global-hl-line-mode t))
(when window-system (global-prettify-symbols-mode t)) 
(use-package powerline
  :ensure t
  :init
  (powerline-default-theme))

(use-package diff-hl
  :ensure t
  :init
  (diff-hl-flydiff-mode))


(set-frame-font "DejaVu Sans Mono 12" nil t)

(use-package evil-leader
  :ensure t
  :init
(global-evil-leader-mode))
(use-package magit
  :ensure t)
(use-package evil-magit
  :ensure t)
(use-package git-gutter
  :ensure t
  :init
(git-gutter-mode 1))
(use-package evil
  :ensure t
  :init
  (evil-mode 1))
(setq evil-search-module 'evil-search
      evil-want-C-w-in-emacs-state t)
(use-package helm
  :ensure t
  :init
  (helm-mode 1))
(use-package company
  :ensure t
  :init
  (global-company-mode))
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "inertial-scroll")
(define-key evil-normal-state-map (kbd "C-u") 'inertias-down)
(define-key evil-normal-state-map (kbd "C-d") 'inertias-up)

(use-package deferred
  :ensure t)
(use-package ispell
  :ensure t)
(setq ispell-program-name "aspell")
(add-to-list 'ispell-local-dictionary-alist '("deutsch-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "de_DE"); Dictionary file name
                                              nil
                                              iso-8859-1))
(setq ispell-dictionary "de_DE")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=de_DE"))
(setq flyspell-issue-welcome-flag nil)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (darcula)))
 '(custom-safe-themes
   (quote
    ("41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "8eafb06bf98f69bfb86f0bfcbe773b44b465d234d4b95ed7fa882c99d365ebfd" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (diff-hl org-bullets which-key evil-magit evil-leader magit deferred company org-evil powerline-evil adoc-mode smart-hungry-delete dashboard all-the-icons page-break-lines ranger darcula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
		 ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks 
  :config (smart-hungry-delete-add-default-hooks)
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-banner-logo-title "YEAR OF THE LINUX DESKTOP")
(setq dashboard-startup-banner "~/.emacs.d/LinuxDesktop.png")
(setq dashboard-center-content t)
(setq dashboard-set-footer nil)


(setq undo-tree-auto-save-history t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(display-line-numbers-mode)
(setq display-line-numbers 'relative)
(scroll-bar-mode 0)
(setq initial-buffer-choice t)
