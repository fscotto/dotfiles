;;; Fonts
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-13")
   ((eq system-type 'gnu/linux) "Fira Code-12")))

(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

(when (display-graphic-p)
  (set-face-attribute 'fixed-pitch nil :family (rc/get-default-font)))

;;; GUI
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq frame-title-format "Emacs")
(set-default 'cursor-type 'hbar)
(global-hl-line-mode)
(winner-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(windmove-default-keybindings)

;;; Themes
(rc/require-theme 'atom-one-dark)

