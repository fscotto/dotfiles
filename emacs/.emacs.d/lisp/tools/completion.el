;;; completion.el -*- lexical-binding: t; -*-

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package consult
  :ensure t
  :defer t)

(use-package company
    :ensure t
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1)
    :hook (prog-mode . company-mode))

(with-eval-after-load 'company
  (add-hook 'bash-ts-mode-hook 'company-mode))

;; Static analysis for code base
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (setq yas/root-directory
        (list "~/.emacs.d/snippets") yas-indent-line 'fixed)
  (yas-global-mode))

(provide 'completion)

;;; completion.el ends here
