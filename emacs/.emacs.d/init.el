;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load default theme
(load-theme 'wombat)

;; Setting default font
(set-frame-font "Iosevka Nerd Font 14" nil t)

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

;; Setting default directory for Org files
(setq org-directory "~/Remotes/pCloud/Org")

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
	  ("gnu" . "https://elpa.gnu.org/packages/"))))

;; (use-package catppuccin-theme
;;   :ensure t
;;   :config
;;   (load-theme 'catppuccin :no-confirm)
;;   (setq catppuccin-flavor 'mocha))

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
;; (use-package mu4e
;;   :ensure nil
;;   ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
;;   :defer 20 ; Wait until 20 seconds after startup
;;   :bind (:map global-map ("C-c e" . mu4e))
;;   :config

;;   ;; This is set to 't' to avoid mail syncing issues when using mbsync
;;   (setq mu4e-change-filenames-when-moving t)

;;   ;; Refresh mail using isync every 10 minutes
;;   (setq mu4e-update-interval (* 10 60))
;;   (setq mu4e-get-mail-command "~/.emacs.d/scripts/email_sync.sh")
;;   (setq mu4e-maildir "~/Maildir")

;;     ;; Configure email accounts
;;   (setq mu4e-contexts
;;         (list
;;          ;; Protonmail Account
;;          (make-mu4e-context
;;           :name "Protonmail"
;;           :match-func
;;           (lambda (msg)
;;             (when msg
;;               (string-prefix-p "/ProtonMailAccount" (mu4e-message-field msg :maildir))))
;;           :vars '((user-mail-address . "fscottodisantolo@protonmail.com")
;;                   (user-full-name . "Fabio Scotto di Santolo")
;;                   (mu4e-drafts-folder . "/ProtonMailAccount/Drafts")
;;                   (mu4e-sent-folder . "/ProtonMailAccount/Sent")
;;                   (mu4e-refile-folder . "/ProtonMailAccount/All Mail")
;;                   (mu4e-trash-folder . "/ProtonMailAccount/Trash")))

;;          ;; iCloud Account
;;          (make-mu4e-context
;;           :name "iCloud Mail"
;;           :match-func
;;           (lambda (msg)
;;             (when msg
;;               (string-prefix-p "/iCloudAccount" (mu4e-message-field msg :maildir))))
;;           :vars '((user-mail-address . "fscottodisantolo@icloud.com")
;;                   (user-full-name . "Fabio Scotto di Santolo")
;;                   (mu4e-drafts-folder . "/iCloudAccount/Drafts")
;;                   (mu4e-sent-folder . "/iCloudAccount/Sent Messages")
;;                   (mu4e-refile-folder . "/iCloudAccount/INBOX")
;;                   (mu4e-trash-folder . "/iCloudAccount/Junk")))))

;;   (setq sendmail-program "/usr/bin/msmtp"
;;       send-mail-function 'sendmail-send-it
;;       message-sendmail-f-is-evil t
;;       message-sendmail-extra-arguments '("--read-envelope-from")
;;       message-send-mail-function 'message-send-mail-with-sendmail))

;; Configure elfeed for RSS feed
(use-package elfeed
  :ensure t
  :custom
  (elfeed-enclosure-default-dir "~/Downloads/")
  (elfeed-search-remain-on-entry t)
  (elfeed-search-title-max-width 100)
  (elfeed-search-title-min-width 30)
  (elfeed-search-trailing-width 25)
  (elfeed-show-truncate-long-urls t)
  (elfeed-sort-order 'descending)
  (elfeed-search-filter "+unread")
  :bind
  ("C-c o f" . fscotto/elfeed-load-db-and-open)
  (:map elfeed-search-mode-map
        ("w" . elfeed-search-yank)
        ("R" . elfeed-update)
        ("q" . elfeed-kill-buffer))
  (:map elfeed-show-mode-map
        ("S"     . elfeed-show-new-live-search) ; moved to free up 's'
        ("c"     . (lambda () (interactive) (org-capture nil "capture")))
        ("e"     . email-elfeed-entry)
        ("f"     . elfeed-show-fetch-full-text)
        ("w"     . elfeed-show-yank))
  :hook
  (elfeed-show-mode . visual-line-mode))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :custom
  ;; Optionally specify a number of files containing elfeed
  ;; configuration. If not set then the location below is used.
  ;; Note: The customize interface is also supported.
  (rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

(with-eval-after-load 'elfeed
  (elfeed-org))

;; Terminal
(use-package vterm
  :ensure t
  :bind (:map global-map
	      ("C-c o T" . vterm)
	      ("C-c C-t" . vterm-copy-mode)))

;; FIXME PDF viewer with annotations
;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install))

;; EPub viewer
(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

(use-package visual-fill-column
  :ensure t)

;; Git plugin
(use-package magit
  :ensure t
  :bind (:map global-map ("C-c v g" . magit-status)))

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

(keymap-set hl-todo-mode-map "C-t p" #'hl-todo-previous)
(keymap-set hl-todo-mode-map "C-t n" #'hl-todo-next)
(keymap-set hl-todo-mode-map "C-t o" #'hl-todo-occur)
(keymap-set hl-todo-mode-map "C-t i" #'hl-todo-insert)

;; Highlight for i3 config file
(use-package i3wm-config-mode
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package ibuffer
  :ensure t
  :bind (:map global-map ("C-x C-b" . ibuffer)))

(use-package ibuffer-tramp
  :ensure t)

(use-package ibuffer-vc
  :ensure t)

(use-package ibuffer-projectile
  :ensure t)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-projectile-set-filter-groups)))

;; TODO adding lsp-mode, dap-mode, autocomplete and project handling for C, Go, Bash and Python

;; Add autocomplete feature to Emacs
(use-package company
    :ensure t
    :commands (global-company-mode)
    :init (global-company-mode)
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :ensure t)

(use-package lsp-ivy
  :ensure t)

(use-package dap-mode
  :ensure t)

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun fscotto/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening URL https://pragmaticemacs.wordpress.com/2016/08/17/read-your-rss-feeds-in-emacs-with-elfeed/
  Created: 2016-08-17
  Updated: 2025-06-13"
  (interactive)
  (elfeed)
  (elfeed-db-load)
  ;; (elfeed-search-update--force)
  (elfeed-update)
  (elfeed-db-save))

(message "...user configuration loaded")
