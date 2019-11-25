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
(use-package doom-themes
  :ensure t)


(setq custom-file "~/.emacs.d/customfile.el")
(load custom-file)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(put 'erase-buffer 'disabled nil)
