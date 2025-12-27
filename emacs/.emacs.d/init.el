(message "Welcome to Emacs")
(message "Loading user configuration...")

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

;;=====================================================================================
;; Load modules
;;=====================================================================================
(fscotto/load-modules
 ;; Core
 'core/packages
 'core/ui
 'core/performance
 'core/editor
 'core/keybindings
 'core/buffer

 ;; Tools
 'tools/completion
 'tools/project
 'tools/lsp
 'tools/dap
 'tools/treesitter

 ;; Languages
 'lang/c
 'lang/docker
 'lang/golang
 'lang/json
 'lang/markdown
 'lang/org
 'lang/shell
 'lang/yaml

 ;; Misc
 'misc/custom-functions
 'misc/doom-modeline
 'misc/which-key
 'misc/email
 'misc/rss
 'misc/terminal
 'misc/vcs
 ;; FIXME PDF viewer with annotations
 ;; 'misc/pdf
 'misc/epub
 'misc/i3-config)

(message "...user configuration loaded")
