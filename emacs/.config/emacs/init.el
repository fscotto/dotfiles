;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setting default theme
(load-theme 'catppuccin :no-confirm)

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
  :ensure t)

;; FIXME autoload hl-todo
(use-package hl-todo
  :ensure t
  :init (hl-todo-mode 1))

(setq hl-todo-keyword-faces
      '(("TODO"   . "#94e2d5")
        ("FIXME"  . "#f38ba8")
        ("DEBUG"  . "#cba6f7")
        ("GOTCHA" . "#eba0ac")
        ("STUB"   . "#89b4fa")))

(with-eval-after-load 'magit
  (add-hook 'magit-log-wash-summary-hook
            #'hl-todo-search-and-highlight t)
  (add-hook 'magit-revision-wash-message-hook
            #'hl-todo-search-and-highlighthl t))

;; Status line like Doom Emacs
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package vterm
  :ensure t)

(use-package i3wm-config-mode
  :ensure t)

;; TODO adding lsp-mode, dap-mode, autocomplete and project handling for C, Go, Bash and Python
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c-mode . lsp))
  :commands lsp)

(message "...user configuration loaded")
