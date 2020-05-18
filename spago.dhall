{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "math-tools"
, dependencies =
  [ "console"
  , "effect"
  , "lists"
  , "math"
  , "maybe"
  , "psci-support"
  , "quickcheck"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
