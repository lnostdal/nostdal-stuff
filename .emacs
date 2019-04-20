;;; Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize) ;; Needed for Emacs < 27.
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-check-vc-info t)
 '(auto-revert-remote-files t)
 '(auto-revert-use-notify t)
 '(auto-revert-verbose nil)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(epg-gpg-program "/usr/bin/gpg2")
 '(global-auto-revert-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(make-backup-files nil)
 '(org-export-with-sub-superscripts nil)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (solarized-theme cider wgrep hl-todo counsel-projectile projectile counsel clj-refactor dockerfile-mode htmlize symon beacon color-identifiers-mode 0blayout magit-todos jdee smartparens ivy parinfer highlight-thing elgrep magit python-mode php-mode web-mode cargo rust-mode rainbow-delimiters nginx-mode cider-decompile clojure-mode js2-mode highlight-parentheses haskell-mode company)))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(word-wrap t))



;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

;; Theme
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark)

(menu-bar-mode 0)
(column-number-mode t)
(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (toggle-frame-fullscreen))

(global-company-mode)
(if window-system (add-hook 'after-init-hook 'global-color-identifiers-mode))
(add-hook 'after-init-hook 'beacon-mode)

(global-hl-todo-mode 1)



;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (display-graphic-p) ;; TODO: Ho-hum, what's the difference between this and `window-system` above?
    (progn
      (set-frame-font "DejaVu Sans Mono-9" nil t)))



;;; General behavior
;;;;;;;;;;;;;;;;;;;;

;;(global-highlight-parentheses-mode) ;; Colorize nested parens.

(show-paren-mode 1) ;; Highlight matching parens.
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground "white"
                    :background "red"
                    :inherit 'error
                    :box t)

(set-variable 'vc-follow-symlinks t)
(set-variable 'scroll-step 1)

(add-hook 'before-save-hook 'whitespace-cleanup) ;; No extra whitespace and no tab characters.
(setq-default indent-tabs-mode nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
(setq revert-without-query '("png$")) ;; Makes auto-revert-mode on image files work way better. Tho it still thinks I've been 'editing' the image buffer sometimes. x)

(ivy-mode 1)
;;(setq enable-recursive-minibuffers nil)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")


;; Tramp stuff
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq nrepl-use-ssh-fallback-for-remote-hosts t)


;; Desktop mode stuff
(setq desktop-buffers-not-to-save nil) ;;"^$")
(setq desktop-path '("."))
(setq desktop-dirname ".")
(setq desktop-restore-frames nil) ;; http://stackoverflow.com/questions/18612742/emacs-desktop-save-mode-error#comment27403618_18612742
(setq desktop-save t)
(desktop-save-mode 1)



;;; Keyboard shortcuts: general  [ s = windows key, M = Alt ]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\370" (quote counsel-M-x))
(global-set-key "\C-s" 'swiper) (global-set-key "\C-r" 'swiper) ;; Better than standard isearch.

;; Projectile mode
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Fast buffer switching
(global-set-key (kbd "<M-next>") 'next-buffer)
(global-set-key (kbd "<M-prior>") 'previous-buffer)

(global-set-key (kbd "<backtab>") 'other-window) ;; Shift-Tab
(global-set-key "|" 'other-window) ;; Alt-|  ..this seems to work better or more consistently in terminal mode.
(global-set-key (kbd "<C-S-iso-lefttab>") 'other-window) ;; Ctrl-Shift-Tab

;; Movement.
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)

;; File handling.
(global-set-key (kbd "<f1>") 'counsel-find-file)
(global-set-key (kbd "<f2>") (lambda () (interactive)
                               (save-excursion
                                 (mark-whole-buffer)
                                 (indent-region (region-beginning) (region-end)))
                               (save-some-buffers 1)))
(global-set-key (kbd "<f3>") 'projectile-find-file)
(global-set-key (kbd "<f4>") 'counsel-switch-buffer)

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
;;(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
;;(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<up>") 'shrink-window) (global-set-key (kbd "<f5>") 'shrink-window)
(global-set-key (kbd "M-s-<down>") 'enlarge-window) (global-set-key (kbd "<f6>") 'enlarge-window)

;; Scroll buffer line by line without moving cursor
(global-set-key (kbd "<C-M-up>")    'scroll-down-line)
(global-set-key (kbd "<C-M-down>")  'scroll-up-line)

(global-set-key (kbd "<pause>") 'magit-status) (global-set-key [f10] (quote magit-status))
(global-set-key (kbd "<M-pause>") 'magit-diff-buffer-file) (global-set-key [27 f10] (quote magit-diff-buffer-file))
(global-set-key (kbd "<C-pause>") 'magit-checkout) (global-set-key [C-f10] (quote magit-checkout))

;; Grepping etc.
(global-set-key [M-f1] (quote counsel-git-grep)) ;; GUI
(global-set-key [27 f1] (quote counsel-git-grep)) (global-set-key [27 91 49 59 51 112] (quote counsel-git-grep)) ;; CLI modes.



;;; Clojure
;;;;;;;;;;;

(require 'cider)
(require 'clojure-mode)
(require 'cider-mode)
(setq cider-repl-display-help-banner nil)


;; REPL pretty printing. NOTE: Don't fiddle with this bullshit; it'll break and you'll waste half your day. Use debugging wrappers that call zprint/puget directly instead!
(add-hook 'cider-repl-mode-hook
          '(lambda ()
             (setq fill-column 130)
             (setq scroll-conservatively 101))) ;; Without this, the REPL looks like and behaves like crap.
;;(setq cider-print-fn nil) ;; Let nrepl.middleware.print/*print-fn* decide! NOTE: Doesn't actually work!
(setq cider-print-fn 'puget) ;; 'fipp, 'puget, 'pprint or 'zprint
;; For clojure.pprint:
;;(setq cider-print-options '(dict "length" 50 "level" 6 "right-margin" 130))
;; For zprint:
;;(setq cider-print-options '(dict "max-length" 50 "max-depth" 6 "width" 130))
;; For puget:
;;(setq cider-print-options '(dict "print-length" 50 "print-level" 6 "width" 130)) ;; NOTE: Doesn't actually work!


(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-wrap-history nil)
(setq cider-repl-history-file "~/.emacs.d/cider-repl-history.dat")
(setq cider-prompt-for-symbol nil)
(setq cider-repl-display-in-current-window t)
(setq cider-auto-jump-to-error 'errors-only)


(add-hook 'cider-mode-hook 'highlight-thing-mode)
(add-hook 'clojure-mode-hook 'highlight-thing-mode)
;;(add-hook 'cider-repl-mode-hook 'highlight-thing-mode) ;; I often print a ton of output in the REPL...
(setq highlight-thing-limit-to-region-in-large-buffers-p nil
      highlight-thing-narrow-region-lines 111
      highlight-thing-large-buffer-limit 5000
      highlight-thing-case-sensitive-p t
      highlight-thing-delay-seconds 0.125)

(add-hook 'clojure-mode-hook 'goto-address-mode)

(define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)

(define-key clojure-mode-map (kbd "M-.") 'cider-find-dwim)

(define-key clojure-mode-map (kbd "<s-delete>") 'cider-clear-compilation-highlights)
(define-key clojure-mode-map (kbd "C-|") 'comment-or-uncomment-region)
(define-key clojure-mode-map (kbd "<f2>") (lambda () (interactive)
                                            (whitespace-cleanup)
                                            (save-excursion
                                              (mark-whole-buffer)
                                              (indent-region (region-beginning) (region-end)))
                                            (save-some-buffers 1)))
(define-key cider-repl-mode-map (kbd "<f2>") (lambda () (interactive) ;; NOTE: So we don't indent in the REPL.
                                               (save-some-buffers 1)))
(define-key clojure-mode-map (kbd "<f7>") (lambda () (interactive)
                                            (whitespace-cleanup)
                                            (save-excursion
                                              (mark-whole-buffer)
                                              (indent-region (region-beginning) (region-end)))
                                            (save-buffer 1)
                                            (cider-load-buffer)))
(define-key clojure-mode-map (kbd "<f8>") 'cider-eval-last-sexp)
(define-key clojure-mode-map (kbd "<f9>") (lambda () (interactive)
                                            (save-excursion
                                              (mark-defun)
                                              (indent-region (region-beginning) (region-end))
                                              (whitespace-cleanup-region (region-beginning) (region-end)))
                                            (cider-eval-defun-at-point)))

(define-key clojure-mode-map (kbd "C-c C-c") (lambda () (interactive)
                                               (save-excursion
                                                 (mark-defun)
                                                 ;; TODO: Odd; doesn't seem to work? But F9 (above) does tho.
                                                 (indent-region (region-beginning) (region-end))
                                                 (whitespace-cleanup-region (region-beginning) (region-end)))
                                               (cider-eval-defun-at-point)))

(define-key clojure-mode-map (kbd "C-<tab>") (lambda () (interactive)
                                               (save-excursion
                                                 (mark-whole-buffer)
                                                 (indent-region (region-beginning) (region-end))
                                                 (whitespace-cleanup-region (region-beginning) (region-end)))))

(define-key clojure-mode-map (kbd "<up>") 'previous-logical-line)
(define-key clojure-mode-map (kbd "<down>") 'next-logical-line)

(define-key clojure-mode-map (kbd "M-<up>") 'clojure-backward-logical-sexp)
(define-key clojure-mode-map (kbd "M-<down>") 'clojure-forward-logical-sexp)
(define-key clojure-mode-map (kbd "M-<left>") 'up-list)
(define-key clojure-mode-map (kbd "M-<right>") 'down-list)

(define-key clojure-mode-map (kbd "<tab>") 'company-indent-or-complete-common)
(define-key cider-repl-mode-map (kbd "<tab>") 'company-indent-or-complete-common)

(define-key clojure-mode-map (kbd "C-c RET") 'cider-macroexpand-1)
(define-key cider-repl-mode-map (kbd "C-c RET") 'cider-macroexpand-1)

(define-key clojure-mode-map (kbd "<s-backspace") 'cider-undef) ;; This doesn't seem to work??

(put 'amap 'clojure-indent-function 1)
(put 'areduce 'clojure-indent-function 1)
(put 'assoc 'clojure-indent-function 1)
(put 'update 'clojure-indent-function 1)
;;(put 'update-in 'clojure-indent-function 1)
(put 'with 'clojure-indent-function 1)
(put 'with1 'clojure-indent-function 1)
(put 'do1 'clojure-indent-function 1)
(put 'jqAppend 'clojure-indent-function 1)
(put 'whc 'clojure-indent-function 1)
(put 'mk-Link 'clojure-indent-function 1)
(put 'js-run 'clojure-indent-function 1)
(put 'add-rest-initial 'clojure-indent-function 1)
(put 'add-rest-head 'clojure-indent-function 1)
(put 'jiter 'clojure-indent-function 1)
(put 'vec-iter 'clojure-indent-function 1)
(put 'doiter 'clojure-indent-function 1)
(put 'seque 'clojure-indent-function 1)
(put 'when-cdebug 'clojure-indent-function 1)



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





(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hi-yellow ((t (:underline "dim gray" :weight extra-bold)))))
