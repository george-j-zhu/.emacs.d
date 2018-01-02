;; javascript.el -- custom javascript configuration

;; Author: Jiajun Zhu

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)
(setq-default js2-basic-offset 4)

(provide 'javascript)

;; javascript.el ends here
