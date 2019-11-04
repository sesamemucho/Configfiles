(setq electric-pair-pairs '(
			      (?\( . ?\))
			      (?\[ . ?\])
			      (?\" . ?\")
			      (?\{ . ?\})
			      ))
 (electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)

(global-visual-line-mode)

(use-package highlight-numbers
  :ensure t)

(setq next-screen-context-lines 5)

(require 'dired)
(define-key dired-mode-map "e" 'shell-instead-dired)

(defun shell-instead-dired ()
  (interactive)
  (let ((dired-buffer (current-buffer)))
    (eshell (concat default-directory "-shell"))
    (kill-buffer dired-buffer) ;; remove this line if you don't want to kill the dired buffer
    (delete-other-windows)))

(setq mouse-autoselect-window t
      focus-follows-mouse t)
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist
      '(0 "HDMI-0" 1 "DVI-D-0" 2 "DP-2" 3 "DP-0"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda()
            (start-process-shell-command
             "xrandr" nil "xrandr --output HDMI-0 --output DVI-D-0 --output DP-2 --output DP-0 --auto")))
(exwm-randr-enable)
(require 'exwm-systemtray)
(exwm-systemtray-enable)
(use-package exwm
  :ensure t)
(require 'exwm)
(require 'exwm-config)
(setq exwm-layout-show-all-buffers 1)
(exwm-config-default)
(defun exwm-rename-buffer ()
  (interactive)
  (exwm-workspace-rename-buffer
   (concat exwm-class-name ":"
           (if (<= (length exwm-title) 50) exwm-title
             (concat (substring exwm-title 0 49) "...")))))

;; Add these hooks in a suitable place (e.g., as done in exwm-config-default)
(add-hook 'exwm-update-title-hook 'exwm-rename-buffer)
;; Global keybindings.
(unless (get 'exwm-input-global-keys 'saved-value)
  (setq exwm-input-global-keys
        `(
          ;; 's-r': Reset (to line-mode).
          ([?\s-r] . exwm-reset)
          ;; 's-w': Switch workspace.
          ([?\s-w] . exwm-workspace-switch)
          ;; 's-b': global switch buffer
          ([?\s-b] . exwm-workspace-switch-to-buffer)
          ;; 's-Q': kill current buffer
          ([?\s-Q] . kill-current-buffer)
;;(global-set-key (kbd "s-h") 'windmove-left)
;;(global-set-key (kbd "s-j") 'windmove-down)
;;(global-set-key (kbd "s-k") 'windmove-up)
;;(global-set-key (kbd "s-l") 'windmove-right)
          ;; 's-&': Launch application.
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))
          ;; 's-N': Switch to certain workspace.
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9)))))
;; Line-editing shortcuts
(unless (get 'exwm-input-simulation-keys 'saved-value)
  (setq exwm-input-simulation-keys
        '(([?\C-b] . [left])
          ([?\C-f] . [right])
          ([?\C-p] . [up])
          ([?\C-n] . [down])
          ([?\C-a] . [home])
          ([?\C-e] . [end])
          ([?\M-v] . [prior])
          ([?\C-v] . [next])
          ([?\C-d] . [delete])
          ([?\C-k] . [S-end delete])
          ([?\C-c?\C-c] . ?\C-c))))
  ;;;; Enable EXWM
;;(exwm-enable)
;;(fringe-mode 1)

(start-process-shell-command
 "startupfile" nil "~/.config/startup.sh")

(setq save-interprogram-paste-before-kill t)

(use-package exwm-edit
  :ensure t)

(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(defvar my-term-shell "/bin/fish")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell '/bin/fish))

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode)

(setq org-hide-emphasis-markers t)

(let* ((variable-tuple
(cond ((x-list-fonts "DejaVu Sans Mono") '(:font "DejaVu Sans Mono"))
	      ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
	      ((x-list-fonts "Verdana")         '(:font "Verdana"))
	      ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
	      ))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline))))
   `(org-level-7 ((t (,@headline))))
   `(org-level-6 ((t (,@headline))))
   `(org-level-5 ((t (,@headline))))
   `(org-level-4 ((t (,@headline :height 1.1))))
   `(org-level-3 ((t (,@headline :height 1.25))))
   `(org-level-2 ((t (,@headline :height 1.5))))
   `(org-level-1 ((t (,@headline :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))
(add-to-list 'org-structure-template-alist
'("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(setq org-agenda-files (quote ("~/test.org")))

(setq org-confirm-babel-evaluate nil)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(org-babel-load-file (expand-file-name "~/Notebooks/orgfiles.org"))
(setq org-agenda-files (list "~/Notebooks/org/gcal.org"
			     "~/Notebooks/org/i.org"))

(use-package ox-reveal
  :ensure t
  :config 
  (setq org-reveal-root "file:///home/julius/Projects/reveal.js"))
  (setq Org-Reveal-root "file:///path-to-reveal.js")
  (setq Org-Reveal-title-slide nil)

(use-package htmlize
  :ensure t)

(use-package adoc-mode
  :ensure t)

(use-package kotlin-mode
  :ensure t)
(use-package ob-kotlin
  :ensure t)

(require 'ob-java)
(add-to-list 'org-babel-load-languages '(java . t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (quote arrow))
  (powerline-default-theme)
  (powerline-reset))

(defun increment-number-at-point ()
    (interactive)
    (skip-chars-backward "0-9")
    (or (looking-at "[0-9]+")
	(error "No number at point"))
    (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))

(defun my-change-number-at-point (change)
  (let ((number (number-at-point))
	(point (point)))
    (when number
      (progn
	(forward-word)
	(search-backward (number-to-string number))
	(replace-match (number-to-string (funcall change number)))
	(goto-char point)))))
(defun my-increment-number-at-point ()
  "Increment number at point like vim's C-a"
  (interactive)
  (my-change-number-at-point '1+))
(defun my-decrement-number-at-point ()
  "Decrement number at point like vim's C-x"
  (interactive)
  (my-change-number-at-point '1-))
(global-set-key (kbd "C-c a") 'my-increment-number-at-point)
(global-set-key (kbd "C-c x") 'my-decrement-number-at-point)

(use-package dot-mode
  :ensure t
  :config
  (dot-mode-on))

(use-package fzf
  :ensure t)

(use-package deadgrep
:ensure t)

(defun config-visit()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key(kbd "C-c e") 'config-visit)

(defun config-reload()
  (interactive)
  (org-babel-load-file(expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(defun kill-whole-word()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)

(use-package rainbow-mode
    :ensure t
    :init
    (rainbow-mode 1)
)

(use-package rainbow-delimiters
  :ensure t
  :init(rainbow-delimiters-mode 1))

(use-package sudo-edit
  :ensure t)

(use-package counsel
  :ensure t)

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package swiper
  :ensure t
  :init)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char)
  (global-set-key (kbd "C-:") 'avy-goto-char-2)
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "YEAR OF THE LINUX DESKTOP")
  (setq dashboard-startup-banner "~/.emacs.d/LinuxDesktop.png")
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 15)))
  (setq dashboard-set-footer nil))

(use-package undohist
  :ensure t
  :config
  (undohist-initialize))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (with-eval-after-load 'company
    (setq company-minimum-prefix-length 2)))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package js2-mode
  :ensure t
  :config)

(use-package js2-refactor
  :ensure t)
(use-package xref-js2
  :ensure t)

(use-package polymode
  :ensure t)

(require 'polymode)
(require 'js2-mode)

(define-hostmode javascript-hostmode
  :mode 'js2-mode
  :protect-syntax t)
(define-innermode lit-html-innermode
  :mode 'mhtml-mode
  :head-matcher "html`"
  :tail-matcher "`"
  :head-mode 'host
  :tail-mode 'host)
(define-polymode polymer-mode
  :hostmode 'javascript-hostmode
  :innermodes '(lit-html-innermode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . polymer-mode))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

;;from: https://stackoverflow.com/a/1819405/8825153
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "inertial-scroll")
;;(define-key evil-normal-state-map (kbd "C-u") 'inertias-down)
;;(define-key evil-normal-state-map (kbd "C-d") 'inertias-up)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-frame-font "DejaVu Sans Mono 14" nil t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(defalias 'yes-or-no-p 'y-or-n-p)


(setq ring-bell-function 'ignore)

(when window-system (global-prettify-symbols-mode t)) 

(use-package diff-hl
  :ensure t
  :init
  (diff-hl-flydiff-mode))



(use-package deferred
  :ensure t)
(use-package magit
  :ensure t)
(use-package git-gutter
  :ensure t
  :init
(git-gutter-mode 1))
(use-package all-the-icons
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

(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq initial-buffer-choice t)
