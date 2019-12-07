(package-initialize)

;; Aggiunge il repository melpa
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Configurazione di Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is you old M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Elimina lo screen allo startup
(setq inhibit-startup-screen t)

;; Elimina la menù bar
(menu-bar-mode 0)

;; Elimina la toolbar
(tool-bar-mode 0)

(ido-mode 1)

;; Configura il font di default
(set-default-font "Fira Code-12")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Imposta il backup della configurazione
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
