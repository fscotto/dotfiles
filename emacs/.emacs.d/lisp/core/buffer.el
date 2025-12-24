;;; buffer.el -*- lexical-binding: t; -*-

(use-package ibuffer
  :ensure t)


(use-package ibuffer-tramp
  :ensure t)

(use-package ibuffer-vc
  :ensure t)

(use-package ibuffer-projectile
  :ensure t)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-projectile-set-filter-groups)))

(provide 'buffer)

;;; buffer.el ends here
