;;; doom-modeline.el -*-

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-height 25
	doom-modeline-bar-width 3
	doom-modeline-project-detection 'projectile)
  :init (doom-modeline-mode 1))
