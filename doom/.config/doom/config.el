;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'regular)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 16 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Maximize each Emacs frames at startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(after! mu4e
  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "~/.config/doom/scripts/email_sync.sh")
  (setq mu4e-maildir "~/Maildir")

  (setq mu4e-drafts-folder "/GmailAccount/[Gmail]/Bozze")
  (setq mu4e-sent-folder   "/GmailAccount/[Gmail]/Posta inviata")
  (setq mu4e-refile-folder "/GmailAccount/[Gmail]/Tutti i messaggi")
  (setq mu4e-trash-folder  "/GmailAccount/[Gmail]/Cestino")
  (setq user-email-address "fabio.scottodisantolo@gmail.com")
  (setq user-full-name "Fabio Scotto di Santolo")

  (setq mu4e-maildir-shortcuts
        '(("/GmailAccount/Inbox"                    . ?i)
          ("/GmailAccount/[Gmail]/Posta inviata"    . ?s)
          ("/GmailAccount/[Gmail]/Cestino"          . ?t)
          ("/GmailAccount/[Gmail]/Bozze"            . ?d)
          ("/GmailAccount/[Gmail]/Tutti i messaggi" . ?a)))

  (setq sendmail-program "/usr/bin/msmtp"
        send-mail-function 'sendmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function 'message-send-mail-with-sendmail))

;; Configure Elfeed
(after! elfeed
  (setq rmh-elfeed-org-files '("~/.config/doom/elfeed.org"))
  (setq elfeed-db-directory "~/.elfeed")
  (setq elfeed-enclosure-default-dir "~/Downloads/")
  (setq elfeed-sort-order 'descending)
  (setq elfeed-search-filter "1-week-ago +unread")

  ;; ;; Key bindings
  ;; (map! :map elfeed-search-mode-map
  ;;       :n "d" #'elfeed-download-current-entry
  ;;       :n "O" #'elfeed-search-browse-url)

  ;; Update hourly
  (run-at-time nil (* 60 60) #'elfeed-update))
