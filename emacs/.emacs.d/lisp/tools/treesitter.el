;;; treesitter.el -*- lexical-binding: t; -*-

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

(provide 'treesitter)

;;; treesitter.el ends here
