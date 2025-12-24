;; c.el -*- lexical-binding: t; -*-

;; C / C++ fallback style (Linux-like)
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 8)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode t)))

;; Tree-sitter C/C++
(setq c-ts-mode-indent-offset 4)
(setq c++-ts-mode-indent-offset 4)

(with-eval-after-load 'lsp
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

(with-eval-after-load 'dap-mode
  (require 'dap-cpptools))

(add-hook 'c-ts-mode-hook #'fscotto/disable-c-formatting)
(add-hook 'c-mode-hook    #'fscotto/disable-c-formatting)

(provide 'c)

;;; c.el ends here
