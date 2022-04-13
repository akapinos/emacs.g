;;; init-org.el

(require 'ox-bsu-lab-report)

(defun add-list-to-list (dst src)
  "Similar to `add-to-list', but accepts a list as 2nd argument"
  (set dst
       (append (eval dst) src)))

;; Default variables.
(setq fill-column 80
      org-hide-emphasis-markers t
      org-display-inline-images t
      org-redisplay-inline-images t
      org-startup-with-inline-images t
      org-startup-with-latex-preview t)

;;; Org-babel setup.
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively   t
      org-src-tab-acts-natively  t
      org-babel-python-command "python3")

;; Org-mode faces
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk        .t)
   (calc       .t)
   (emacs-lisp .t)
   (gnuplot    .t)
   (octave     .t)
   (perl       .t)
   (python     .t)
   (scheme     .t)
   (shell      .t)))

(setcdr (assoc "\\.pdf\\'" org-file-apps) 'emacs)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

(use-package org-mode
  :hook
  (org-mode . variable-pitch-mode)
  (org-mode . auto-fill-mode)
  (org-mode . visual-line-mode)
  (org-mode . org-indent-mode))

(use-package org-tempo
  :init
  (add-list-to-list 'org-structure-template-alist
		    '(("el"  . "src emacs-lisp")
		      ("ipy" . "src ipython")
		      ("py"  . "src python")
		      ("r"   . "src r")
		      ("sh"  . "src shell"))))

(provide 'init-org)
