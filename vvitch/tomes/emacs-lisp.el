(use-package highlight-defined
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode))

(use-package highlight-quoted
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))

(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode))
