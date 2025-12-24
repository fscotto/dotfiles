;;=================================================================
;; Go Language Support
;;=================================================================

(use-package go-ts-mode
  :ensure nil
  :mode "\\.go\\'"
  :hook
  ((go-ts-mode . lsp-deferred)
   (go-ts-mode . fscotto/go-format-on-save))
  :config
  ;; Go project commands
  ;; Modules
  (define-key go-ts-mode-map (kbd "C-c m t") #'fscotto/go-mod-tidy)
  (define-key go-ts-mode-map (kbd "C-c m d") #'fscotto/go-mod-download)
  ;; Test
  (define-key go-ts-mode-map (kbd "C-c t p") #'fscotto/go-test-package)
  (define-key go-ts-mode-map (kbd "C-c t a") #'fscotto/go-test-module)
  (define-key go-ts-mode-map (kbd "C-c t t") #'fscotto/go-test-current-test)
  ;; Debug tests
  (define-key go-ts-mode-map (kbd "C-c d t") #'dap-debug)
  (define-key go-ts-mode-map (kbd "C-c d T")
              (lambda ()
                (interactive)
                (dap-debug
                 (dap--debug-configuration
                  "Go :: Debug test at point")))))

(use-package go-mod-ts-mode
  :ensure nil
  :mode
  (("/go\\.mod\\'" . go-mod-ts-mode)
   ("/go\\.sum\\'" . go-mod-ts-mode))
  :hook
  ((go-mod-ts-mode . lsp-deferred)
   ;; restart gopls only when go.mod/go.sum are saved (buffer-local)
   (go-mod-ts-mode . (lambda ()
                       (add-hook 'after-save-hook
                                 (lambda ()
                                   (when (lsp-workspaces)
                                     (lsp-restart-workspace)))
                                 nil t)))))

(with-eval-after-load 'project
  (add-to-list 'project-vc-extra-root-markers "go.mod"))

(with-eval-after-load 'lsp-mode
  ;; gopls settings (single source of truth)
  (lsp-register-custom-settings
   '(("gopls.staticcheck" t)
     ("gopls.gofumpt" t)
     ;; ("gopls.experimentalWorkspaceModule" t)
     ("gopls.expandWorkspaceToModule" t)
     ("gopls.directoryFilters" ["-vendor"])
     ("gopls.analyses.unusedparams" t)
     ("gopls.analyses.shadow" t)
     ("gopls.analyses.nilness" t)
     ("gopls.analyses.useany" t)
     ("gopls.env" ((GO111MODULE . "on"))))))

(with-eval-after-load 'flycheck
  ;; Usa golangci-lint in Go
  (add-hook 'go-ts-mode-hook
	    (lambda ()
	      (setq-local flycheck-checker 'golangci-lint)
	      (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
	      (flycheck-mode 1))))
 
(use-package dap-dlv-go
  :after (dap-mode go-ts-mode))

(with-eval-after-load 'dap-dlv-go
  ;; Debug all tests in module
  (dap-register-debug-template
   "Go :: Debug all tests"
   (list :type "go"
         :request "launch"
         :name "Go :: Debug all tests"
         :mode "test"
         :program "${workspaceFolder}"
         :cwd "${workspaceFolder}"))

  ;; Debug tests in current package
  (dap-register-debug-template
   "Go :: Debug package tests"
   (list :type "go"
         :request "launch"
         :name "Go :: Debug package tests"
         :mode "test"
         :program "${fileDirname}"
         :cwd "${fileDirname}"))

  ;; Debug test at point
  (dap-register-debug-template
   "Go :: Debug test at point"
   (list :type "go"
         :request "launch"
         :name "Go :: Debug test at point"
         :mode "test"
         :program "${fileDirname}"
         :cwd "${fileDirname}"
         :args (list "-test.run" "${input:testName}"))))

(add-hook 'dap-terminated-hook
          (lambda (_)
            (delete-other-windows)))
