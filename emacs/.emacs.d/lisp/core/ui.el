;;;; core-ui.el -*-

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
(setq undo-limit 8000000)
(setq undo-strong-limit 12000000)

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

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package consult
  :ensure t
  :defer t)

(use-package ibuffer
  :ensure t
  :bind (:map global-map ("C-x C-b" . ibuffer)))
