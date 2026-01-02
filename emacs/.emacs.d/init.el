(message "Welcome to Emacs")
(message "Loading user configuration...")
(message "Emacs profile: %s" fscotto/emacs-profile)

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
 'misc/dashboard
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
