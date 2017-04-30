;;; Emacs configuration: http://nostdal.org/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;

;;(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-parameters "with-profiles production trampoline repl :headless")
 '(epg-gpg-program "/usr/bin/gpg2")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-selected-packages
   (quote
    (cargo rust-mode rainbow-delimiters nginx-mode cider cider-decompile clojure-mode js2-mode highlight-parentheses haskell-mode company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(column-number-mode t)
(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (set-background-color "black"))
(if window-system (set-foreground-color "white"))
(if window-system (toggle-frame-fullscreen))
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))


;;(require 'company-mode)
(global-company-mode)



;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(set-default-font "DejaVu Sans Mono-7.5")
(set-default-font "DejaVu Sans Mono-8")



;;; General behavior
;;;;;;;;;;;;;;;;;;;;

;;(global-highlight-parentheses-mode) ;; Colorize nested parens.
(show-paren-mode 1) ;; Highlight matching parens.
;; (goto-address-mode 1) ;; Make URLs clickable. TODO: This doesn't enable this mode globally? Using hooks instead..
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground "white"
                    :background "red"
                    :inherit 'error
                    :box t)

(set-variable 'vc-follow-symlinks t)
(set-variable 'scroll-step 1)

(add-hook 'before-save-hook 'whitespace-cleanup) ;; No extra whitespace and no tab characters.
(setq-default indent-tabs-mode nil)

(global-auto-revert-mode 1) ;; Buffers are always kept in sync with the file system.


;; Desktop mode stuff
(setq desktop-path '("."))
(setq desktop-dirname ".")
(setq desktop-restore-frames nil) ;; http://stackoverflow.com/questions/18612742/emacs-desktop-save-mode-error#comment27403618_18612742
(setq desktop-save t)
(desktop-save-mode 1)



;;; Keyboard shortcuts: general
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fast buffer switching (s == Windows key).
(global-set-key (kbd "<s-right>") 'next-buffer)
(global-set-key (kbd "<s-left>") 'previous-buffer)

(global-set-key (kbd "<backtab>") 'other-window) ;; Shift-Tab

;; Movement.
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)

;; File handling.
(global-set-key (kbd "<f2>") (lambda () (interactive) (save-some-buffers 1)))
(global-set-key (kbd "<f3>") 'find-file)

;; Split windows (s == Windows key).
;;(global-set-key (kbd "s-<up>") 'split-window-vertically)
;;(global-set-key (kbd "s-<right>") 'split-window-horizontally)
;;(global-set-key (kbd "s-<down>") 'delete-window)
;;(global-set-key (kbd "s-<left>") 'delete-window)

;; Delete/merge windows (s == Windows key).
;;(global-set-key (kbd "s-<down>") 'delete-window)
;;(global-set-key (kbd "s-<left>") 'delete-window)
(global-set-key (kbd "<f12>") 'delete-window)

;; Resize windows (M = Alt, s == Windows key).
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<up>") 'shrink-window) (global-set-key (kbd "<f5>") 'shrink-window)
(global-set-key (kbd "M-s-<down>") 'enlarge-window) (global-set-key (kbd "<f6>") 'enlarge-window)

;; Scroll buffer line by line without moving cursor (s == Windows key).
(global-set-key (kbd "<s-up>") 'scroll-down-line)
(global-set-key (kbd "<s-prior>") 'scroll-down-line)
(global-set-key (kbd "<s-next>") 'scroll-up-line)
(global-set-key (kbd "<s-down>") 'scroll-up-line)



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
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook 'goto-address-mode)


(define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)

;;(define-key clojure-mode-map (kbd "C-.") 'cider-find-dwim)

(define-key clojure-mode-map (kbd "<s-delete>") 'cider-clear-compilation-highlights)
(define-key clojure-mode-map (kbd "C-|") 'comment-or-uncomment-region)
(define-key clojure-mode-map (kbd "C-c C-c") 'cider-eval-last-sexp)
(define-key clojure-mode-map (kbd "<f2>") (lambda () (interactive)
                                            (indent-region 0 9999999)
                                            (save-some-buffers 1)))
(define-key clojure-mode-map (kbd "<f7>") (lambda () (interactive)
                                            (indent-region 0 9999999)
                                            (save-buffer 1)
                                            (cider-load-buffer)))
(define-key clojure-mode-map (kbd "<f9>") 'cider-eval-last-sexp)

(define-key clojure-mode-map (kbd "C-<tab>") (lambda () (interactive)
                                               (indent-region 0 9999999)))

(define-key clojure-mode-map (kbd "M-<up>") 'backward-paragraph)
(define-key clojure-mode-map (kbd "M-<down>") 'forward-paragraph)
(define-key clojure-mode-map (kbd "C-<up>") 'clojure-backward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<left>") 'clojure-backward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<right>") 'clojure-forward-logical-sexp)
(define-key clojure-mode-map (kbd "C-<down>") 'clojure-forward-logical-sexp)

(define-key clojure-mode-map (kbd "<tab>") 'company-complete)
(define-key cider-repl-mode-map (kbd "<tab>") 'company-complete)

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
(put 'iter 'clojure-indent-function 1)
(put 'doiter 'clojure-indent-function 1)



;;; Indentation: JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-variable 'js2-basic-offset 2)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))



;;; Indentation: C
;;;;;;;;;;;;;;;;;;

(set-variable 'c-basic-offset 2)
(put 'erase-buffer 'disabled nil)



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

;;(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
