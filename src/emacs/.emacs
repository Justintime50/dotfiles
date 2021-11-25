;;; .emacs --- Emacs configuration file

;; Copyright (C) 2021, Justintime50

;; Homepage: https://github.com/justintime50/dotfiles
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

;;; Commentary:

;; My personal Emacs configuration file

;;; Code:

;;;;;;;;;;;;;;;;;
;; Initialization
;;
;; Must load in the following order:
;; 1. require package
;; 2. setup package archives
;; 3. initialize package
;; 4. setup everything else
;;;;;;;;;;;;;;;;;

;; Import the main package
(require 'package)

;; Setup package archives for Emacs
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("myelpa" . "https://raw.githubusercontent.com/Justintime50/myelpa/main/src/")))

;; Initialize all installed and default packages
(package-initialize)

;; Setup `use-package` for package management
(require 'use-package)
 ;; Always install missing packages on startup
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; Keep installed packages up to date automatically
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;;;;;;;;;;;;;;;;;
;; Emacs Settings
;;;;;;;;;;;;;;;;;

;; Load paths
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(add-to-list 'load-path (concat user-emacs-directory "packages"))

;; Setup theme
(load-theme 'github-dark-vscode t)

;; There are a plethora of articles on how Emacs is broken with TLS, disable v1.3 as needed
;; TODO: In the future, maybe this won't be needed and it can be removed
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Use text mode as default
(setq major-mode 'text-mode)

;; Number of kills to keep in memory
(setq kill-ring-max 50)

;; disable menu-bar-mode for extra screen real estate
;; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

;; Prevent extraneous tabs
(setq-default indent-tabs-mode nil)

;; Show line numbers
(global-linum-mode t)

;; Set code auto-complete to "M-tab" (TODO: Can this be done with Ivy)
(global-set-key (kbd "M-TAB") 'dabbrev-expand)

;; Substitute yes/no responses to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Make searches non-case-sensitive
(set-default 'case-fold-search t)

;; Add a newline to the end of files on save if there is no newline
(setq require-final-newline t)

;; Remove trailing whitespaces on file save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Configurations
;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package github-dark-vscode-theme)

(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

(use-package package-lint)

(use-package py-isort
  :init
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package shfmt
  :init
  (add-hook 'sh-mode-hook 'shfmt-on-save-mode))

(use-package transpose-frame)

;;;;;;;;;;;;;;;;;;;;;;
;; Automatic Additions
;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(github-dark-vscode-theme shfmt transpose-frame py-isort use-package package-lint ivy flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; .emacs ends here
