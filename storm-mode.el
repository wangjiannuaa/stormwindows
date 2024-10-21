;;; storm.el --- Support for computer programming language  -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2025 Jian .P. Wang


;; Author: Wang Jian <wangjiantsinghua@qq.com>
;; Maintainer: Someone Else <someone@example.com>
;; Created: 14 Jul 2010

;; Keywords: 
;; URL: https://alllala.com/index

;; This file is not part of GNU Emacs.

;; This file is free software

;; along with this file.  If not, see <https://www.gnu.org/licenses/>.
(require 'semantic)
(require 'imenu)

;(defun turn-on-storm-mode()
 ; "minor mode switcher"
 ; (unless 'storm-mode
  ;    (storm-mode t)
  ;  (storm-mode nil)
 ; )
;)


;(defvar storm-mode nil
;  "Dummy variable to suppress compiler warnings."
;)



;;;###autoload
(define-minor-mode storm-mode
  "storm mode"
  :init-value  nil
  :lighter " ST"
  :keymap '(([C-s-*] . openstormwindows) ([C-s-!] . closestormwindows))
  :group 'storm-mode-group
  (if storm-mode
      (progn
        (st-setup)
        (add-hook 'pre-command-hook 'st-handle-pre-command nil t)
        (add-hook 'post-command-hook 'st-handle-post-command nil t)
        (add-hook 'after-save-hook 'st-clear-variables-after-save nil t)
        (run-hooks 'storm-mode-hook))
    (remove-hook 'pre-command-hook 'st-handle-pre-command t)
    (remove-hook 'post-command-hook 'st-handle-post-command t)
    (remove-hook 'after-save-hook 'st-clear-variables-after-save t)
    (st-abort))
  )

(defun st-handle-pre-command()
  (message "pre")
  )
(defun st-handle-post-command()
  (message "post")
  )
(defun st-clear-variables-after-save()
  (message "clear")
  )


(defun storm-mode-hook()
  (message "I'm in storm-mode")
)


(defun st-setup()
  (message "I'm in st-setup"))
(defun st-abort()
  (message "I'm in st-abort"))


;;;###autoload
(defun openstormwindows()
"open windows for storm speculators"
(message "open storm windows.")
   (let* (of (selected-frame))
         (nf (make-frame-command))
         (font1 (frame-parameter nf 'font))
	 )

  (save-selected-window (select-frame of) (set-frame-font font1))
)

;;;###autoload
(defun closestormwindows()
"close windows for storm speculators"
(message "close storm windows.")

)

(defun apropos (cur buffer)
 "a MR target"
 (message "target:%s" 'cur) 
)
(defun storm (context)
  "advanced operator"
  (message "advanced operator to %s" 'context)
)

;;;###autoload
(defun imenuextforstorm (buffer)
  "interactive ar-aided vr-targeted mr-selection with cursor"
   (interactive "P\nb\nenter a buffer name:")
   (let* (cur (point))
        (curtext (apropos cur buffer)))
  (storm curtext)
  
 
)

;;;(defgroup)
;;;(defcustom)
(global-set-key (kbd "C-M-,") 'imenuextforstorm)

(provide 'storm-mode)
