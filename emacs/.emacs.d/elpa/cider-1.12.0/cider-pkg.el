(define-package "cider" "1.12.0" "Clojure Interactive Development Environment that Rocks"
  '((emacs "26")
    (clojure-mode "5.18.1")
    (parseedn "1.2.0")
    (queue "0.2")
    (spinner "1.7")
    (seq "2.22")
    (sesman "0.3.2")
    (transient "0.4.1"))
  :commit "2bafc1ec67308de500ce7ce8ac8f79eae449dee8" :authors
  '(("Tim King" . "kingtim@gmail.com")
    ("Phil Hagelberg" . "technomancy@gmail.com")
    ("Bozhidar Batsov" . "bozhidar@batsov.dev")
    ("Artur Malabarba" . "bruce.connor.am@gmail.com")
    ("Hugo Duncan" . "hugo@hugoduncan.org")
    ("Steve Purcell" . "steve@sanityinc.com"))
  :maintainers
  '(("Bozhidar Batsov" . "bozhidar@batsov.dev"))
  :maintainer
  '("Bozhidar Batsov" . "bozhidar@batsov.dev")
  :keywords
  '("languages" "clojure" "cider")
  :url "https://www.github.com/clojure-emacs/cider")
;; Local Variables:
;; no-byte-compile: t
;; End:
