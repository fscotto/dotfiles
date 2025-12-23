(message "Welcome to Emacs")
(message "Loading user configuration...")

;; Core
(load "~/.emacs.d/lisp/core/packages.el")
(load "~/.emacs.d/lisp/core/ui.el")
(load "~/.emacs.d/lisp/core/performance.el")
(load "~/.emacs.d/lisp/core/editor.el")
(load "~/.emacs.d/lisp/core/keybindings.el")

;; Tools
(load "~/.emacs.d/lisp/tools/completion.el")
(load "~/.emacs.d/lisp/tools/project.el")
(load "~/.emacs.d/lisp/tools/lsp.el")
(load "~/.emacs.d/lisp/tools/dap.el")

;; Languages
(load "~/.emacs.d/lisp/lang/c.el")
(load "~/.emacs.d/lisp/lang/golang.el")
(load "~/.emacs.d/lisp/lang/shell.el")

;; Misc
(load "~/.emacs.d/lisp/misc/custom-functions.el")
(load "~/.emacs.d/lisp/misc/doom-modeline.el")
(load "~/.emacs.d/lisp/misc/which-key.el")
(load "~/.emacs.d/lisp/misc/email.el")
(load "~/.emacs.d/lisp/misc/rss.el")
(load "~/.emacs.d/lisp/misc/terminal.el")
(load "~/.emacs.d/lisp/misc/vcs.el")
;; FIXME PDF viewer with annotations
;; (load "~/.emacs.d/lisp/misc/pdf.el")
(load "~/.emacs.d/lisp/misc/epub.el")
(load "~/.emacs.d/lisp/misc/i3-config.el")

(message "...user configuration loaded")
