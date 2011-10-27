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
