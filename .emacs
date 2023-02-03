(require 'package)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; need to wait until clang supports C++20/23 better
;;(add-hook 'c-mode-hook 'lsp)
;;(add-hook 'c++-mode-hook 'lsp)

;;(add-to-list 'load-path "~/.emacs.d/custom/")

;; Themes
;; * naysayer
;; * ample
;; * gruber-dark
;; * spacemacs
;; * zenburn
;; * 
;; * 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(custom-safe-themes
   '("5d59bd44c5a875566348fa44ee01c98c1d72369dc531c1c5458b0864841f887c" "735561d82728e28f275802fc875c3a2caf14d06f434604a7516c59d49120b163" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(explicit-shell-file-name "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
 '(inhibit-startup-screen t)
 '(lua-indent-level 4)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(lua-mode jetbrains-darcula-theme darcula-theme gruvbox-theme neotree org-bullets magit-todos magit vertico naysayer-theme move-text gruber-darker-theme ido-completing-read+ nhexl-mode hl-todo vundo counsel swiper ample-theme zenburn-theme))
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(shell-file-name "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell nil))

(set-face-attribute 'default nil :font "Courier New" :height 120)

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; hl-todo stuff
(setq hl-todo-keyword-faces
	  '(("TODO"   . "#CC5555")
		("FIXME"  . "#55CC55")
		("NOTE"   . "#55CCCC")))
(global-hl-todo-mode)


;; load themes here
;(load-theme 'zenburn t)
;(load-theme 'ample-flat t)
;(load-theme 'gruber-darker t)
(load-theme 'naysayer t)
;(load-theme 'spacemacs-dark t)

;; enable default theme
;(enable-theme 'zenburn)
;(enable-theme 'ample-flat)
;(enable-theme 'gruber-darker)
(enable-theme 'naysayer)
;(enable-theme 'spacemacs-dark)

;; misc. stuff
(set-cursor-color "#8CFAD6")
(setq show-paren-delay 0)
(setq use-dialog-box nil)
(column-number-mode)
(size-indication-mode)
(toggle-scroll-bar nil)
;; causes flickering
;;(setq display-line-numbers-type 'relative)
;;(global-display-line-numbers-mode)

;; enable these
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; bind swiper to ctrl-s
;; overrides isearch keybind at the moment
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'swiper)

;; bind git grep to ctrl-shift-s
(global-unset-key (kbd "C-S-s"))
(global-set-key (kbd "C-S-s") 'counsel-git-grep)

;; bind vundo to ctrl+shift+z
;; so it pops up when I want to redo
(global-unset-key (kbd "C-S-z"))
(global-set-key (kbd "C-S-z") 'vundo)

;; bind shell-command
(global-unset-key (kbd "C-`"))
(global-set-key (kbd "C-`") 'shell-command)

;; ido stuff
;;(ido-mode t)
;;(ido-everywhere t)
;;(ido-ubiquitous-mode t)
;;(fido-mode t)

;; vertico stuff
(vertico-mode t)
(vertico-flat-mode t)

;; change isearch keybinds to up and down
(define-key isearch-mode-map [up] 'isearch-repeat-backward)
(define-key isearch-mode-map [down] 'isearch-repeat-forward)

;; rebind delete word/line
(global-unset-key (kbd "C-d"))	
(global-set-key (kbd "C-d") 'kill-word)
(global-unset-key (kbd "C-S-d"))
(global-set-key (kbd "C-S-d") 'kill-whole-line)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; move text up/down with alt
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; neotree
(global-unset-key (kbd "C-S-b"))
(global-set-key (kbd "C-S-b") 'neotree-toggle)

;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; switch buffers
(global-unset-key (kbd "C-b"))
(global-set-key (kbd "C-b") 'switch-to-buffer)

;; window switching stuff
(global-unset-key (kbd "C-x o"))
(global-set-key (kbd "C-<tab>") 'other-window)

;; this can probably be reduced down
;; for now this is taken from window.el and modified a bit
(defun bk/other-window-inverse (count &optional all-frames interactive)
  "Same functionality of other-window but in reverse."
  (interactive "p\ni\np")
  (setq count (- count))
  (let* ((window (selected-window))
         (original-window window)
	 (function (and (not ignore-window-parameters)
			(window-parameter window 'other-window)))
	 old-window old-count)
    (if (functionp function)
	(funcall function count all-frames)
      ;; `next-window' and `previous-window' may return a window we are
      ;; not allowed to select.  Hence we need an exit strategy in case
      ;; all windows are non-selectable.
      (catch 'exit
	(while (> count 0)
	  (setq window (next-window window nil all-frames))
	  (cond
	   ((eq window old-window)
	    (when (= count old-count)
	      ;; Keep out of infinite loops.  When COUNT has not changed
	      ;; since we last looked at `window' we're probably in one.
	      (throw 'exit nil)))
	   ((window-parameter window 'no-other-window)
	    (unless old-window
	      ;; The first non-selectable window `next-window' got us:
	      ;; Remember it and the current value of COUNT.
	      (setq old-window window)
	      (setq old-count count)))
	   (t
	    (setq count (1- count)))))
	(while (< count 0)
	  (setq window (previous-window window nil all-frames))
	  (cond
	   ((eq window old-window)
	    (when (= count old-count)
	      ;; Keep out of infinite loops.  When COUNT has not changed
	      ;; since we last looked at `window' we're probably in one.
	      (throw 'exit nil)))
	   ((window-parameter window 'no-other-window)
	    (unless old-window
	      ;; The first non-selectable window `previous-window' got
	      ;; us: Remember it and the current value of COUNT.
	      (setq old-window window)
	      (setq old-count count)))
	   (t
	    (setq count (1+ count)))))

        (when (and (eq window original-window)
                   interactive
                   (not (or executing-kbd-macro noninteractive)))
          (message "No other window to select"))

	(select-window window)
	;; Always return nil.
	nil))))

(global-set-key (kbd "C-S-<tab>") 'bk/other-window-inverse)

(defun indent-region-custom(numSpaces)
    (progn 
        ; default to start and end of current line
        (setq regionStart (line-beginning-position))
        (setq regionEnd (line-end-position))
        
        ; if there's a selection, use that instead of the current line
        (when (use-region-p)
            (setq regionStart (region-beginning))
            (setq regionEnd (region-end))
        )
        
        (save-excursion ; restore the position afterwards            
            (goto-char regionStart) ; go to the start of region
            (setq start (line-beginning-position)) ; save the start of the line
            (goto-char regionEnd) ; go to the end of region
            (setq end (line-end-position)) ; save the end of the line
            
            (indent-rigidly start end numSpaces) ; indent between start and end
            (setq deactivate-mark nil) ; restore the selected region
        )
    )
)

(defun untab-region (N)
    (interactive "p")
    (indent-region-custom -4)
)

(defun tab-region (N)
    (interactive "p")
    (if (active-minibuffer-window)
        (minibuffer-complete)    ; tab is pressed in minibuffer window -> do completion
    ; else
    (if (string= (buffer-name) "*shell*")
        (comint-dynamic-complete) ; in a shell, use tab completion
    ; else
    (if (use-region-p)    ; tab is pressed is any other buffer -> execute with space insertion
        (indent-region-custom 4) ; region was selected, call indent-region-custom
        (insert "    ") ; else insert four spaces as expected
    )))
)

;; TODO this messes up magit binds :(
;; need to fix in the future
(global-set-key (kbd "<backtab>") 'untab-region)
(global-set-key (kbd "<tab>") 'tab-region)
