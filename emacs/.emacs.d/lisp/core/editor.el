;;; core-editor

(setq standard-indent 4)
(setq tab-stop-list nil)
(setq indent-tabs-mode nil)

;; C / C++ fallback style (Linux-like)
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 8)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode t)))

;; Tree-sitter C/C++
(setq c-ts-mode-indent-offset 4)
(setq c++-ts-mode-indent-offset 4)

;; Setting variables
(setq vc-follow-symlinks 't)
(prefer-coding-system 'utf-8-unix)
(setq custom-file (null-device))
