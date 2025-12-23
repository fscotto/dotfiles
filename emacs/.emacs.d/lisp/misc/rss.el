;;; rss.el -*-

(use-package elfeed
  :ensure t
  :custom
  (elfeed-enclosure-default-dir "~/Downloads/")
  (elfeed-search-remain-on-entry t)
  (elfeed-search-title-max-width 100)
  (elfeed-search-title-min-width 30)
  (elfeed-search-trailing-width 25)
  (elfeed-show-truncate-long-urls t)
  (elfeed-sort-order 'descending)
  (elfeed-search-filter "+unread")
  :bind
  ("C-c o f" . fscotto/elfeed-load-db-and-open)
  (:map elfeed-search-mode-map
        ("w" . elfeed-search-yank)
        ("R" . elfeed-update)
        ("q" . elfeed-kill-buffer))
  (:map elfeed-show-mode-map
        ("S"     . elfeed-show-new-live-search) ; moved to free up 's'
        ("c"     . (lambda () (interactive) (org-capture nil "capture")))
        ("e"     . email-elfeed-entry)
        ("f"     . elfeed-show-fetch-full-text)
        ("w"     . elfeed-show-yank))
  :hook
  (elfeed-show-mode . visual-line-mode))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :custom
  ;; Optionally specify a number of files containing elfeed
  ;; configuration. If not set then the location below is used.
  ;; Note: The customize interface is also supported.
  (rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

(with-eval-after-load 'elfeed
  (elfeed-org))
