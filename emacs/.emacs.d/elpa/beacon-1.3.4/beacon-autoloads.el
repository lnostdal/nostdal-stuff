;;; beacon-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "beacon" "../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon.el"
;;;;;;  "bea40dcc4757cefc3f37d6c63678dc09")
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon.el

(autoload 'beacon-blink "beacon" "\
Blink the beacon at the position of the cursor.
Unlike `beacon-blink-automated', the beacon will blink
unconditionally (even if `beacon-mode' is disabled), and this can
be invoked as a user command or called from lisp code." t nil)

(defvar beacon-mode nil "\
Non-nil if Beacon mode is enabled.
See the `beacon-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `beacon-mode'.")

(custom-autoload 'beacon-mode "beacon" nil)

(autoload 'beacon-mode "beacon" "\
Toggle Beacon mode on or off.

If called interactively, enable Beacon mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\\{beacon-mode-map}

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "beacon" "../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "beacon" '("beacon-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/elpa/beacon-1.3.4/beacon.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; beacon-autoloads.el ends here
