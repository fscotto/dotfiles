;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setting default font
(set-frame-font "0xProto Nerd Font 13" nil t)

;; Remove toolbar
(tool-bar-mode -1)

;; Remove menu
(menu-bar-mode -1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable splash screen
(setq inhibit-splash-screen t)

;; Start all frames maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove scrollbar
(scroll-bar-mode -1)

;; Simple 'y' for 'yes' and 'n' for 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set global value for paragraph witdh
(setq-default fill-column 120)

;; Stop Emacs from losing informations
(setq undo-limit 2000000)
(setq undo-strong-limit 4000000000)

;; Smooth scroll
(setq scroll-step 3)
(setq ring-bell-function 'ignore)

;; Add column number in the status line
(column-number-mode)

;; View clock in the status line
(display-time)

;; Enable line numbers in the programming mode only
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Enable line numbers in the configuration mode only
(add-hook 'conf-mode-hook 'display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  EDITOR OPTIONS                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq standard-indent 4)
(setq tab-stop-list nil)
(setq indent-tabs-mode nil)

;; Setting variables
(setq vc-follow-symlinks 't)
(prefer-coding-system 'utf-8-unix)
(setq custom-file (null-device))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     PACKAGES                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialize package system via use-package
(package-initialize)
(require 'use-package)

(use-package package
  :config
  ;; Setting repo priorities
  (setq package-archive-priorities
	'(("melpa-stable" . 2)
	  ("MELPA" . 1)
	  ("gnu" . 0)))
  ;; Setting repo URL
  (setq package-archives
	'(("melpa-stable" . "https://stable.melpa.org/packages/")
	  ("MELPA" . "https://melpa.org/packages/")
	  ("gnu" . "https://elpa.gnu.org/packages/")))
  )

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha))

;; Status line like Doom Emacs
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Help to remember or discover keybindings
(use-package which-key
  :ensure t
  :commands (which-key-mode)
  :init (which-key-mode))

;; Configuration for mu4e, an interface for mu email index, running inside Emacs
(use-package mu4e
  :ensure nil
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :defer 20 ; Wait until 20 seconds after startup
  :bind (:map global-map ("C-c e" . mu4e))
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "~/.config/emacs/scripts/email_sync.sh")
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
        ("/GmailAccount/[Gmail]/Tutti i messaggi" . ?a))))

(setq user-mail-address "fabio.scottodisantolo@gmail.com")

(setq sendmail-program "/usr/bin/msmtp"
      send-mail-function 'sendmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail)

;; Configure elfeed for RSS feed
(use-package elfeed
  :ensure t
  :custom
  (elfeed-db-directory "~/.cache/elfeed")
  (elfeed-enclosure-default-dir "~/Downloads/")
  (elfeed-search-remain-on-entry t)
  (elfeed-search-title-max-width 100)
  (elfeed-search-title-min-width 30)
  (elfeed-search-trailing-width 25)
  (elfeed-show-truncate-long-urls t)
  (elfeed-sort-order 'descending)
  (elfeed-search-filter "1-week-ago +unread")
  (elfeed-feeds
   '(("https://blog.linuxmint.com/?feed=rss2" linux linuxmint)
     ("https://feeds.feedburner.com/TheHackersNews" hackernews news security programming)))
  :bind (("C-c f" . elfeed)))

;; Terminal
(use-package vterm
  :ensure t
  :bind (:map global-map
	      ("C-c t" . vterm)
	      ("C-c c" . vterm-copy-mode)))

;; PDF viewer with annotations
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

;; EPub viewer
(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

(use-package visual-fill-column
  :ensure t)

;; Git plugin
(use-package magit
  :ensure t
  :bind (:map global-map ("M-G" . magit-status)))

(use-package magit-delta
  :ensure t)

;; Highlight keywords to remember the activity when coding.
(use-package hl-todo
  :ensure t
  :commands (global-hl-todo-mode)
  :init (global-hl-todo-mode))

(setq hl-todo-keyword-faces
      '(("TODO"   . "#94e2d5")
        ("FIXME"  . "#f38ba8")
        ("DEBUG"  . "#cba6f7")
        ("GOTCHA" . "#eba0ac")
        ("STUB"   . "#89b4fa")))

(keymap-set hl-todo-mode-map "C-c p" #'hl-todo-previous)
(keymap-set hl-todo-mode-map "C-c n" #'hl-todo-next)
(keymap-set hl-todo-mode-map "C-c o" #'hl-todo-occur)
(keymap-set hl-todo-mode-map "C-c i" #'hl-todo-insert)

;; Highlight for i3 config file
(use-package i3wm-config-mode
  :ensure t)

;; Add autocomplete feature to Emacs
(use-package company
    :ensure t
    :commands (global-company-mode)
    :init (global-company-mode)
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1))

;; TODO adding lsp-mode, dap-mode, autocomplete and project handling for C, Go, Bash and Python
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c-mode . lsp))
  :commands lsp)

(message "...user configuration loaded")
