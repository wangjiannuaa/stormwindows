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


;;;###autoload
(defun st-open-windows (arg)
   "open windows for storm speculators"
    (interactive "bbuffer:")
 ;;;   (let* (of (selected-frame))
 ;;;         (nf (make-frame-command))
 ;;;         (font1 (frame-parameter of 'font))

;;;  (save-selected-window (select-frame nf) (set-frame-font font1))
;;;    (message "open storm windows.")
 ;;;   )
)

;;;###autoload
(defun st-close-windows ( arg)
  "close windows for storm speculators"
  (interactive "bbuffer:")
;;   (interactive "@\n" (let curframe (selected-frame)))
;;   (delete-frame curframe)
)





(defgroup storm-tech nil
  "Storm Technique."
  :group 'convenience
  :prefix "st-"
  )

(defcustom st-version 0.1
  "storm version will be available."
  :type 'float
  :group 'storm-tech)

(defvar storm-mode nil
  "Dummy variable to suppress compiler warnings.")

;;;###autoload
(define-minor-mode storm-mode
  "storm mode"
  :global t
  :init-value  nil
  :lighter " ST"
  :group 'storm-tech
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

(defun st-handle-pre-command ()
  (message "pre")
)
(defun st-handle-post-command ()
  (message "post")
)
(defun st-clear-variables-after-save ()
  (message "clear")
)




(defun st-setup ()
  "define keymap"
  (message "Im in st-setup")

  (define-key storm-mode-map (kbd "C-M-*") #'st-open-windows)
  (define-key storm-mode-map (kbd "C-M-!") #'st-close-windows)
  (message "Im out st-setup")
)
(defun st-abort ()
  "undefine keymap"
  
  (message "Im in st-abort")
)


(defun storm-apropos (cur buffer)
 "a MR target"
)
(defun storm (context)
  "advanced operator"
)

;;;###autoload
(defun imenu-extension-for-storm (buffer)
  "interactive ar-aided vr-targeted mr-selection with cursor"
   (interactive "P\nb\nenter a buffer name:")
   (let* (cur (point))
         (curtext (apropos cur buffer))
	 (storm curtext)
   )
)

;;;(defgroup)
;;;(defcustom)
(global-set-key (kbd "C-M-,") 'imenu-extension-for-storm)

(provide 'storm-mode)
