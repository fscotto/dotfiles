(use-package magit
  :ensure t
  :commands (magit-status magit-log)
  :init
  ;; Entry point principale
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  :config
  ;; Performance & UX
  (setq magit-refresh-status-buffer nil)
  (setq magit-repository-directories
	'(("~/Projects" . 2)
	  ("~/Work" . 2))))

(provide 'vcs)

;;; vcs.el ends here
