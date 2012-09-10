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



;;; General settings
;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(tool-bar-mode 0)

;; This font gives enough room for a 2 column frame setup where each frame has room for 130 characters in GUI mode.
;; <----------------------------------------------------------------------------------------------------------------------------->
(set-default-font "Inconsolata-9")

;; NOTE: In CLI mode, "Bitstream Vera Sans Mono 8" has the same property with regards to width.

;; TODO: Not sure about the colors here, but ok.
;;(require 'color-theme)
;;(color-theme-robin-hood)

;; Make sure code is clean; no extra whitespace and no tab characters.
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq indent-tabs-mode nil)

;; Buffers are always kept in sync with the file system.
(global-auto-revert-mode 1)

;; No one uses the scroll bar (i.e. the mouse) to scroll; it wastes screen space.
(scroll-bar-mode 0)

;; Colorize parentheses, brackets etc..
(highlight-parentheses-mode 1) ;; Colorize nested parens.
(show-paren-mode 1) ;; Highlight matching parens.

;; Show column numbers.
(column-number-mode t)



;;; Keyboard shortcuts: general
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "<backtab>") 'other-window)

(global-set-key (kbd "<f2>") (lambda () (interactive) (save-some-buffers 1)))
(global-set-key (kbd "<f3>") 'find-file)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)



;;; Keyboard shortcuts: Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: Make these mode (nREPL / Clojure) specific instead of fully global.
(global-set-key (kbd "C-c C-c") 'nrepl-eval-expression-at-point)
(global-set-key (kbd "<f7>") (lambda () (interactive) (save-buffer 1) (nrepl-load-current-buffer)))
(global-set-key (kbd "<f8>") 'nrepl-eval-buffer)
(global-set-key (kbd "<f9>") 'nrepl-eval-last-expression)



;;; Indentation: Clojure
;;;;;;;;;;;;;;;;;;;;;;;;

(put 'with 'clojure-indent-function 1)
(put 'with1 'clojure-indent-function 1)
