;;; markdown.el -*- lexical-binding: t; -*-
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(provide 'markdown)
;;; markdown.el ends here
