;;; org.el -*- lexical-binding: t; -*-

(use-package htmlize
  :ensure t)

(use-package org
  :init
  (setq org-clock-mode-line-total 'today
        org-fontify-quote-and-verse-blocks t
        org-indent-mode t
        org-return-follows-link t
        org-startup-folded 'content
        org-todo-keywords '((sequence "🆕(t)" "▶️(s)" "⏳(w)" "🔎(p)" "|" "✅(d)" "🗑(c)" "👨(g)")))
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode))

(use-package org-bullets
  :ensure t
  :init
  (setq org-bullets-bullet-list '("❯" "❯❯" "❯❯❯" "❯❯❯❯" "❯❯❯❯❯"))
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package org-re-reveal
  :ensure t
  :init
  (setq org-re-reveal-transition 'none
        org-re-reveal-theme "dracula"))

(use-package ob-mermaid
  :ensure t
  :init
  (setq ob-mermaid-cli-path "mmdc")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((mermaid . t)
     (scheme . t))))


;; Setting default directory for Org files
(setq org-directory "~/Remotes/pCloud/Org")

(provide 'org)

;;; org.el ends here
