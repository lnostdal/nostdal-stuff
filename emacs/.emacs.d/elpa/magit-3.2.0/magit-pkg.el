(define-package "magit" "3.2.0" "A Git porcelain inside Emacs."
  '((emacs "25.1")
    (dash "2.18.1")
    (git-commit "3.2.0")
    (magit-section "3.2.0")
    (transient "0.3.6")
    (with-editor "3.0.4"))
  :commit "93f03389d055fe1f648b37a85fade85e8635b41c" :authors
  '(("Marius Vollmer" . "marius.vollmer@gmail.com")
    ("Jonas Bernoulli" . "jonas@bernoul.li"))
  :maintainer
  '("Jonas Bernoulli" . "jonas@bernoul.li")
  :keywords
  '("git" "tools" "vc")
  :url "https://github.com/magit/magit")
;; Local Variables:
;; no-byte-compile: t
;; End:
