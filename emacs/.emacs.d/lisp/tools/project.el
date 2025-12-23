(use-package projectile
  :ensure t
  :defer 1
  :init
  ;; Root detection
  (setq projectile-project-search-path '("~/Projects" "~/Work"))
  (setq projectile-completion-system 'ivy)
  :config
  ;; Performance
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-sort-order 'recently-active)
  ;; Projectile as single source of truth
  (setq projectile-switch-project-action #'projectile-dired)
  ;; Use ripgrep if available
  (when (executable-find "rg")
    (setq projectile-generic-command "rg --files --hidden --glob '!.git'"))
  ;; Enable globally
  (projectile-mode 1))

;; Projectile keybindings (Doom-style)
(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(with-eval-after-load 'projectile
  (define-key projectile-command-map (kbd "v") #'fscotto/project-vterm))

(with-eval-after-load 'projectile
  (define-key projectile-command-map (kbd "g") #'fscotto/project-magit-status))
