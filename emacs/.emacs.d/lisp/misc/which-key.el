;;; which-key.el -*-

(use-package which-key
  :ensure t
  :defer 1
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.45
        which-key-idle-secondary-delay 0.05
        which-key-max-display-columns 3
        which-key-max-description-length 45))

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
    "C-c d b" "Toggle breakpoint")
    ;; "C-c d c" "Continue"
    ;; "C-c d n" "Next"
    ;; "C-c d i" "Step in"
    ;; "C-c d o" "Step out")

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
