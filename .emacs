;;; Emacs configuration: http://nostdal.org/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(package-initialize)



;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(column-number-mode t)
(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (set-background-color "black"))
(if window-system (set-foreground-color "white"))



;;(require 'company-mode)
(global-company-mode)



;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(set-default-font "DejaVu Sans Mono-7.5")
(set-default-font "DejaVu Sans Mono-8")



;; Colorize parentheses, brackets etc..
(highlight-parentheses-mode 1) ;; Colorize nested parens.
(show-paren-mode 1) ;; Highlight matching parens.



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
(setq desktop-path '("."))
(setq desktop-dirname ".")
(setq desktop-restore-frames nil) ;; http://stackoverflow.com/questions/18612742/emacs-desktop-save-mode-error#comment27403618_18612742
(setq desktop-save t)
(desktop-save-mode 1)



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

(require 'cider)
(require 'clojure-mode)
(require 'cider-mode)
(setq cider-pprint-fn 'puget) ;; 'fipp, 'puget or 'pprint
(setq cider-repl-use-pretty-printing t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-repl-history.dat")

(define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)

(define-key clojure-mode-map (kbd "C-c C-c") 'cider-eval-expression-at-point)
(define-key clojure-mode-map (kbd "<f7>") (lambda () (interactive) (save-buffer 1) (cider-load-buffer)))
(define-key clojure-mode-map (kbd "<f9>") 'cider-eval-last-expression)

(define-key clojure-mode-map (kbd "C-<tab>") (lambda () (interactive) (indent-region 0 9999999)))

(define-key clojure-mode-map (kbd "M-<up>") 'backward-paragraph)
(define-key clojure-mode-map (kbd "M-<down>") 'forward-paragraph)
(define-key clojure-mode-map (kbd "C-<up>") 'clojure-backward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<left>") 'clojure-backward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<right>") 'clojure-forward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<down>") 'clojure-forward-logical-sexp)

;;(define-key clojure-mode-map (kbd "<tab>") 'company-complete)
;;(define-key cider-repl-mode-map (kbd "<tab>") 'company-complete)

(put 'amap 'clojure-indent-function 1)
(put 'areduce 'clojure-indent-function 1)
(put 'assoc 'clojure-indent-function 1)
(put 'update 'clojure-indent-function 1)
(put 'with 'clojure-indent-function 1)
(put 'with1 'clojure-indent-function 1)
(put 'do1 'clojure-indent-function 1)
(put 'jqAppend 'clojure-indent-function 1)
(put 'whc 'clojure-indent-function 1)
(put 'mk-Link 'clojure-indent-function 1)
(put 'js-run 'clojure-indent-function 1)
(put 'add-rest-initial 'clojure-indent-function 1)
(put 'add-rest-head 'clojure-indent-function 1)



;;; Indentation: JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-variable 'js2-basic-offset 2)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))




;;; Indentation: C
;;;;;;;;;;;;;;;;;;

(set-variable 'c-basic-offset 2)
(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/bin/gpg2")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-selected-packages
   (quote
    (cider clojure-mode js2-mode highlight-parentheses haskell-mode company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;;; Haskell
;;;;;;;;;;;

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

;(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
