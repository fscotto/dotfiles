;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(add-to-list 'my-packages 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  ;; Active debug mode
  ;;(setq exec-path-from-shell-debug t)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

