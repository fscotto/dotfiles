(use-package dap-mode
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . dap-mode)
  :init
  ;; Enabling only some features
  (setq dap-auto-configure-features '(sessions locals expressions repl))
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-ui-controls-mode 1)
  ;; Auto show breakpoints + REPL
  (setq dap-ui-buffer-configurations
	'(;; RIGHT SIDE — Debug data (like IntelliJ)
	  (dap-ui-locals     . ((side . right) (slot . 1) (window-width . 0.30)))
	  (dap-ui-sessions   . ((side . right) (slot . 2) (window-width . 0.30)))
	  (dap-ui-expressions . ((side . right) (slot . 3) (window-width . 0.30)))
          ;; BOTTOM — Console / REPL
	  (dap-ui-repl       . ((side . bottom) (slot . 1) (window-height . 0.25)))
          (dap-ui-console    . ((side . bottom) (slot . 2) (window-height . 0.25)))))
  ;; Loading DAP adapters
  ;; For Python
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))
