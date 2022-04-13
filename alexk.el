(defface hl-todo-TODO-face
  '((t (:underline t :foreground "Dark Red" :inherit (hl-todo))))
  "Face for highlighting TODO keyword."
  :group 'hl-todo)

(defface hl-todo-FIXME-face
  '((t (:underline t :foreground "Dark Magenta" :inherit (hl-todo))))
  "Face for highlighting FIXME keyword."
  :group 'hl-todo)

(defface hl-todo-DEBUG-face
  '((t (:underline t :foreground "Dark Cyan" :inherit (hl-todo))))
  "Face for highlighting DEBUG keyword."
  :group 'hl-todo)
(defface hl-todo-MAKE-face
  '((t (:underline t :foreground "Dark Orange" :inherit (hl-todo))))
  "Face for highlighting MAKE keyword."
  :group 'hl-todo)

(defface hl-todo-NOTE-face
  '((t (:underline t :foreground "Dark Khaki" :inherit (hl-todo))))
  "Face for highlighting NOTE keyword"
  :group 'hl-todo)

(defface hl-todo-DONE-face
  '((t (:underline t :foreground "Dark Green" :inherit (hl-todo))))
  "Face for highlighting DONE keyword."
  :group 'hl-todo)

(use-package hl-todo
  :init (hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
  '(("TODO"  . hl-todo-TODO-face)
    ("FIXME" . hl-todo-FIXME-face)
    ("DEBUG" . hl-todo-DEBUG-face)
    ("MAKE"  . hl-todo-MAKE-face)
    ("NOTE"  . hl-todo-NOTE-face)
    ("DONE"  . hl-todo-DONE-face)))
  :bind
  (("C-c p" . hl-todo-previous)
   ("C-c n" . hl-todo-next)
   ("C-c o" . hl-todo-occur)
   ("C-c i" . hl-todo-insert)))

(use-package solarized-theme
  :init (load-theme 'solarized-light t))

(use-package keychain-environment
  :init (keychain-refresh-environment))

(use-package reverse-im
  :custom
  (reverse-im-input-methods '("russian-computer" "belarusian"))
  :config
  (reverse-im-mode t))

(use-package helpful
  :bind
  (("C-h f"   . #'helpful-callable)
   ("C-h v"   . #'helpful-variable)
   ("C-h k"   . #'helpful-key)
   ("C-h F"   . #'helpful-function)
   ("C-h C"   . #'helpful-command)
   ("C-c C-d" . #'helpful-at-point)))

(use-package which-key
  :config (which-key-mode))

(use-package minions
  :config (minions-mode))

(use-package init-javascript
  :load-path "init.d/")

;; Backup
(setq backup-directory-alist `(("." . "~/.emacs-saves"))
      backup-by-copying t)

(use-package elcord
  :custom
  ((elcord-display-buffer-details nil)
   (elcord-display-elapsed))
  :config
  (elcord-mode))

(use-package livedown
  :custom
 (livedown-autostart nil)
 (livedown-open t)
 (livedown-port 1337)
 (livedown-browser nil))
