

(defun jbr-init ()
  "Called from term-setup-hook after the default
terminal setup is
done or directly from startup if term-setup-hook not
used.  The value
0xF030 is the command for maximizing a window."
  (interactive)
  (w32-send-sys-command #xf030)
;  (ecb-redraw-layout)
  (calendar)
)
(setq term-setup-hook 'jbr-init)
(setq window-setup-hook 'jbr-init)

;; ====================
;; insert date and time

(defvar current-date-time-format "%d %b %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "* ")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key [(control c)(d)]  'insert-current-date-time)
(global-set-key  [(control c)(t)] 'insert-current-time)


;;GUI setting
(set-scroll-bar-mode nil)
(tool-bar-mode nil)

(setq default-directory "/mnt/hgfs/workspaces/")
(fset 'yes-or-no-p 'y-or-n-p)

(setq column-number-mode t)
(setq line-number-mode t)

(setq scroll-margin 3 scroll-conservatively 10000)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)  
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey30" :foreground "gainsboro" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New")))))
