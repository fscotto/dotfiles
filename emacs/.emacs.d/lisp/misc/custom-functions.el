;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun fscotto/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening URL https://pragmaticemacs.wordpress.com/2016/08/17/read-your-rss-feeds-in-emacs-with-elfeed/
  Created: 2016-08-17
  Updated: 2025-06-13"
  (interactive)
  (elfeed)
  (elfeed-db-load)
  ;; (elfeed-search-update--force)
  (elfeed-update)
  (elfeed-db-save))

(defun fscotto/project-root ()
  "Return projectile project root or fallback to default-directory."
  (if (featurep 'projectile)
      (or (projectile-project-root) default-directory)
    default-directory))

(defun fscotto/project-vterm ()
  "Open vterm in project root."
  (interactive)
  (let ((default-directory (fscotto/project-root)))
    (vterm)))

(defun fscotto/project-magit-status ()
  "Open magit-status in project root."
  (interactive)
  (let ((default-directory (fscotto/project-root)))
    (magit-status)))

(defun fscotto/magit-dispatch ()
  "Load Magit if necessary and open magit-dispatch."
  (interactive)
  (require 'magit)
  (call-interactively #'magit-dispatch))

(defun fscotto/disable-c-formatting ()
  (setq-local lsp-enable-on-type-formatting nil))

;; Golang development support functions
(defun fscotto/go-format-on-save ()
  "Format Go buffers on save using gofmt."
  (add-hook 'before-save-hook #'lsp-format-buffer nil t))

(defun fscotto/go-mod-tidy ()
  "Esegue go mod tidy nella root del progetto."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile "go mod tidy")))

(defun fscotto/go-mod-download ()
  "Scarica i moduli Go."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile "go mod download")))

(defun fscotto/go-mod-after-save ()
  (when (and (eq major-mode 'go-mod-ts-mode)
             (lsp-workspaces))
    (lsp-restart-workspace)))

(defun fscotto/go-test-package ()
  "Run `go test` in the current package."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile "go test")))

(defun fscotto/go-test-module ()
  "Run `go test ./...` in the current Go module."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (compile "go test ./...")))

(defun fscotto/go-test-current-test ()
  "Run `go test -run` for the test at point."
  (interactive)
  (let* ((test-name (thing-at-point 'symbol t))
         (default-directory (project-root (project-current t))))
    (unless test-name
      (user-error "No test name at point"))
    (compile (format "go test -run '^%s$'" test-name))))

(defun fscotto/go-test-at-point ()
  "Return Go test name at point."
  (let ((sym (thing-at-point 'symbol t)))
    (unless (and sym (string-prefix-p "Test" sym))
      (user-error "No Go test at point"))
    sym))
