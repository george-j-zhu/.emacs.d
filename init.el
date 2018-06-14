;;; init.el --- Custom Emacs Configuration

;; Author: Jiajun Zhu
;; URL: https://github.com/george-j-zhu/.emacs.d/init.el

(setq debug-on-error t)
(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'package)

(defvar my-packages
  '(better-defaults
    cyberpunk-theme
    elpy
    exec-path-from-shell
    fill-column-indicator
    flycheck
    js2-mode
    json-mode
    magit
    markdown-mode
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    web-mode
    yaml-mode
    dockerfile-mode))

(add-to-list 'package-archives
             '("MELPA Stable" . "http://stable.melpa.org/packages/"))
;; latest repository
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.org/packages/"))

(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'better-defaults)

;; basic settings
(setq inhibit-startup-message t
      linum-format "%4d \u2502 "
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-startup-message t
      mac-command-modifier 'meta
      mac-option-modifier nil
      sml/no-confirm-load-theme t
      yas-global-mode 1
      custom-file "~/.emacs.d/custom.el"
      magit-auto-revert-mode 0
      magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1
      x-select-enable-clipboard t)

;; lock and backup file settings(disabled)
(setq create-lockfiles nil) ;; disable lock-files
(setq make-backup-files nil) ;; disable backup-files
;;(setq delete-auto-save-files t)
(setq auto-save-default nil) ;; disable auto-save

;; encoding settings
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8-unix)

;; line numer mode setting
(global-linum-mode t)
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; modify ibuffer-formats to set name column wider
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) " " filename)
        (mark " "
              (name 16 -1) " " filename)))

(load-theme 'cyberpunk t)
(windmove-default-keybindings)
(defalias 'yes-or-no-p 'y-or-n-p)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; smart mode line settings
(sml/setup)
(add-to-list 'sml/replacer-regexp-list
             '("^~/go" ":go:") t)
(add-to-list 'sml/replacer-regexp-list
             '("^/bitly/src/github.com/bitly/bitly" ":bitly:") t)

(require 'development)

(load custom-file)

(defvar emacs_home (getenv "EMACS_HOME"))
;;(setq default-directory emacs_home)

;;; key bind settings
;;; move multiple lines
(global-set-key "\M-n" (kbd "C-u 5 C-n"))
(global-set-key "\M-p" (kbd "C-u 5 C-p"))

;;; init.el ends here
