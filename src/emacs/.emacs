; Setup MELPA package manager for Emacs
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

; Initialize all installed and default packages
(package-initialize)

; Load paths
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/packages")

; Themes
(load-theme 'github-dark-vscode t)

; Use text mode as default
(setq major-mode 'text-mode)

; Number of kills to keep in memory
(setq kill-ring-max 50)

; disable menu-bar-mode for extra screen real estate
; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

; Prevent extraneous tabs
(setq-default indent-tabs-mode nil)

; Show line numbers
(global-linum-mode t)

; Set code auto-complete to "M-tab" (TODO: Can this be done with Ivy)
(global-set-key (kbd "M-TAB") 'dabbrev-expand)

; Substitute yes/no responses to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; Make searches non-case-sensitive
(set-default 'case-fold-search t)

; Add a newline to the end of files on save if there is no newline
(setq require-final-newline t)

;; https://www.emacswiki.org/emacs/AutoSave
;;
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
;;(defvar autosave-dir (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
;;(defvar autosave-dir (concat (getenv "HOME") "/.emacs.d/autosaves/"))
(defvar autosave-dir (concat user-emacs-directory "autosaves"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; https://www.emacswiki.org/emacs/BackupDirectory
;;
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
;;(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
;; $HOME = (getenv "HOME") ;; e.g. /home/jontsai
;;(defvar backup-dir (concat (getenv "HOME") "/.emacs.d/backups"))
(defvar backup-dir (concat user-emacs-directory "backups"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;;;;;;;;;;;;;;;;;;;;;
; Configure Packages
;;;;;;;;;;;;;;;;;;;;;

; Setup Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; Setup Ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

; Setup Python iSort
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;;;;;;;;;;;;;;;;;;;;;
; Automatic Additions
;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flycheck package-lint ivy py-isort transpose-frame)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
