;;; core-performance.el -*-

;; --- Startup speed tweaks ----------------------------------------------------
;; Temporarily increase GC threshold during init
(defvar fscotto/gc-cons-threshold-orig gc-cons-threshold)
(setq gc-cons-threshold (* 50 1000 1000)) ;; 50MB for init

;; Speedup file-name-handler during init
(defvar fscotto/file-name-handler-alist-orig file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Restore after init
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold fscotto/gc-cons-threshold-orig)
            (setq file-name-handler-alist fscotto/file-name-handler-alist-orig)
            (garbage-collect)))

;; LSP responsiveness
(setq read-process-output-max (* 1024 1024)) ;; 1MB, utile per lsp-mode
(setq lsp-idle-delay 0.5) ;; meno ritardo prima che LSP aggiorni info
(setq inhibit-compacting-font-caches t)
