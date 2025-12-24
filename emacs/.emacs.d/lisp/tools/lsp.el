(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  ((c-mode
    c-ts-mode
    c++-mode
    c++-ts-mode
    python-mode
    python-ts-mode
    sh-mode
    bash-ts-mode) . lsp-deferred)
  :config
  ;; Performance
  (setq lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-log-io nil
	lsp-modeline-code-actions-enable nil
	lsp-modeline-diagnostics-enable nil
	lsp-signature-auto-activate nil
	lsp-enable-on-type-formatting nil
        lsp-completion-provider :capf
	lsp-diagnostics-provider :flycheck
        lsp-headerline-breadcrumb-enable nil
	lsp-enable-indentation nil
	;; Disable for huge projects
	lsp-enable-file-watchers nil
        lsp-idle-delay 0.5)
  ;; Clangd configurations
  (setq lsp-clients-clangd-args
	'("--background-index"
	  "--clang-tidy"
	  "--completion-style=detailed"
	  "--header-insertion=never"
	  "--header-insertion-decorators"
	  "--pch-storage=memory"
	  "--log=error"
	  "--ranking-model=heuristics"
	  "--malloc-trim"
	  "--limit-results=500"
	  "--limit-references=2000")))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-enable t
      lsp-ui-doc-delay 0.3
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-code-actions t))

(use-package consult-lsp
  :ensure t
  :after (consult lsp-mode)
  :commands
  (consult-lsp-symbols
   consult-lsp-diagnostics))

(provide 'lsp)

;;; lsp.el ends here
