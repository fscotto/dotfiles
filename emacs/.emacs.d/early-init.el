;;=====================================================================================
;; Define loader functions
;;=====================================================================================
(defconst fscotto/modules-dir
  (expand-file-name "lisp" user-emacs-directory))

(defun fscotto/load-module (module)
  "Load a MODULE from symbol."
  (let* ((module-name (symbol-name module))
         (path (expand-file-name
                (concat (replace-regexp-in-string "/" "/" module-name)
                        ".el")
                fscotto/modules-dir)))
    (unless (file-exists-p path)
      (error "Module not found: %s" path))
    (load path nil 'nomessage)))

(defun fscotto/load-modules (&rest modules)
  "Load MODULES."
  (mapc #'fscotto/load-module modules))

(defvar fscotto/emacs-profile
  (or (getenv "EMACS_PROFILE") "full"))
