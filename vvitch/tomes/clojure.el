(use-package clojure-mode
  :mode ((".clj" . clojure-mode)
         (".cljx" . clojure-mode)
         (".cljs" . clojurescript-mode))
  :config
  (add-hook 'clojure-mode-hook #'subword-mode)
  :general
  (:prefix vvitch-local-leader
           :keymaps 'normal
           "c" '(:ignore t :which-key "convert")
           "c{" 'clojure-convert-collection-to-map
           "c(" 'clojure-convert-collection-to-list
           "c'" 'clojure-convert-collection-to-quoted-list
           "c#" 'clojure-convert-collection-to-set
           "c[" 'clojure-convert-collection-to-vector))

(use-package cider
  :hook (clojure-mode-hook)
  :config
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  (setq cider-prompt-for-symbol nil)
  (setq cider-eldoc-display-for-symbol-at-point 'truncate-sym-name-if-fit)
  (setq cider-eldoc-display-context-dependent-info t)
  :general
  (:prefix vvitch-local-leader
           :keymaps 'normal
           "b" '(:ignore t :which-key "buffers")
           "bb" 'cider--switch-to-repl-buffer

           "h" '(:ignore t :which-key "help")
           "ha" 'cider-apropos
           "hh" 'cider-doc
           "hg" 'cider-grimoire
           "hj" 'cider-javadoc
           "hn" 'cider-browse-ns

           "e" '(:ignore t :which-key "eval")
           "eb" 'cider-eval-buffer
           "ee" 'cider-eval-last-sexp
           "ef" 'cider-eval-defun-at-point
           "em" 'cider-macroexpand-1
           "eM" 'cider-macroexpand-all
           "er" 'cider-eval-region
           "ew" 'cider-eval-last-sexp-and-replace

           "="  '(cider-format-buffer :wk "format buffer")

           "g" '(:ignore t :which-key "goto")
           "eb" 'cider-eval-buffer
           "gb" 'cider-pop-back
           "gC" 'cider-classpath
           "ge" 'cider-jump-to-compilation-error
           "gr" 'cider-jump-to-resource
           "gn" 'cider-browse-ns
           "gN" 'cider-browse-ns-all

           "'"  '(cider-jack-in :wk "connect repl")
           "\"" '(cider-jack-in-clojurescript :wk "connect repl cljs")

           "r" '(:ignore t :which-key "repl")
           "rb" 'cider-load-buffer
           "rC" 'cider-find-and-clear-repl-output
           "ro" 'cider-repl-switch-to-other
           "rq" 'cider-quit
           "rx" 'cider-refresh

           "T" '(:ignore t :which-key "toggle")
           "Te" 'cider-enlighten-mode
           "Tt" 'cider-auto-test-mode

           "t" '(:ignore t :which-key "test")
           "tb" 'cider-test-show-report

           "d" '(:ignore t :which-key "debug")
           "db" 'cider-debug-defun-at-point
           "dv" 'cider-inspect))

(use-package clj-refactor
  :hook (clojure-mode-hook cider-repl-mode-hook)
  :config
  (setq cljr-warn-on-eval nil)
  (setq cljr-favor-prefix-notation nil))

(use-package flycheck-clojure
  :ensure t)

(provide 'vvitch-clojure)
