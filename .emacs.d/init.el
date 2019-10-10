(package-initialize)
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))
 (use-package paredit
	      :ensure t)

(use-package darcula-theme
  :ensure t
  :config)

(use-package powerline
  :ensure t
  :config)
(setq powerline-arrow-shape 'arrow)   ;; the default

(set-frame-font "DejaVu Sans Mono 12" nil t)

(require 'evil-leader)
(global-evil-leader-mode)
(require 'magit)
(require 'evil-magit)
(require 'git-gutter)
(git-gutter-mode 1)
(require 'evil)
  (evil-mode 1)
(setq evil-search-module 'evil-search
      evil-want-C-w-in-emacs-state t)
(require 'helm)
  (helm-mode 1)
(require 'company)
  (company-mode 1)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "inertial-scroll")
(define-key evil-normal-state-map (kbd "C-u") 'inertias-down)
(define-key evil-normal-state-map (kbd "C-d") 'inertias-up)

(require 'ispell)
(add-to-list 'ispell-local-dictionary-alist '("deutsch-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "de_DE"); Dictionary file name
                                              nil
                                              iso-8859-1))
 (setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "de_DE")
(setq ispell-local-dictionary-alist
      '(("de_DE" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))

(setq package-enable-at-startup nil)
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
    (evil-magit git-gutter evil-leader magit deferred company org-evil powerline-evil adoc-mode smart-hungry-delete dashboard all-the-icons page-break-lines ranger darcula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#a9b7c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry nil)))))
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
(display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(scroll-bar-mode 0)
(setq initial-buffer-choice t)
