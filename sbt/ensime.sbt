import org.ensime.sbt.Plugin.Settings.ensimeConfig

import org.ensime.sbt.util.SExp._

ensimeConfig := sexp(
  key(":compiler-args"), sexp("-feature", "-unchecked", "-deprecation"),
  key(":formatting-prefs"), sexp(
    key(":multilineScaladocCommentsStartOnFirstLine"), true,
    key(":preserveDanglingCloseParenthesis"), true
  )
)
