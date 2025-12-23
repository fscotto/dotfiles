(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  (setq treesit-auto-install t)
  (setq major-mode-remap-alist
	'((c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
	  (go-mode . go-ts-mode)
	  (go-mod-mode . go-mod-ts-mode)
          (python-mode . python-ts-mode)
          (sh-mode . bash-ts-mode)))
  (setq treesit-language-source-alist
	'((c "https://github.com/tree-sitter/tree-sitter-c")
          (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (bash "https://github.com/tree-sitter/tree-sitter-bash")
          (go "https://github.com/tree-sitter/tree-sitter-go")
	  (gomod "https://github.com/camdencheek/tree-sitter-go-mod"))))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
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

(with-eval-after-load 'lsp-mode
  ;; Attach bash-language-server when open a shell scripts
  (add-hook 'sh-mode-hook #'lsp)

  ;; Symbols
  (global-set-key (kbd "C-c l s") #'consult-lsp-symbols)

  ;; Diagnostics
  (global-set-key (kbd "C-c l e") #'consult-lsp-diagnostics)

  ;; Navigation (LSP core)
  (global-set-key (kbd "C-c l d") #'lsp-find-definition)
  (global-set-key (kbd "C-c l D") #'lsp-find-type-definition)
  (global-set-key (kbd "C-c l i") #'lsp-find-implementation)

  ;; Actions
  (global-set-key (kbd "C-c l a") #'lsp-execute-code-action)
  (global-set-key (kbd "C-c l r") #'lsp-rename)
  (global-set-key (kbd "C-c l f") #'lsp-format-buffer)

  ;; Control
  (global-set-key (kbd "C-c l R") #'lsp-restart-workspace))
