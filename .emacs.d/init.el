;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Funzioni di servizio
(defvar rc/package-contents-refreshed nil)
(defvar rc/required-packages nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (push package rc/required-packages)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))

(defun rc/require-theme (theme)
  (let ((theme-package (->> theme
                            (symbol-name)
                            (funcall (-flip #'concat) "-theme")
                            (intern))))
    (rc/require theme-package)
    (load-theme theme t)))

(rc/require 'dash)
(require 'dash)

(rc/require 'dash-functional)
(require 'dash-functional)

(defun rc/package-reqs (package)
  (let ((package-desc
         (->> package-alist
              (alist-get package)
              (car))))
    (when package-desc
      (package-desc-reqs package-desc))))

(defun rc/package-dependencies (package)
  (->> package
       (rc/package-reqs)
       (-map #'car)
       (cons package)))

(defun rc/package-expand-dependencies (packages)
  (->> packages
       (-map #'rc/package-dependencies)
       (-flatten)
       (remove-duplicates)))

(defun rc/unused-packages ()
  (let ((all-package (rc/package-expand-dependencies rc/required-packages)))
    (->> package-alist
         (-map #'car)
         (-filter (-lambda (package)
                    (not (-contains? all-package package)))))))

(defun rc/remove-unused-packages ()
  (interactive)
  (message "Unused packages: %s" (rc/unused-packages)))

;; Carica il file con delle configurazioni,
;; la configurazione è un file scritto con org-mode.
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
		   user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-exporter-settings (quote ((org-agenda-tag-filter-preset (list "+personal")))))
 '(org-enforce-todo-dependencies nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-refile-use-outline-path (quote file))
 '(package-selected-packages
   (quote
    (exec-path-from-shell yasnippet rainbow-mode org-cliplink openwith nasm-mode multiple-cursors move-text ido-completing-read+ smex editorconfig company atom-one-dark-theme paredit material-theme magit lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
