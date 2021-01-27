;;; Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 10)
                                   ("gnu" . 5)
                                   ("melpa" . 0)))
(add-to-list 'package-pinned-packages '(cider . "melpa") t)
(package-initialize) ;; Needed for Emacs < 27.


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
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(doom-vibrant))
 '(custom-safe-themes
   '("1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(epg-gpg-program "/usr/bin/gpg2")
 '(global-auto-revert-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   '("#98695021d64f" "#484f5a50ffff" "#9ae80000c352" "#00000000ffff" "#98695021d64f" "#9ae80000c352" "#484f5a50ffff"))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#5b7300" . 20)
     ("#007d76" . 30)
     ("#0061a8" . 50)
     ("#866300" . 60)
     ("#992700" . 70)
     ("#a00559" . 85)
     ("#073642" . 100)))
 '(highlight-thing-all-visible-buffers-p t)
 '(highlight-thing-delay-seconds 0.125)
 '(highlight-thing-exclude-thing-under-point t)
 '(hl-bg-colors
   '("#866300" "#992700" "#a7020a" "#a00559" "#243e9b" "#0061a8" "#007d76" "#5b7300"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(inhibit-startup-screen t)
 '(lsp-ui-doc-border "#93a1a1")
 '(magit-diff-arguments '("--stat" "-M" "-C" "--diff-algorithm=histogram"))
 '(magit-diff-refine-ignore-whitespace t)
 '(magit-diff-section-arguments '("-M" "-C" "--diff-algorithm=histogram"))
 '(make-backup-files nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4"))
 '(org-export-with-sub-superscripts nil)
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(highlight-thing systemd yaml-mode solarized-theme rust-mode hl-todo rainbow-delimiters doom-themes beacon cider company counsel magit projectile cargo lxd-tramp counsel-tramp docker docker-compose-mode wgrep counsel-projectile clj-refactor dockerfile-mode htmlize symon 0blayout magit-todos jdee smartparens elgrep python-mode php-mode web-mode cider-decompile js2-mode highlight-parentheses))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(truncate-lines t)
 '(vc-annotate-background-mode nil)
 '(visible-bell t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#839496" "#657b83"))
 '(word-wrap t)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))



;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(column-number-mode t)
(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (add-to-list 'initial-frame-alist '(fullscreen . maximized)))
(if window-system (set-frame-parameter nil 'undecorated t))


(global-company-mode)
;;(if window-system (add-hook 'after-init-hook 'global-color-identifiers-mode))
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
(setq cider-infer-remote-nrepl-ports t)
(setq cider-known-endpoints
      '(("bec" "127.0.0.1" "9999")))

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
