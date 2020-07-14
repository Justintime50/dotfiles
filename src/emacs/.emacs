; Setup MELPA package manager for Emacs
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
 
; Set the theme to Monokai
(load-theme 'monokai t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (monokai-pro-theme monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
