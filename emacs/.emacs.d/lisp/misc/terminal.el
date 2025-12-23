;;; terminal.el -*-

(use-package vterm
  :ensure t
  :bind (:map global-map
	      ("C-c o T" . vterm)
	      ("C-c C-t" . vterm-copy-mode)))
