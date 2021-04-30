# Symlink for /etc/profile.d/
# NOTE: We use +IgnoreUnrecognizedVMOptions because only JVM 14+ has +ShowCodeDetailsInExceptionMessages.
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} -XX:+IgnoreUnrecognizedVMOptions -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -Dclojure.core.async.go-checking=true"
