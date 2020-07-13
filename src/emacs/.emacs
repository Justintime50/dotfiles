; Use text mode as default
(setq major-mode 'text-mode)

; Number of kills to keep in memory
(setq kill-ring-max 50)
                                     ;
; disable menu-bar-mode for extra screen real estate
; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

(setq-default indent-tabs-mode nil)
(global-linum-mode t)

; Substitute yes/no responses to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; Make searches non-case-sensitive
(set-default 'case-fold-search t)

; Add a newline to the end of files on save if there is no newline
(setq require-final-newline t)
