;;; development.el --- Load All Development Configuration

;;; Author: Jiajun Zhu

(require 'rainbow-delimiters)

(require 'fill-column-indicator)
(setq fci-rule-column 100)
(setq fci-rule-width 1)
(setq fci-rule-color "darkgrey")

(global-flycheck-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'fci-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(require 'python)
(require 'markdown)
(require 'javascript)
(require 'web)
(require 'json)

(provide 'development)

;;; development.el ends here
