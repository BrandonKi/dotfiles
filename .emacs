(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(c-basic-offset 4)
 '(c-syntactic-indentation nil)
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(cua-mode t)
 '(custom-enabled-themes '(tango-dark))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))

;; fonts
(custom-set-faces
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;; misc. stuff
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(column-number-mode)
(size-indication-mode)
(toggle-scroll-bar nil)

;; change isearch keybinds to up and down
(define-key isearch-mode-map [up] 'isearch-repeat-backward)
(define-key isearch-mode-map [down] 'isearch-repeat-forward)

;; rebind delete word/line
(global-unset-key (kbd "C-d"))	
(global-set-key (kbd "C-d") 'kill-word)
(global-unset-key (kbd "C-S-d"))
(global-set-key (kbd "C-S-d") 'kill-whole-line)

;; move text up/down with alt
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
	(if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)
