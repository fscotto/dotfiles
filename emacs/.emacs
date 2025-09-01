;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

;; Setting variables
;; (setq os-packages-path "/home/fscotto/.emacs.d/packages/")
(setq vc-follow-symlinks 't)
(prefer-coding-system 'utf-8-unix)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setting default theme
(load-theme 'catppuccin :no-confirm)

;; Setting default font
(set-frame-font "JetBrainsMono Nerd Font 16" nil t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     PACKAGES                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 

(message "...user configuration loaded")
