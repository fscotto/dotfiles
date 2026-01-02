;;; dashboard.el --- Startup dashboard -*- lexical-binding: t; -*-

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-items '((recents  . 8)
                          (projects . 5)))
  :config
  (dashboard-setup-startup-hook))

(provide 'dashboard)

;;; misc-dashboard.el ends here
