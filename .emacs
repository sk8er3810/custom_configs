(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)
(column-number-mode)
;(setq make-backups-files nil)
(setq-default backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t   ; Don't delink hardlinks
  version-control t     ; Version numbers
  delete-old-versions t ; Automatically delete old backups
  keep-new-versions 20  ; how many of the newest versions to keep
  kept-old-versions 5   ; and how many of the old
  )
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Add php and html modes for smarty templates 
(add-to-list 'load-path "~/.emacs.d/modes")
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))

;; save sessions
(desktop-save-mode 1)

;; Remove splash screen
(setq inhibit-startup-message t)
