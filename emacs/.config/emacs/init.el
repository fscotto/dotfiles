;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

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

(use-package hl-todo
  :ensure t)

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
    
;; TODO adding lsp-mode, dap-mode, autocomplete and project handling for C, Go, Bash and Python

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setting default theme
(load-theme 'catppuccin :no-confirm)

;; Setting default font
(set-frame-font "0xProto Nerd Font 16" nil t)

;; Remove toolbar
(tool-bar-mode -1)

;; Remove menu
(menu-bar-mode -1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable splash screen
(setq inhibit-splash-screen t)

;; Enable line numbers in the programming mode only
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(message "...user configuration loaded")
