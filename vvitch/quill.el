                                        ;(setq locale-coding-system 'utf-8
                                        ;      coding-system-for-read 'utf-8
                                        ;      coding-system-for-write 'utf-8)

                                        ;(setq-default buffer-file-coding-system 'utf-8)
                                        ;(set-charset-priority 'unicode)
                                        ;(prefer-coding-system 'utf-8)
                                        ;(set-terminal-coding-system 'utf-8)
                                        ;(set-keyboard-coding-system 'utf-8)
                                        ;(set-selection-coding-system 'utf-8)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'lisp-mode 'paredit-mode)
(add-hook 'clojure-mode 'paredit-mode)
(add-hook 'emacs-lisp-mode 'paredit-mode)

(setq save-interprogram-paste-before-kill t
      ring-bell-function 'ignore
      apropos-do-all t
      vc-follow-symlinks t
      fill-column 80
      mouse-yank-at-point t
      require-final-newline t
      sentence-end-double-space nil
      delete-trailing-lines nil
      indent-tabs-mode nil
      tab-always-indent t
      tab-width 4
      scroll-preserve-screen-position t
      hscroll-margin 8
      scroll-margin 8
      load-prefer-newer t)

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package company
  :hook (prog-mode . company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode 1)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (use-package flycheck-pos-tip
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

(use-package aggressive-indent
  :hook ((clojure-mode . aggressive-indent-mode)
         (emacs-lisp-mode . aggressive-indent-mode)))

(provide 'vvitch-quill)

