;; markdown.el -- custom markdown configuration

;; Author: Jiajun Zhu

(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

(require 'markdown-mode)
(define-key markdown-mode-map (kbd "\C-c \C-c \C-e") 'markdown-export)

(provide 'markdown)

;; markdown.el ends here
