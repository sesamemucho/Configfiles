(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("ORG"          . "https://orgmode.org/elpa/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("ORG"          . 10)
        ("MELPA Stable" . 7)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package flatland-theme
  :ensure t)


(setq custom-file "~/.emacs.d/customfile.el")
(load custom-file)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (flatland-theme)))
 '(custom-safe-themes
   (quote
    ("9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "dcf7154867ba67b250fe2c5cdc15a7d170acd9cbe6707cc36d9dd1462282224d")))
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("~/.emacs.d/config.org" "~/Notebooks/org/gcal.org" "~/Notebooks/org/i.org")))
 '(package-selected-packages
   (quote
    (exwm-edit dumb-jump exwm-systemtray exwm xref-js2 js2-refactor js2-mode emmet-mode polymode aggressive-indent agressive-indent atomic-chrome counsel-projectile ace-window ob-kotlin kotlin-mode flatland-theme projectile yasnippet htmlize vterm org-gcal spaceline rainbow-delimiters sudo-edit hungry-delete rainbow-mode rg fzf memoize diff-hl org-bullets which-key  magit deferred company   adoc-mode dashboard all-the-icons page-break-lines ranger ))))
