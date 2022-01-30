

(use-package js2-mode
  :interpreter (("node" . js2-mode))
  :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2
        js2-highlight-level 3
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)
  :hook (js-mode . js2-minor-mode))

(use-package js-comint
  :bind (("C-c C-n" . js-comint-repl)
	 ("C-c C-r" . js-comint-send-region)
	 ("C-c C-c" . js-comint-send-buffer)))

(use-package skewer-mode
  :bind (("C-c K" . run-skewer))
  :init
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode))

(provide 'init-javascript)
