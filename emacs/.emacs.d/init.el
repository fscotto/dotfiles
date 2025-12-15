;; Initial greeting for debugging
(message "Welcome to Emacs")
(message "Loading user configuration...")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  LOOK AND FEEL                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load default theme
(load-theme 'wombat)

;; Setting default font
(set-frame-font "Iosevka Nerd Font 14" nil t)

;; Remove toolbar
(tool-bar-mode -1)

;; Remove menu
(menu-bar-mode -1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable splash screen
(setq inhibit-splash-screen t)

;; Start all frames maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove scrollbar
(scroll-bar-mode -1)

;; Simple 'y' for 'yes' and 'n' for 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set global value for paragraph witdh
(setq-default fill-column 120)

;; Stop Emacs from losing informations
(setq undo-limit 8000000)
(setq undo-strong-limit 12000000)

;; Smooth scroll
(setq scroll-step 3)
(setq ring-bell-function 'ignore)

;; Add column number in the status line
(column-number-mode)

;; View clock in the status line
(display-time)

;; Enable line numbers in the programming mode only
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Enable line numbers in the configuration mode only
(add-hook 'conf-mode-hook 'display-line-numbers-mode)

;; Setting default directory for Org files
(setq org-directory "~/Remotes/pCloud/Org")

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

;; ---------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  EDITOR OPTIONS                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;
;; USER FUNCTIONS ;;
;;;;;;;;;;;;;;;;;;;;

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun fscotto/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening URL https://pragmaticemacs.wordpress.com/2016/08/17/read-your-rss-feeds-in-emacs-with-elfeed/
  Created: 2016-08-17
  Updated: 2025-06-13"
  (interactive)
  (elfeed)
  (elfeed-db-load)
  ;; (elfeed-search-update--force)
  (elfeed-update)
  (elfeed-db-save))

(defun fscotto/project-root ()
  "Return projectile project root or fallback to default-directory."
  (if (featurep 'projectile)
      (or (projectile-project-root) default-directory)
    default-directory))

(defun fscotto/project-dashboard ()
  "Open a project dashboard: root + Magit + LSP."
  (interactive)
  (let ((root (fscotto/project-root)))
    (dired root)
    (magit-status root)
    (lsp)))

(defun fscotto/project-vterm ()
  "Open vterm in project root."
  (interactive)
  (let ((default-directory (fscotto/project-root)))
    (vterm)))

(defun fscotto/project-magit-status ()
  "Open magit-status in project root."
  (interactive)
  (let ((default-directory (fscotto/project-root)))
    (magit-status)))

(defun fscotto/magit-dispatch ()
  "Load Magit if necessary and open magit-dispatch."
  (interactive)
  (require 'magit)
  (call-interactively #'magit-dispatch))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                     PACKAGES                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialize package system via use-package
;; (package-initialize)
(require 'use-package)

(use-package package
  :config
  ;; Setting repo priorities
  (setq package-archive-priorities
	'(("melpa-stable" . 2)
	  ("MELPA" . 1)
	  ("gnu" . 0)))
  ;; Setting repo URL
  (setq package-archives
	'(("melpa-stable" . "https://stable.melpa.org/packages/")
	  ("MELPA" . "https://melpa.org/packages/")
	  ("gnu" . "https://elpa.gnu.org/packages/"))))

;; Status line like Doom Emacs
(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-height 25
	doom-modeline-bar-width 3
	doom-modeline-project-detection 'projectile)
  :init (doom-modeline-mode 1))

;; Help to remember or discover keybindings
(use-package which-key
  :ensure t
  :defer 1
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.45
        which-key-idle-secondary-delay 0.05
        which-key-max-display-columns 3
        which-key-max-description-length 45))

;; ============================================================================
;; Doom-style which-key hierarchy for fscotto
;; ============================================================================

(with-eval-after-load 'which-key

  ;; --------------------------------------------------------------------------
  ;; Top-level prefixes
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-c !" "Analyze"
    "C-c o" "Open"
    "C-c v" "Version control"
    "C-c l" "LSP"
    "C-c t" "TODO / Annotations"
    "C-c b" "Buffers"
    "C-c p" "Project"
    "C-c d" "Debug"
    "C-c g" "Git"
    "C-c e" "Email / Elfeed")

  ;; --------------------------------------------------------------------------
  ;; Open (C-c o …)
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-c o f" "RSS (Elfeed)"
    "C-c o m" "mu4e (Email Client)"
    "C-c o T" "Terminal (vterm)")

  ;; --------------------------------------------------------------------------
  ;; Version control
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-c v g" "Magit status (legacy)")

  (which-key-add-key-based-replacements
    ;; Core
    "C-c g g" "Status"
    "C-c g s" "Status"
    ;; "C-c g b" "Branch"
    ;; "C-c g c" "Commit"
    "C-c g p" "Push / Pull"
    "C-c g f" "Fetch"
    "C-c g l" "Log"
    "C-c g S" "Stash"

    ;; Files
    "C-c g d" "Diff"
    "C-c g D" "Diff (cached)"
    "C-c g B" "Blame"

    ;; Rebase / Reset
    "C-c g r" "Rebase"
    "C-c g R" "Reset"

    ;; Remote
    "C-c g y" "Show refs"
    "C-c g o" "Browse remote")

  ;; --------------------------------------------------------------------------
  ;; Buffers
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-x C-b" "ibuffer")

  ;; --------------------------------------------------------------------------
  ;; TODO / hl-todo
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-t"   "hl-todo"
    "C-t p" "Previous TODO"
    "C-t n" "Next TODO"
    "C-t o" "Occur (list)"
    "C-t i" "Insert TODO")

  ;; --------------------------------------------------------------------------
  ;; LSP (C-c l …)
  ;; --------------------------------------------------------------------------
    (which-key-add-key-based-replacements
      ;; Navigation
      "C-c l d" "Go to definition"
      "C-c l D" "Go to type definition"
      "C-c l i" "Go to implementation"

      ;; Symbols / diagnostics
      "C-c l s" "Workspace symbols"
      "C-c l e" "Diagnostics"

      ;; Actions
      "C-c l a" "Code actions"
      "C-c l r" "Rename symbol"
      "C-c l f" "Format buffer"

      ;; Control
      "C-c l R" "Restart workspace")

  ;; --------------------------------------------------------------------------
  ;; Elfeed modes
  ;; --------------------------------------------------------------------------
    (which-key-add-key-based-replacements
      "w" "Yank"
      "R" "Update feeds"
      "q" "Quit")

  ;; --------------------------------------------------------------------------
  ;; Debug / DAP
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "C-c d d" "Start debug session"
    "C-c d b" "Toggle breakpoint"
    "C-c d c" "Continue"
    "C-c d n" "Next"
    "C-c d i" "Step in"
    "C-c d o" "Step out")

  ;; --------------------------------------------------------------------------
  ;; Project (future)
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    ;; Core
    "C-c p p" "Switch project"
    "C-c p f" "Find file"
    "C-c p d" "Find directory"
    "C-c p b" "Switch buffer"
    "C-c p k" "Kill project buffers"
    "C-c p r" "Recent files"

    ;; Search
    "C-c p s" "Search"
    "C-c p s g" "Grep (ripgrep)"
    "C-c p s r" "Replace in project"

    ;; Actions
    "C-c p c" "Compile"
    "C-c p t" "Test"
    "C-c p v" "Open term in project"
    "C-c p e" "Edit project config"
    "C-c p g" "Project Git status"
    "C-c p D" "Project Dashboard"
    "C-c p x" "Open Terminal"
    "C-c p 4" "Other Window"
    "C-c p 5" "Other Frame"
    "C-c p x 4" "Other Window"

    ;; Cache
    "C-c p i" "Invalidate cache")

  ;; --------------------------------------------------------------------------
  ;; Cleanup annoying +prefix
  ;; --------------------------------------------------------------------------
  (which-key-add-key-based-replacements
    "+prefix" "Prefix"
    "+lsp"    "LSP"
    "+debug"  "Debug"
    "+project" "Project"))

;; Configuration for mu4e, an interface for mu email index, running inside Emacs
(use-package mu4e
  :ensure nil
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :defer 20 ; Wait until 20 seconds after startup
  :bind (:map global-map ("C-c o m" . mu4e))
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "~/.emacs.d/scripts/email_sync.sh")
  (setq mu4e-maildir "~/Maildir")

    ;; Configure email accounts
  (setq mu4e-contexts
        (list
         ;; Protonmail Account
         (make-mu4e-context
          :name "Protonmail"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/ProtonMailAccount" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "fscottodisantolo@protonmail.com")
                  (user-full-name . "Fabio Scotto di Santolo")
                  (mu4e-drafts-folder . "/ProtonMailAccount/Drafts")
                  (mu4e-sent-folder . "/ProtonMailAccount/Sent")
                  (mu4e-refile-folder . "/ProtonMailAccount/All Mail")
                  (mu4e-trash-folder . "/ProtonMailAccount/Trash")))

         ;; iCloud Account
         (make-mu4e-context
          :name "iCloud Mail"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/iCloudAccount" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "fscottodisantolo@icloud.com")
                  (user-full-name . "Fabio Scotto di Santolo")
                  (mu4e-drafts-folder . "/iCloudAccount/Drafts")
                  (mu4e-sent-folder . "/iCloudAccount/Sent Messages")
                  (mu4e-refile-folder . "/iCloudAccount/INBOX")
                  (mu4e-trash-folder . "/iCloudAccount/Junk")))))

  (setq sendmail-program "/usr/bin/msmtp"
      send-mail-function 'sendmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail))

;; Configure elfeed for RSS feed
(use-package elfeed
  :ensure t
  :custom
  (elfeed-enclosure-default-dir "~/Downloads/")
  (elfeed-search-remain-on-entry t)
  (elfeed-search-title-max-width 100)
  (elfeed-search-title-min-width 30)
  (elfeed-search-trailing-width 25)
  (elfeed-show-truncate-long-urls t)
  (elfeed-sort-order 'descending)
  (elfeed-search-filter "+unread")
  :bind
  ("C-c o f" . fscotto/elfeed-load-db-and-open)
  (:map elfeed-search-mode-map
        ("w" . elfeed-search-yank)
        ("R" . elfeed-update)
        ("q" . elfeed-kill-buffer))
  (:map elfeed-show-mode-map
        ("S"     . elfeed-show-new-live-search) ; moved to free up 's'
        ("c"     . (lambda () (interactive) (org-capture nil "capture")))
        ("e"     . email-elfeed-entry)
        ("f"     . elfeed-show-fetch-full-text)
        ("w"     . elfeed-show-yank))
  :hook
  (elfeed-show-mode . visual-line-mode))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :custom
  ;; Optionally specify a number of files containing elfeed
  ;; configuration. If not set then the location below is used.
  ;; Note: The customize interface is also supported.
  (rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

(with-eval-after-load 'elfeed
  (elfeed-org))

;; Terminal
(use-package vterm
  :ensure t
  :bind (:map global-map
	      ("C-c o T" . vterm)
	      ("C-c C-t" . vterm-copy-mode)))

;; FIXME PDF viewer with annotations
;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install))

;; EPub viewer
(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

(use-package visual-fill-column
  :ensure t)

;; Git plugin
(use-package magit
  :ensure t
  :commands (magit-status magit-log)
  :init
  ;; Entry point principale
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  :config
  ;; Performance & UX
  (setq magit-refresh-status-buffer nil)
  (setq magit-repository-directories
	'(("~/Projects" . 2)
	  ("~/Work" . 2))))

;; Legacy alias (keep muscle memory)
(global-set-key (kbd "C-c v g") #'magit-status)

(global-set-key (kbd "C-c g") #'fscotto/magit-dispatch)

;; Git leader key (Doom-style)
;; (with-eval-after-load 'magit
;;   (define-key global-map (kbd "C-c g") 'magit-dispatch))

;; Highlight keywords to remember the activity when coding.
(use-package hl-todo
  :ensure t
  :commands (global-hl-todo-mode)
  :init (global-hl-todo-mode))

(setq hl-todo-keyword-faces
      '(("TODO"   . "#94e2d5")
        ("FIXME"  . "#f38ba8")
        ("DEBUG"  . "#cba6f7")
        ("GOTCHA" . "#eba0ac")
        ("STUB"   . "#89b4fa")))

(keymap-set hl-todo-mode-map "C-t p" #'hl-todo-previous)
(keymap-set hl-todo-mode-map "C-t n" #'hl-todo-next)
(keymap-set hl-todo-mode-map "C-t o" #'hl-todo-occur)
(keymap-set hl-todo-mode-map "C-t i" #'hl-todo-insert)

;; Highlight for i3 config file
(use-package i3wm-config-mode
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package consult
  :ensure t
  :defer t)

(use-package ibuffer
  :ensure t
  :bind (:map global-map ("C-x C-b" . ibuffer)))

(use-package ibuffer-tramp
  :ensure t)

(use-package ibuffer-vc
  :ensure t)

(use-package ibuffer-projectile
  :ensure t)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-projectile-set-filter-groups)))

;; ============================================================================
;; Projectile - Project management
;; ============================================================================

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

(global-set-key (kbd "C-c p D") #'fscotto/project-dashboard)

;; Add autocomplete feature to Emacs
(use-package company
    :ensure t
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1)
    :hook (prog-mode . company-mode))

;; Static analysis for code base
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  (setq treesit-auto-install 'prompt)
  (setq major-mode-remap-alist
	'((c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (python-mode . python-ts-mode)
          (bash-mode . bash-ts-mode)))
  (setq treesit-language-source-alist
	'((c "https://github.com/tree-sitter/tree-sitter-c")
          (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (bash "https://github.com/tree-sitter/tree-sitter-bash")
          (go "https://github.com/tree-sitter/tree-sitter-go"))))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c-mode
    c-ts-mode
    c++-mode
    c++-ts-mode
    python-mode
    python-ts-mode
    go-mode
    go-ts-mode
    bash-mode
    bash-ts-mode) . lsp-deferred)
  :config
  ;; Performance
  (setq lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-log-io nil
	lsp-modeline-code-actions-enable nil
	lsp-modeline-diagnostics-enable nil
	lsp-signature-auto-activate nil
	lsp-enable-on-type-formatting nil
        lsp-completion-provider :capf
	lsp-diagnostics-provider :flycheck
        lsp-headerline-breadcrumb-enable nil
	lsp-enable-indentation nil
	;; Disable for huge projects
	lsp-enable-file-watchers nil
        lsp-idle-delay 0.5)
  ;; Clangd configuration
  (setq lsp-clients-clangd-args
	'("--background-index"
	  "--clang-tidy"
	  "--completion-style=detailed"
	  "--header-insertion=never"
	  "--header-insertion-decorators"
	  "--pch-storage=memory"
	  "--log=error"
	  "--ranking-model=heuristics"
	  "--malloc-trim"
	  "--limit-results=500"
	  "--limit-references=2000"))  
  )

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-enable t
      lsp-ui-doc-delay 0.3
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-code-actions t))

(use-package consult-lsp
  :ensure t
  :after (consult lsp-mode)
  :commands
  (consult-lsp-symbols
   consult-lsp-diagnostics))

(with-eval-after-load 'lsp-mode
  ;; Symbols
  (global-set-key (kbd "C-c l s") #'consult-lsp-symbols)

  ;; Diagnostics
  (global-set-key (kbd "C-c l e") #'consult-lsp-diagnostics)

  ;; Navigation (LSP core)
  (global-set-key (kbd "C-c l d") #'lsp-find-definition)
  (global-set-key (kbd "C-c l D") #'lsp-find-type-definition)
  (global-set-key (kbd "C-c l i") #'lsp-find-implementation)

  ;; Actions
  (global-set-key (kbd "C-c l a") #'lsp-execute-code-action)
  (global-set-key (kbd "C-c l r") #'lsp-rename)
  (global-set-key (kbd "C-c l f") #'lsp-format-buffer)

  ;; Control
  (global-set-key (kbd "C-c l R") #'lsp-restart-workspace))

;;;;;;;;;;;;;;;;;;;;;;
;; Enable debuggers ;;
;;;;;;;;;;;;;;;;;;;;;;

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :commands dap-debug
  :init
  ;; Debug prefix
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)

  ;; Auto show breakpoints + REPL
  (setq dap-ui-buffer-configurations
        '((dap-ui-repl . ((side . right) (slot . 1) (window-width . 0.33)))
          (dap-ui-locals . ((side . right) (slot . 2) (window-width . 0.33)))
          (dap-ui-breakpoints . ((side . left) (slot . 1) (window-width . 0.20))))))

;; For C/C++
(require 'dap-gdb-lldb)
(setq dap-gdb-lldb-debug-program '("gdb"))

;; For Go
(require 'dap-go)

;; For Python
(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(with-eval-after-load 'dap-mode
  (global-set-key (kbd "C-c d d") #'dap-debug)
  (global-set-key (kbd "C-c d b") #'dap-breakpoint-toggle)
  (global-set-key (kbd "C-c d c") #'dap-continue)
  (global-set-key (kbd "C-c d n") #'dap-next)
  (global-set-key (kbd "C-c d i") #'dap-step-in)
  (global-set-key (kbd "C-c d o") #'dap-step-out)
  (global-set-key (kbd "C-c d r") #'dap-restart-frame)
  (global-set-key (kbd "C-c d q") #'dap-disconnect))

(message "...user configuration loaded")
