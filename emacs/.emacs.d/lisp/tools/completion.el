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

(use-package ibuffer-tramp
  :ensure t)

(use-package ibuffer-vc
  :ensure t)

(use-package ibuffer-projectile
  :ensure t)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-projectile-set-filter-groups)))

;; Add autocomplete feature to Emacs
(use-package company
    :ensure t
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1)
    :hook (prog-mode . company-mode))

(with-eval-after-load 'company
  (add-hook 'bash-ts-mode-hook 'company-mode))

;; Static analysis for code base
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(with-eval-after-load 'flycheck
  (add-hook 'bash-ts-mode-hook 'flycheck-mode))
