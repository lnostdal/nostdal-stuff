;;; Config for Emacs 27+
;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 10)
                                   ("gnu" . 5)
                                   ("melpa" . 0)))
(add-to-list 'package-pinned-packages '(cider . "melpa") t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-check-vc-info t)
 '(auto-revert-remote-files t)
 '(auto-revert-use-notify t)
 '(auto-revert-verbose nil)
 '(cider-jump-to-pop-to-buffer-actions '((display-buffer-same-window)))
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("076ee9f2c64746aac7994b697eb7dbde23ac22988d41ef31b714fc6478fee224" "2b502f6e3bf0cba42fe7bf83a000f2d358a7020a7780a8682fcfed0c9dbffb5f" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "d9864caf2fc6cd9bc5bed941c526a4690bf6c27f0d8c1ca28ff7e05806b57204" "0bcd68ed12fe8a59dfadf8e6eaeb57c390b2937babdf5479c2f5bc90d6c1685b" default))
 '(epg-gpg-program "/usr/bin/gpg2")
 '(global-auto-revert-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(highlight-thing-all-visible-buffers-p t)
 '(highlight-thing-delay-seconds 0.125)
 '(highlight-thing-exclude-thing-under-point t)
 '(inhibit-startup-screen t)
 '(magit-diff-arguments '("--stat" "-M" "-C" "--diff-algorithm=histogram"))
 '(magit-diff-refine-ignore-whitespace t)
 '(magit-diff-section-arguments '("-M" "-C" "--diff-algorithm=histogram"))
 '(make-backup-files nil)
 '(org-export-with-sub-superscripts nil)
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(modus-themes nginx-mode highlight-thing systemd yaml-mode solarized-theme rust-mode hl-todo rainbow-delimiters beacon cider company counsel magit projectile cargo lxd-tramp counsel-tramp docker docker-compose-mode wgrep counsel-projectile clj-refactor dockerfile-mode htmlize symon 0blayout magit-todos jdee smartparens elgrep python-mode php-mode web-mode cider-decompile js2-mode highlight-parentheses))
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-very-old-color nil)
 '(visible-bell t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(word-wrap t))


;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(column-number-mode t)
(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (add-to-list 'initial-frame-alist '(fullscreen . maximized)))
(if window-system (set-frame-parameter nil 'undecorated t))


(global-company-mode)
;; (if window-system (add-hook 'after-init-hook 'global-color-identifiers-mode))
(add-hook 'after-init-hook 'beacon-mode)

(global-hl-todo-mode 1)



;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (display-graphic-p) ;; TODO: Ho-hum, what's the difference between this and `window-system` above?
    (progn
      (set-frame-font "DejaVu Sans Mono-9" nil t)))



;;; General behavior
;;;;;;;;;;;;;;;;;;;;

(winner-mode 1)
(global-set-key (kbd "<C-M-prior>") 'winner-undo)
(global-set-key (kbd "<C-M-next>") 'winner-redo)
(global-set-key (kbd "M-(") 'toggle-truncate-lines)

;;(global-highlight-parentheses-mode) ;; Colorize nested parens.

(show-paren-mode 1) ;; Highlight matching parens.
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-thing-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground "white"
                    :background "red"
                    :inherit 'error
                    :box t)

(set-variable 'vc-follow-symlinks t)
(set-variable 'scroll-step 1)

;;(add-hook 'before-save-hook 'whitespace-cleanup) ;; No extra whitespace and no tab characters.
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
;; (setq desktop-buffers-not-to-save nil) ;;"^$")
;; (setq desktop-path '("."))
;; (setq desktop-dirname ".")
;; (setq desktop-restore-frames nil) ;; http://stackoverflow.com/questions/18612742/emacs-desktop-save-mode-error#comment27403618_18612742
;; (setq desktop-save t)
;; (desktop-save-mode 1)



;;; Keyboard shortcuts: general  [ s = windows key, M = Alt ]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\370" (quote counsel-M-x))
(global-set-key "\C-s" 'swiper) (global-set-key "\C-r" 'swiper) ;; Better than standard isearch.

(global-set-key (kbd "<C-delete>") 'comment-or-uncomment-region)

;; Projectile mode
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-|") 'projectile-switch-project)
(global-set-key (kbd "C-\\") 'projectile-switch-project)

;; Fast buffer switching
(global-set-key (kbd "<M-next>") 'next-buffer)
(global-set-key (kbd "<M-prior>") 'previous-buffer)

(global-set-key "§" 'other-window) ;; Shift-|  ..this seems to work better or more consistently in terminal mode.

;; Movement.
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)

;; File handling.
(global-set-key (kbd "<f1>") 'counsel-find-file)
(global-set-key (kbd "<f2>") (lambda () (interactive)
                               (whitespace-cleanup)
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

;; Resize windows (M = Alt, S == Shift).
(global-set-key (kbd "M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-<down>") 'shrink-window) (global-set-key (kbd "<f5>") 'shrink-window)
(global-set-key (kbd "M-S-<up>") 'enlarge-window) (global-set-key (kbd "<f6>") 'enlarge-window)

;; Scroll buffer line by line without moving cursor
(global-set-key (kbd "<C-M-up>")    'scroll-down-line)
(global-set-key (kbd "<C-M-down>")  'scroll-up-line)

(global-set-key (kbd "<pause>") 'magit-status) (global-set-key [f10] (quote magit-status))
(global-set-key (kbd "<M-pause>") 'magit-diff-buffer-file) (global-set-key [27 f10] (quote magit-diff-buffer-file))
(global-set-key (kbd "<C-pause>") 'magit-checkout) (global-set-key [C-f10] (quote magit-checkout))

;; Grepping etc.
(global-set-key [M-f1] (quote counsel-git-grep)) ;; GUI
(global-set-key [27 f1] (quote counsel-git-grep)) (global-set-key [27 91 49 59 51 112] (quote counsel-git-grep)) ;; CLI modes.

(global-set-key (kbd "S-<space>") 'just-one-space)



;;; Clojure
;;;;;;;;;;;

(require 'cider)
(require 'clojure-mode)
(require 'cider-mode)
(setq cider-repl-display-help-banner nil)

(add-hook 'cider-repl-mode-hook 'highlight-thing-mode)

;; REPL pretty printing. NOTE: Don't fiddle with this bullshit; it'll break and you'll waste half your day. Use debugging wrappers that call zprint/puget directly instead!
(add-hook 'cider-repl-mode-hook
          '(lambda ()
             (setq fill-column 130)
             (setq scroll-conservatively 101))) ;; Without this, the REPL looks like and behaves like crap.
;;(setq cider-print-fn nil) ;; Let nrepl.middleware.print/*print-fn* decide! NOTE: Doesn't actually work!
;;(setq cider-print-fn 'puget) ;; 'fipp, 'puget, 'pprint or 'zprint
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

(add-hook 'clojure-mode-hook 'goto-address-mode)

(define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)

(define-key clojure-mode-map (kbd "M-.") 'cider-find-dwim)

(define-key clojure-mode-map (kbd "<s-delete>") 'cider-clear-compilation-highlights)

(define-key cider-repl-mode-map (kbd "<f2>") (lambda () (interactive) ;; NOTE: So we don't indent in the REPL.
                                               (save-some-buffers 1)))
(define-key clojure-mode-map (kbd "<f7>") (lambda () (interactive)
                                            ;; (whitespace-cleanup)
                                            ;; (save-excursion
                                            ;;   (mark-whole-buffer)
                                            ;;   (indent-region (region-beginning) (region-end)))
                                            (save-buffer 1)
                                            (cider-load-buffer)))
(define-key clojure-mode-map (kbd "<f8>") 'cider-eval-last-sexp)
(define-key clojure-mode-map (kbd "<f9>") (lambda () (interactive)
                                            (whitespace-cleanup)
                                            (save-excursion
                                              (mark-defun)
                                              (indent-region (region-beginning) (region-end))
                                              (whitespace-cleanup-region (region-beginning) (region-end)))
                                            (cider-eval-defun-at-point)))

(define-key clojure-mode-map (kbd "C-c C-c") (lambda () (interactive)
                                               (whitespace-cleanup)
                                               (save-excursion
                                                 (mark-defun)
                                                 ;; TODO: Odd; doesn't seem to work? But F9 (above) does tho.
                                                 (indent-region (region-beginning) (region-end))
                                                 (whitespace-cleanup-region (region-beginning) (region-end)))
                                               (cider-eval-defun-at-point)))

(define-key clojure-mode-map (kbd "C-<tab>") (lambda () (interactive)
                                               (save-excursion
                                                 (mark-defun)
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
(put 'reg-event-db 'clojure-indent-function 1)
(put 'reg-event-fx 'clojure-indent-function 1)
(put 'reg-sub 'clojure-indent-function 1)



;;; Indentation: JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-variable 'js2-basic-offset 2)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))



;;; Indentation: C
;;;;;;;;;;;;;;;;;;

(set-variable 'c-basic-offset 2)
(put 'erase-buffer 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
