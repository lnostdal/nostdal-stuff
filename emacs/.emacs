;;; Config for Emacs 27+
;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ;;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 10)
                                   ("gnu" . 5)
                                   ("melpa" . 0)))
;; (add-to-list 'package-pinned-packages '(cider . "melpa") t)


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
 '(cider-print-quota 262144)
 '(column-number-mode t)
 '(completion-category-overrides
   '((cider
      (styles orderless basic))
     (file
      (styles partial-completion basic orderless))))
 '(completion-styles '(orderless basic partial-completion emacs22))
 '(custom-safe-themes
   '("99d1e29934b9e712651d29735dd8dcd431a651dfbe039df158aa973461af003e" "1ea82e39d89b526e2266786886d1f0d3a3fa36c87480fad59d8fab3b03ef576e" "7613ef56a3aebbec29618a689e47876a72023bbd1b8393efc51c38f5ed3f33d1" "88cb0f9c0c11dbb4c26a628d35eb9239d1cf580cfd28e332e654e7f58b4e721b" "3d94d6d1a1c23113a60c8496c9aed094dbc2695f219e8127bb168d17b1e6dab3" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "4b026ac68a1aa4d1a91879b64f54c2490b4ecad8b64de5b1865bca0addd053d9" "69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "21e3d55141186651571241c2ba3c665979d1e886f53b2e52411e9e96659132d4" "7887cf8b470098657395502e16809523b629249060d61607c2225d2ef2ad59f5" "dde643b0efb339c0de5645a2bc2e8b4176976d5298065b8e6ca45bc4ddf188b7" "250007c5ae19bcbaa80e1bf8184720efb6262adafa9746868e6b9ecd9d5fbf84" "30dc9873c16a0efb187bb3f8687c16aae46b86ddc34881b7cae5273e56b97580" "e943a2098751f27fb99d45bb0bf49c3e0034c85af8fe89862c1f7577fe254994" "896e4305e7c10f3217c5c0a0ef9d99240c3342414ec5bfca4ec4bff27abe2d2d" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "e362839cfe7620bcd13e6c13eaf7fd258dca2488300cfe61bbb01af99e91b31b" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7dc296b80df1b29bfc4062d1a66ee91efb462d6a7a934955e94e786394d80b71" "046e442b73846ae114d575a51be9edb081a1ef29c05ae5e237d5769ecfd70c2e" "4cc1cc7efd5c2362ef684657eec7d7e482223b1def4edeb0fab52ba1d334d38a" "dad40020beea412623b04507a4c185079bff4dcea20a93d8f8451acb6afc8358" "c414f69a02b719fb9867b41915cb49c853489930be280ce81385ff7b327b4bf6" "7d062fbc4a6b42e3db5c8ad011c8182de69c0521df3f4577f893d9941a7af5e2" "aa72e5b41780bfff2ff55d0cc6fcd4b42153386088a4025fed606c1099c2d9b8" "74a50f18c8c88eac44dc73d7a4c0bbe1f3e72ff5971aac38fcf354ddad0d4733" "5d6cc3e22172f051d68c0c95d79f3dff0e800f2d107f6f6b9220ed5380285c50" "2420401709d448e5999b76005aece99fa3d27e17a6d2312b40636655f0efbc6f" "2f93ebb862a9d50fee9c1b3302d858e2d2c0bba9d4e1be9bb3b08b7373f1710c" "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "d6da24347c813d1635a217d396cf1e3be26484fd4d05be153f3bd2b293d2a0b5" "076ee9f2c64746aac7994b697eb7dbde23ac22988d41ef31b714fc6478fee224" "2b502f6e3bf0cba42fe7bf83a000f2d358a7020a7780a8682fcfed0c9dbffb5f" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "d9864caf2fc6cd9bc5bed941c526a4690bf6c27f0d8c1ca28ff7e05806b57204" "0bcd68ed12fe8a59dfadf8e6eaeb57c390b2937babdf5479c2f5bc90d6c1685b" default))
 '(epg-gpg-program "/usr/bin/gpg2")
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-hl-todo-mode t)
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
 '(marginalia-mode t)
 '(menu-bar-mode nil)
 '(org-export-with-sub-superscripts nil)
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(icomplete-vertical orderless consult marginalia vertico a 0xc emacsql-sqlite forge ztree 0x0 magit-org-todos markdown-mode ssh-config-mode modus-themes nginx-mode highlight-thing systemd yaml-mode solarized-theme rust-mode hl-todo rainbow-delimiters beacon cider company magit cargo lxd-tramp docker docker-compose-mode wgrep clj-refactor dockerfile-mode htmlize symon 0blayout magit-todos jdee smartparens elgrep python-mode php-mode web-mode cider-decompile js2-mode highlight-parentheses))
 '(recentf-mode t)
 '(show-paren-mode t)
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-very-old-color nil)
 '(vertico-mode t)
 '(visible-bell t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(winner-mode t)
 '(word-wrap t))


(load-theme 'modus-operandi-tinted)


;;; General appearance
;;;;;;;;;;;;;;;;;;;;;;

(if window-system (tool-bar-mode 0))
(if window-system (scroll-bar-mode 0))
(if window-system (add-to-list 'initial-frame-alist '(fullscreen . maximized)))
(if window-system (set-frame-parameter nil 'undecorated t))

;; (if window-system (add-hook 'after-init-hook 'global-color-identifiers-mode))
(add-hook 'after-init-hook 'beacon-mode)


;; Make sure there is enough room for a 2 column frame setup where each frame is 130 characters wide:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (display-graphic-p) ;; TODO: Ho-hum, what's the difference between this and `window-system` above?
    (progn
      (set-frame-font "DejaVu Sans Mono-9" nil t)))



;;; General behavior
;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "<C-M-prior>") 'winner-undo)
(global-set-key (kbd "<C-M-next>") 'winner-redo)
(global-set-key (kbd "M-RET") 'toggle-truncate-lines)

;;(global-highlight-parentheses-mode) ;; Colorize nested parens.

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-thing-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(set-variable 'vc-follow-symlinks t)
(set-variable 'scroll-step 1)

;;(add-hook 'before-save-hook 'whitespace-cleanup) ;; No extra whitespace and no tab characters.
(setq-default indent-tabs-mode nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
(setq revert-without-query '("png$")) ;; Makes auto-revert-mode on image files work way better. Tho it still thinks I've been 'editing' the image buffer sometimes. x)

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

(global-set-key "\C-s" 'consult-line)
;; (global-set-key "\C-s" 'isearch-forward)
(global-set-key (kbd "<C-delete>") 'comment-or-uncomment-region)

(global-set-key (kbd "C-|") 'project-switch-project)
(global-set-key (kbd "C-\\") 'project-switch-project)

;; Fast buffer switching
(global-set-key (kbd "<M-next>") 'next-buffer)
(global-set-key (kbd "<M-prior>") 'previous-buffer)

(global-set-key "§" 'other-window) ;; Shift-| or "section sign" symbol. This seems to work better or more consistently in terminal mode. Currently (sep 2021) seems broken in some terminals?
(global-set-key (kbd "M-|") 'other-window) ;; Directly above Tab on Norwegian layouts.
;; (global-set-key (kbd "<backtab>") 'other-window) ;; Magit already uses this..

;; Movement.
(global-set-key (kbd "<C-up>") 'backward-paragraph)
(global-set-key (kbd "<C-down>") 'forward-paragraph)

;; File handling.
(global-set-key (kbd "<f1>") 'find-file)
(global-set-key (kbd "<f2>") (lambda () (interactive)
                               (whitespace-cleanup)
                               (save-excursion
                                 (mark-whole-buffer)
                                 (indent-region (region-beginning) (region-end)))
                               (save-some-buffers 1)))
(global-set-key (kbd "<f3>") 'project-find-file)
(global-set-key (kbd "<f4>") 'consult-buffer)

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
(global-set-key [M-f1] 'consult-git-grep) ;; GUI
(global-set-key [27 f1] 'consult-git-grep) (global-set-key [27 91 49 59 51 112] 'consult-git-grep) ;; CLI modes.

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
          #'(lambda ()
              (setq fill-column 130)
              (setq scroll-conservatively 101))) ;; Without this, the REPL looks like and behaves like crap.
;; (setq cider-print-fn nil) ;; Let nrepl.middleware.print/*print-fn* decide! NOTE: Doesn't actually work!
(setq cider-print-fn 'puget) ;; 'fipp, 'puget, 'pprint or 'zprint
;; For clojure.pprint:
;;(setq cider-print-options '(dict "length" 50 "level" 6 "right-margin" 130))
;; For zprint:
;;(setq cider-print-options '(dict "max-length" 50 "max-depth" 6 "width" 130))
;; For puget:
(setq cider-print-options '(("width" 130)))


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

;; (put 'amap 'clojure-indent-function 1)
;; (put 'areduce 'clojure-indent-function 1)
;; (put 'assoc 'clojure-indent-function 1)
;; (put 'update 'clojure-indent-function 1)
;; (put 'update-in 'clojure-indent-function 1)
(put 'with 'clojure-indent-function 1)
(put 'with1 'clojure-indent-function 1)
(put 'do1 'clojure-indent-function 1)
;; (put 'jqAppend 'clojure-indent-function 1)
;; (put 'whc 'clojure-indent-function 1)
;; (put 'mk-Link 'clojure-indent-function 1)
;; (put 'js-run 'clojure-indent-function 1)
;; (put 'add-rest-initial 'clojure-indent-function 1)
;; (put 'add-rest-head 'clojure-indent-function 1)
(put 'jiter 'clojure-indent-function 1)
(put 'vec-iter 'clojure-indent-function 1)
(put 'doiter 'clojure-indent-function 1)
(put 'seque 'clojure-indent-function 1)
(put 'when-cdebug 'clojure-indent-function 1)
;; re-frame stuff.
(put 'reg-event-db 'clojure-indent-function 1)
(put 'reg-event-fx 'clojure-indent-function 1)
(put 'reg-sub 'clojure-indent-function 1)
(put 'reg-fx 'clojure-indent-function 1)



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
