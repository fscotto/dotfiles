;;; email.el -*-

(use-package mu4e
  :ensure nil
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :defer 20 ; Wait until 20 seconds after startup
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
