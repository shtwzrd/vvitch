(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :bind (:map ivy-mode-map
	      ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-display-style 'fancy
	ivy-format-function 'ivy-format-function-line
	ivy-use-virtual-buffers t
	ivy-height 20
	ivy-count-format "(%d/%d) "))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t)
