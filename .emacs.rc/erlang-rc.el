(use-package ivy-erlang-complete
  :ensure t)

(use-package flycheck
  :ensure t
  :delight
  :config (global-flycheck-mode))

(use-package hydra
  :defer 2
  :bind ("C-c f" . hydra-flycheck/body))

(defhydra hydra-flycheck (:color blue)
  "
  ^
  ^Errors^
  ^──────^
  _<_ previous
  _>_ next
  _l_ list
  _q_ quit
  ^^
  "
  ("q" nil)
  ("<" flycheck-previous-error :color pink)
  (">" flycheck-next-error :color pink)
  ("l" flycheck-list-errors))

(use-package erlang
  :load-path ("/usr/lib/erlang/lib/tools-3.3/emacs/")
  :mode (("\\.erl?$" . erlang-mode)
	 ("rebar\\.config$" . erlang-mode)
	 ("relx\\.config$" . erlang-mode)
	 ("sys\\.config\\.src$" . erlang-mode)
	 ("sys\\.config$" . erlang-mode)
	 ("\\.config\\.src?$" . erlang-mode)
	 ("\\.config\\.script?$" . erlang-mode)
	 ("\\.hrl?$" . erlang-mode)
	 ("\\.app?$" . erlang-mode)
	 ("\\.app.src?$" . erlang-mode)
	 ("\\Emakefile" . erlang-mode)))

