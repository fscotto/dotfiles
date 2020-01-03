;;; RCs

(package-initialize)                    ;Package.el won't shut up
                                        ;without this line being
                                        ;specificaly here and not
                                        ;anywhere else ~_~

(load "~/.emacs.rc/rc.el")              ;It MUST keep here

(load "~/.emacs.rc/alchemist.el")
(load "~/.emacs.rc/appearance-rc.el")
(load "~/.emacs.rc/autocommit-rc.el")
(load "~/.emacs.rc/ccmode-rc.el")
(load "~/.emacs.rc/clojure-rc.el")
(load "~/.emacs.rc/company-rc.el")
(load "~/.emacs.rc/dired-rc.el")
(load "~/.emacs.rc/editorconfig-rc.el")
(load "~/.emacs.rc/emacs-lisp-rc.el")
(load "~/.emacs.rc/eldoc-mode-rc.el")
(load "~/.emacs.rc/erlang-rc.el")
(load "~/.emacs.rc/haskell-mode-rc.el")
(load "~/.emacs.rc/ido-smex-rc.el")
(load "~/.emacs.rc/js2-mode-rc.el")
(load "~/.emacs.rc/latex-mode-rc.el")
(load "~/.emacs.rc/magit-rc.el")
(load "~/.emacs.rc/misc-rc.el")
(load "~/.emacs.rc/move-text-rc.el")
(load "~/.emacs.rc/multiple-cursors-rc.el")
(load "~/.emacs.rc/nasm-mode-rc.el")
(load "~/.emacs.rc/nxml-mode-rc.el")
(load "~/.emacs.rc/openwith-rc.el")
(load "~/.emacs.rc/org-mode-rc.el")
(load "~/.emacs.rc/org-cliplink-rc.el")
(load "~/.emacs.rc/org-babel-rc.el")
(load "~/.emacs.rc/org-capture-rc.el")
(load "~/.emacs.rc/paredit-rc.el")
(load "~/.emacs.rc/rainbow-rc.el")
(load "~/.emacs.rc/recentf-mode-rc.el")
(load "~/.emacs.rc/shell-integration-rc.el")
(load "~/.emacs.rc/tide-rc.el")
(load "~/.emacs.rc/tramp-rc.el")
(load "~/.emacs.rc/word-wrap-rc.el")
(load "~/.emacs.rc/yasnippet-rc.el")

(add-to-list 'auto-mode-alist '("\\.ebi\\'" . lisp-mode))

;;; Packages that don't require configuration
(rc/require
 'elixir-mode
 'yaml-mode
 'glsl-mode
 'tuareg
 'less-css-mode
 'graphviz-dot-mode
 'clojure-mode
 'cmake-mode
 'jinja2-mode
 'markdown-mode
 'nix-mode
 'dockerfile-mode
 'love-minor-mode
 'toml-mode
 'ag
 'hindent
 'elpy
 'typescript-mode
 )

(load "~/.emacs.shadow/shadow-rc.el" t)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)
