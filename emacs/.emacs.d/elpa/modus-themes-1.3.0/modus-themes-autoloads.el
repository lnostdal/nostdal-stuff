;;; modus-themes-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads "actual autoloads are elsewhere" "modus-operandi-theme"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-operandi-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-operandi-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modus-operandi-theme" '("modus-operandi")))

;;;***

;;;### (autoloads nil "modus-themes" "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes.el"
;;;;;;  "e1a3e0f447164b10ebd40febf75a2f43")
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes.el

(autoload 'modus-themes-contrast "modus-themes" "\
Measure WCAG contrast ratio between C1 and C2.
C1 and C2 are color values written in hexadecimal RGB.

\(fn C1 C2)" nil nil)

(autoload 'modus-themes-color "modus-themes" "\
Return color value for COLOR from current palette.
COLOR is a key in `modus-themes-operandi-colors' or
`modus-themes-vivendi-colors'.

\(fn COLOR)" nil nil)

(autoload 'modus-themes-color-alts "modus-themes" "\
Return color value from current palette.
When Modus Operandi is enabled, return color value for color
LIGHT-COLOR.  When Modus Vivendi is enabled, return color value
for DARK-COLOR.  LIGHT-COLOR and DARK-COLOR are keys in
`modus-themes-operandi-colors' or `modus-themes-vivendi-colors'.

\(fn LIGHT-COLOR DARK-COLOR)" nil nil)

(autoload 'modus-themes-load-themes "modus-themes" "\
Ensure that the Modus themes are in `custom-enabled-themes'.

This function is intended for use in package declarations such as
those defined with the help of `use-package'.  The idea is to add
this function to the `:init' stage of the package's loading, so
that subsequent calls that assume the presence of a loaded theme,
like `modus-themes-toggle' or `modus-themes-load-operandi', will
continue to work as intended even if they are lazy-loaded (such
as when they are declared in the `:config' phase)." nil nil)

(autoload 'modus-themes-load-operandi "modus-themes" "\
Load `modus-operandi' and disable `modus-vivendi'.
Also run `modus-themes-after-load-theme-hook'." nil nil)

(autoload 'modus-themes-load-vivendi "modus-themes" "\
Load `modus-vivendi' and disable `modus-operandi'.
Also run `modus-themes-after-load-theme-hook'." nil nil)

(autoload 'modus-themes-toggle "modus-themes" "\
Toggle between `modus-operandi' and `modus-vivendi' themes.
Also runs `modus-themes-after-load-theme-hook' at its last stage
by virtue of calling either of `modus-themes-load-operandi' and
`modus-themes-load-vivendi' functions." t nil)

(when load-file-name (let ((dir (file-name-directory load-file-name))) (unless (equal dir (expand-file-name "themes/" data-directory)) (add-to-list 'custom-theme-load-path dir))))

;;;### (autoloads "actual autoloads are elsewhere" "modus-themes"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modus-themes" '("modus-themes-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "modus-vivendi-theme"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-vivendi-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-vivendi-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modus-vivendi-theme" '("modus-vivendi")))

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-operandi-theme.el"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes-pkg.el"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-themes.el"
;;;;;;  "../../../../../../.emacs.d/elpa/modus-themes-1.3.0/modus-vivendi-theme.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; modus-themes-autoloads.el ends here
