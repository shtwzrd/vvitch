(defvar vvitch-root-dir (concat user-emacs-directory "vvitch/"))
(defvar vvitch-pkg-dir (concat user-emacs-directory "packages/"))
(defvar vvitch-etc-dir (concat user-emacs-directory "etc/"))
(defvar vvitch-var-dir (concat user-emacs-directory "var/"))
(defvar vvitch-leader "SPC")
(defvar vvitch-local-leader ",")

(defvar normal-gc-cons-threshold (* 20 1024 1024))
(defvar init-gc-cons-threshold   (* 512 1024 1024))

(setq gc-cons-threshold init-gc-cons-threshold)
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold normal-gc-cons-threshold)))

(unless (file-exists-p vvitch-pkg-dir)
  (make-directory vvitch-pkg-dir))
(unless (file-exists-p vvitch-etc-dir)
  (make-directory vvitch-etc-dir))
(unless (file-exists-p vvitch-var-dir)
  (make-directory vvitch-var-dir))

(setq custom-file (concat vvitch-etc-dir "custom.el"))

;; set early so we pull pkgs without getting asked to pick an encoding
                                        ;(prefer-coding-system 'utf-8)

(require 'package)
(setq package-enable-at-startup nil
      package-user-dir (expand-file-name "elpa" vvitch-pkg-dir)
      package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/"))
      gnutls-verify-error t
      tls-checktrust gnutls-verify-error)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load-file (concat vvitch-root-dir "cosmetics.el"))
(setq-default bidi-display-reordering nil)

(use-package no-littering
  :ensure t
  :config
  (progn
    (require 'no-littering)
    (require 'recentf)
    (setq no-littering-etc-directory vvitch-etc-dir)
    (setq no-littering-var-directory vvitch-var-dir)
    (setq auto-save-file-name-transforms
          `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
    (add-to-list 'recentf-exclude no-littering-var-directory)
    (add-to-list 'recentf-exclude no-littering-etc-directory)))

(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'evil-search
        evil-ex-complete-emacs-commands nil
        evil-vsplit-window-right t
        evil-split-window-below t
        evil-shift-round nil
        evil-want-C-u-scroll t)
  :config
  (evil-mode))

(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix vvitch-leader
   :non-normal-prefix "C-SPC"

   ;; Top level
   "R"   '(lambda () (interactive) (load-file "~/.emacs.d/init.el"))
   "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
   "/"   'counsel-ag
   ";"   '(counsel-M-x :which-key "M-x")
   "SPC" '(switch-to-other-buffer :which-key "prev buffer")
   "." '(avy-goto-word-or-subword-1  :which-key "go to char")

   ;; Files
   "f"  '(:ignore t :which-key "Files")
   "ff" '(counsel-find-file :which-key "find file")
   "fs" '(swiper :which-key "search in file")

   ;; Buffers
   "b"  '(:ignore t :which-key "Buffers")
   "bb" '(switch-to-buffer :which-key "swap buffer")

   ;; Applications
   "a" '(:ignore t :which-key "Applications")
   "ae" '(eshell :which-key "eshell")
   "as" '(shell :which-key "shell")

   ;; Windows
   "w"  '(:ignore t :which-key "Windows")
   "w/" '(evil-window-vsplit :which-key "vsplit")
   "w-" '(evil-window-split :which-key "split")
   "wj" '(evil-window-down :which-key "nav down")
   "wk" '(evil-window-up :which-key "nav up")
   "wh" '(evil-window-left :which-key "nav left")
   "wl" '(evil-window-right :which-key "nav right")
   "wJ" '(evil-window-move-very-bottom :which-key "move down")
   "wK" '(evil-window-move-very-top :which-key "move up")
   "wH" '(evil-window-move-far-left :which-key "move left")
   "wL" '(evil-window-move-far-right :which-key "move right")

   ))

(use-package which-key :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  (setq which-key-popup-type 'side-window
        which-key-side-window-max-height 0.5
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.5
        which-key-min-display-lines 7))

(load-file (concat vvitch-root-dir "quill.el"))
(load-file (concat vvitch-root-dir "broom.el"))

(defun load-directory (dir)
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory (concat vvitch-root-dir "tomes"))

(provide 'vvitch-boot)
