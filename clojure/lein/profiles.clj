{:user
 {:global-vars {*warn-on-reflection* true, *unchecked-math* :warn-on-boxed, *print-length* 100}

  :plugins [[lein-ancient "LATEST"]]

  :jvm-opts
  #=(eval
     (concat
      ["--illegal-access=deny"
       "-XX:-OmitStackTraceInFastThrow" ;; See http://stackoverflow.com/a/2070568/160305 ..and this is also interesting http://blogs.atlassian.com/2011/05/if_you_use_exceptions_for_path_control_dont_fill_in_the_stac/

       ;; VisualVM needs this (ref: https://torsten.io/stdout/how-to-profile-clojure-code/ )
       ;; "-Dcom.sun.management.jmxremote"
       ;; "-Dcom.sun.management.jmxremote.port=43210"
       ;; "-Dcom.sun.management.jmxremote.rmi.port=43210"
       ;; "-Dcom.sun.management.jmxremote.ssl=false"
       ;; "-Dcom.sun.management.jmxremote.authenticate=false"
       ;; "-Dcom.sun.management.jmxremote.local.only=true" ;; Use SSH proxy as mentioned in link above!
       ]

      ;; OpenJ9 stuff
      (when (clojure.string/includes? (System/getProperty "java.vm.name") "OpenJ9")
        ["-Xquickstart"
         ;; TODO: https://github.com/eclipse/openj9/issues/4205
         (str "-Xshareclasses:name=" (last (clojure.string/split (System/getenv "PWD") #"/")))
         "-Xscmx1g" ;; https://www.eclipse.org/openj9/docs/xscmx/
         ])))}}
