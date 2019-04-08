;; Suitable for the OpenJ9 JVM.

{:user
 {:global-vars {*warn-on-reflection* true, *unchecked-math* :warn-on-boxed, *print-length* 100}

  :jvm-opts
  ["-Xverify:none" ;; Suppresses the bytecode verifier (which speeds up classloading).
   "-XX:-OmitStackTraceInFastThrow" ;; See http://stackoverflow.com/a/2070568/160305 ..and this is also interesting http://blogs.atlassian.com/2011/05/if_you_use_exceptions_for_path_control_dont_fill_in_the_stac/

   ;; OpenJ9 stuff
   "-Xquickstart"
   ;; TODO: https://github.com/eclipse/openj9/issues/4205
   #=(eval (str "-Xshareclasses:name=" (last (clojure.string/split (System/getenv "PWD") #"/"))))
   ;;"-Xshareclasses:name=darts-common-components"
   "-Xscmx1g"] ;; https://www.eclipse.org/openj9/docs/xscmx/
  }}
