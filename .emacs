;;; Emacs configuration: http://nostdal.org/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)



;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
;;(tool-bar-mode 0) ;; Only available in "GUI version" of Emacs.
;;(scroll-bar-mode 0) ;; Only avilable in "GUI version" of Emacs.
(column-number-mode t)


;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-default-font "DejaVu Sans Mono-7.5")


;; TODO: Not sure about the colors here, but ok.
;;(require 'color-theme)
;;(color-theme-robin-hood)


;; Colorize parentheses, brackets etc..
(highlight-parentheses-mode 1) ;; Colorize nested parens.
(show-paren-mode 1) ;; Highlight matching parens.
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)




;;; General behavior
;;;;;;;;;;;;;;;;;;;;

(set-variable 'vc-follow-symlinks t)
(set-variable 'scroll-step 1)

;; Make sure code is clean; no extra whitespace and no tab characters.
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq-default indent-tabs-mode nil)


;; Buffers are always kept in sync with the file system.
(global-auto-revert-mode 1)


;; Desktop mode stuff
(setq desktop-restore-frames nil) ;; http://stackoverflow.com/questions/18612742/emacs-desktop-save-mode-error#comment27403618_18612742
(desktop-save-mode 1)
;;(desktop-load-default)
;;(desktop-read)
;(add-hook 'after-save-hook
;          (lambda ()
;            (interactive)
;            (desktop-save-in-desktop-dir)))



;;; Keyboard shortcuts: general
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Movement.
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)

;; File handling.
(global-set-key (kbd "<f2>") (lambda () (interactive) (save-some-buffers 1)))
(global-set-key (kbd "<f3>") 'find-file)

;; Windows.
(global-set-key (kbd "<backtab>") 'other-window)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "<f5>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "<f6>") 'enlarge-window)
(global-set-key (kbd "<f12>") 'delete-window)



;;; Clojure
;;;;;;;;;;;


;;(setq nrepl-popup-stacktraces-in-repl t)
(setq cider-auto-select-error-buffer t)



;;; Keyboard shortcuts: Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: Make these mode (nREPL / Clojure) specific instead of fully global.
(global-set-key (kbd "C-c C-c") 'cider-eval-expression-at-point)
(global-set-key (kbd "<f7>") (lambda () (interactive) (save-buffer 1) (cider-load-current-buffer)))
(global-set-key (kbd "<f9>") 'cider-eval-last-expression)



;;; Indentation: Clojure
;;;;;;;;;;;;;;;;;;;;;;;;

(put 'with 'clojure-indent-function 1)
(put 'with1 'clojure-indent-function 1)
(put 'do1 'clojure-indent-function 1)
(put 'jqAppend 'clojure-indent-function 1)
(put 'whc 'clojure-indent-function 1)




;;; Indentation: JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-variable 'js2-basic-offset 2)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))




;;; Indentation: C
;;;;;;;;;;;;;;;;;;

(set-variable 'c-basic-offset 2)
(put 'erase-buffer 'disabled nil)
