;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!



;; some email clients, file templates and snippets.
(setq user-full-name "Julius Dehner"
      user-mail-address "julius.dehner@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font "Fira Code")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-molokai)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/orgfiles/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

(evil-snipe-mode -1)

(define-key key-translation-map [?\C-h] [?\C-?])

(use-package emms
        :config
        (emms-all)
        (emms-default-players))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))
;; (setq org-caldav-url "https://nextcloud.plexiglas.xyz/remote.php/dav/calendars/juligreen")
;; (setq org-caldav-calendar-id "org-calendar")
;; (setq org-caldav-inbox "~/orgfiles/caldav-inbox.org")
;; (setq org-caldav-files '("~/orgfiles/todo.org"))
;; (setq org-icalendar-timezone "Europe/Berlin")

;; (use-package org-caldav
;;   :init
;;   ;; This is the sync on close function; it also prompts for save after syncing so
;;   ;; no late changes get lost
;;   ;; (defun org-caldav-sync-at-close ()
;;   ;;   (org-caldav-sync)
;;   ;;   (save-some-buffers))

;;   ;; This is the delayed sync function; it waits until emacs has been idle for
;;   ;; "secs" seconds before syncing.  The delay is important because the caldav-sync
;;   ;; can take five or ten seconds, which would be painful if it did that right at save.
;;   ;; This way it just waits until you've been idle for a while to avoid disturbing
;;   ;; the user.
;;   (defvar org-caldav-sync-timer nil
;;      "Timer that `org-caldav-push-timer' used to reschedule itself, or nil.")
;;   (defun org-caldav-sync-with-delay (secs)
;;     (when org-caldav-sync-timer
;;       (cancel-timer org-caldav-sync-timer))
;;     (setq org-caldav-sync-timer
;;       (run-with-idle-timer
;;        (* 1 secs) nil 'org-caldav-sync)))

;;   ;; Actual calendar configuration edit this to meet your specific needs
;;   (setq org-caldav-url "https://nextcloud.plexiglas.xyz/remote.php/dav/calendars/juligreen")
;;       (setq org-caldav-calendars
;;     '((:calendar-id "org-calendar"
;;             :files ("~/orgfiles/todo.org")
;;         :inbox "~/orgfiles/calendar/caldav-inbox.org")))
;;   (setq org-caldav-backup-file "~/orgfiles/calendar/org-caldav-backup.org")
;;   (setq org-caldav-save-directory "~/orgfiles/calendar/")

;;   :config
;;   (setq org-icalendar-alarm-time 1)
;;   ;; This makes sure to-do items as a category can show up on the calendar
;;   (setq org-icalendar-include-todo t)
;;   ;; This ensures all org "deadlines" show up, and show up as due dates
;;   (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
;;   ;; This ensures "scheduled" org items show up, and show up as start times
;;   (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))
;;   ;; Add the delayed save hook with a five minute idle timer
;;   (add-hook 'after-save-hook
;;         (lambda ()
;;           (when (eq major-mode 'org-mode)
;;         (org-caldav-sync-with-delay 300))))
  ;; Add the close emacs hook
  ;; (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
