(with-eval-after-load 'flycheck
  (add-hook 'bash-ts-mode-hook 'flycheck-mode))

(use-package reformatter
  :ensure t
  :config
  (reformatter-define shfmt-format
    :program "shfmt"
    :args '("-i" "2" "-ci")))

(add-hook 'bash-ts-mode-hook #'shfmt-format-on-save-mode)
