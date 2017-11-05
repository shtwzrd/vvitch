(defvar vvitch-mode-line
  '("%e" mode-line-front-space
    mode-line-mule-info
    mode-line-client mode-line-modified
    mode-line-remote mode-line-frame-identification
    mode-line-buffer-identification
    "   "
    mode-line-position
    evil-mode-line-tag
    (vc-mode vc-mode)
    "  "
    mode-line-modes
    mode-line-misc-info
    mode-line-end-spaces))

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
(when (fboundp 'fringe-mode)
  (fringe-mode 2))

(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode)
(line-number-mode)
(column-number-mode)
(save-place-mode)

(setq initial-major-mode 'fundamental-mode
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      mode-line-format nil
      echo-keystrokes 0.02)

(setq-default cursor-in-non-selected-windows nil
              display-line-numbers-width 3
              frame-inhibit-implied-resize t
              mode-line-format nil
              visible-cursor nil
              x-stretch-cursor nil
              image-animate-loop t
                  idle-update-delay 2
                  minibuffer-prompt-properties
                '(read-only t
              point-entered minibuffer-avoid-prompt face minibuffer-prompt)

              ;; improves performance (maybe?), Pillaged from DOOM
              jit-lock-defer-time nil
              jit-lock-stealth-nice 0.1
              jit-lock-stealth-time 0.2
              jit-lock-stealth-verbose nil

              header-line-format 'vvitch-mode-line)
