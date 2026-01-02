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

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)
  :config
  (setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))
  (add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight)))

(defun just-one-face (fn &rest args)
  (let ((orderless-match-faces [completions-common-part]))
    (apply fn args)))

(advice-add 'company-capf--candidates :around #'just-one-face)

(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

(provide 'completion)

;;; completion.el ends here
